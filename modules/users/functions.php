<?php

/**
 * NukeViet Content Management System
 * @version 4.x
 * @author VINADES.,JSC <contact@vinades.vn>
 * @copyright (C) 2009-2022 VINADES.,JSC. All rights reserved
 * @license GNU/GPL version 2 or any later version
 * @see https://github.com/nukeviet The NukeViet CMS GitHub project
 */

if (!defined('NV_SYSTEM')) {
    exit('Stop!!!');
}

define('NV_IS_MOD_USER', true);
define('NV_MOD_TABLE', ($module_data == 'users') ? NV_USERS_GLOBALTABLE : $db_config['prefix'] . '_' . $module_data);

$lang_module['in_groups'] = $lang_global['in_groups'];
require NV_ROOTDIR . '/modules/' . $module_file . '/global.functions.php';

$nv_BotManager->setPrivate();

/**
 * get_checknum()
 *
 * @param mixed $userid
 * @return mixed
 */
function get_checknum($userid)
{
    global $db, $global_config;

    if (!empty($global_config['allowuserloginmulti'])) {
        $checknum = $db->query('SELECT checknum FROM ' . NV_MOD_TABLE . ' WHERE userid = ' . $userid)->fetchColumn();
        if (!empty($checknum)) {
            return $checknum;
        }
    }

    return md5(nv_genpass(10));
}

/**
 * validUserLog()
 *
 * @param array $array_user
 * @param int   $remember
 * @param array $oauth_data
 * @param int   $current_mode
 * @throws PDOException
 */
function validUserLog($array_user, $remember, $oauth_data, $current_mode = 0)
{
    global $db, $global_config, $nv_Request, $lang_module, $global_users_config, $module_name, $client_info;

    $remember = (int) $remember;
    $checknum = get_checknum($array_user['userid']);
    $opid = empty($oauth_data) ? '' : $oauth_data['id'];
    $user = [
        'userid' => $array_user['userid'],
        'current_mode' => $current_mode,
        'checknum' => $checknum,
        'checkhash' => md5($array_user['userid'] . $checknum . $global_config['sitekey'] . $client_info['clid']),
        'current_agent' => NV_USER_AGENT,
        'prev_agent' => $array_user['last_agent'],
        'current_ip' => NV_CLIENT_IP,
        'prev_ip' => $array_user['last_ip'],
        'current_login' => NV_CURRENTTIME,
        'prev_login' => (int) ($array_user['last_login']),
        'prev_openid' => $array_user['last_openid'],
        'current_openid' => $opid,
        'language' => $array_user['language']
    ];

    $stmt = $db->prepare('UPDATE ' . NV_MOD_TABLE . ' SET
        checknum = :checknum,
        last_login = ' . NV_CURRENTTIME . ',
        last_ip = :last_ip,
        last_agent = :last_agent,
        last_openid = :opid,
        remember = ' . $remember . '
        WHERE userid=' . $array_user['userid']);

    $stmt->bindValue(':checknum', $checknum, PDO::PARAM_STR);
    $stmt->bindValue(':last_ip', NV_CLIENT_IP, PDO::PARAM_STR);
    $stmt->bindValue(':last_agent', NV_USER_AGENT, PDO::PARAM_STR);
    $stmt->bindValue(':opid', $opid, PDO::PARAM_STR);
    $stmt->execute();

    if ($global_config['allowuserloginmulti']) {
        $db->query('DELETE FROM ' . NV_MOD_TABLE . '_login WHERE userid=' . $array_user['userid'] . ' AND clid=' . $db->quote($client_info['clid']));
    } else {
        $db->query('DELETE FROM ' . NV_MOD_TABLE . '_login WHERE userid=' . $array_user['userid']);
    }

    $sth = $db->prepare('INSERT INTO ' . NV_MOD_TABLE . '_login 
        (userid, clid, logtime, mode, agent, ip, openid) VALUES 
        (' . $array_user['userid'] . ', :clid, ' . NV_CURRENTTIME . ', ' . $current_mode . ', :agent, :ip, :openid)');
    $sth->bindValue(':clid', $client_info['clid'], PDO::PARAM_STR);
    $sth->bindValue(':agent', NV_USER_AGENT, PDO::PARAM_STR);
    $sth->bindValue(':ip', NV_CLIENT_IP, PDO::PARAM_STR);
    $sth->bindValue(':openid', $opid, PDO::PARAM_STR);
    $sth->execute();

    NukeViet\Core\User::set_userlogin_hash($user, $remember);

    // Tạo thông báo đẩy nếu đăng nhập lần đầu
    if (empty($array_user['last_login'])) {
        add_push([
            'receiver_ids' => [$array_user['userid']],
            'message' => sprintf($lang_module['welcome_new_account'], $global_config['site_name']),
            'link' => nv_url_rewrite(NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name, true)
        ]);
    }

    if (!empty($global_users_config['active_user_logs'])) {
        $log_message = $opid ? ($lang_module['userloginviaopt'] . ' ' . $oauth_data['provider']) : $lang_module['st_login'];
        nv_insert_logs(NV_LANG_DATA, $module_name, '[' . $array_user['username'] . '] ' . $log_message, ' Client IP:' . NV_CLIENT_IP, 0);
    }
}

/**
 * updateUserCookie()
 *
 * @param mixed $newValues
 */
function updateUserCookie($newValues)
{
    global $db, $user_info, $user_cookie;

    if (!empty($user_cookie)) {
        $isUpdate = false;
        if (!empty($newValues)) {
            foreach ($newValues as $key => $value) {
                if (isset($user_cookie[$key]) and $value != $user_cookie[$key]) {
                    $user_cookie[$key] = $value;
                    $isUpdate = true;
                }
            }
        }
        if ($isUpdate) {
            $remember = (int) $db->query('SELECT remember FROM ' . NV_MOD_TABLE . ' WHERE userid=' . $user_info['userid'] . ' AND active=1')->fetchColumn();
            NukeViet\Core\User::set_userlogin_hash($user_cookie, $remember);
        }
    }
}

/**
 * nv_check_email_reg()
 * Ham kiem tra email kha dung
 *
 * @param mixed $email
 */
function nv_check_email_reg(&$email)
{
    global $db, $lang_module, $global_users_config, $global_config;

    $error = nv_check_valid_email($email, true);
    $email = $error[1];
    if ($error[0] != '') {
        return preg_replace('/\&(l|r)dquo\;/', '', strip_tags($error[0]));
    }

    if (!empty($global_users_config['deny_email']) and preg_match('/' . $global_users_config['deny_email'] . '/i', $email)) {
        return sprintf($lang_module['email_deny_name'], $email);
    }

    if (!empty($global_config['email_dot_equivalent'])) {
        list($left, $right) = explode('@', $email);
        $left = preg_replace('/[\.]+/', '', $left);
        $pattern = str_split($left);
        $pattern = implode('.?', $pattern);
        $pattern = '^' . $pattern . '@' . $right . '$';

        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . ' WHERE email RLIKE :pattern');
        $stmt->bindParam(':pattern', $pattern, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }

        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . '_reg WHERE email RLIKE :pattern');
        $stmt->bindParam(':pattern', $pattern, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }

        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . '_openid WHERE email RLIKE :pattern');
        $stmt->bindParam(':pattern', $pattern, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }
    } else {
        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . ' WHERE email = :email');
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }

        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . '_reg WHERE email = :email');
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }

        $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . '_openid WHERE email = :email');
        $stmt->bindParam(':email', $email, PDO::PARAM_STR);
        $stmt->execute();
        if ($stmt->fetchColumn()) {
            return sprintf($lang_module['email_registered_name'], $email);
        }
    }

    return '';
}

/**
 * nv_check_username_reg()
 * Ham kiem tra ten dang nhap kha dung
 *
 * @param mixed $login
 */
function nv_check_username_reg($login)
{
    global $db, $lang_module, $global_users_config, $global_config;

    $error = nv_check_valid_login($login, $global_config['nv_unickmax'], $global_config['nv_unickmin']);
    if ($error != '') {
        return preg_replace('/\&(l|r)dquo\;/', '', strip_tags($error));
    }
    if ("'" . $login . "'" != $db->quote($login)) {
        return sprintf($lang_module['account_deny_name'], $login);
    }

    if (!empty($global_users_config['deny_name']) and preg_match('/' . $global_users_config['deny_name'] . '/i', $login)) {
        return sprintf($lang_module['account_deny_name'], $login);
    }

    $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . ' WHERE username LIKE :username OR md5username= :md5username');
    $stmt->bindValue(':username', $login, PDO::PARAM_STR);
    $stmt->bindValue(':md5username', nv_md5safe($login), PDO::PARAM_STR);
    $stmt->execute();
    if ($stmt->fetchColumn()) {
        return sprintf($lang_module['account_registered_name'], $login);
    }

    $stmt = $db->prepare('SELECT userid FROM ' . NV_MOD_TABLE . '_reg WHERE username LIKE :username OR md5username= :md5username');
    $stmt->bindValue(':username', $login, PDO::PARAM_STR);
    $stmt->bindValue(':md5username', nv_md5safe($login), PDO::PARAM_STR);
    $stmt->execute();
    if ($stmt->fetchColumn()) {
        return sprintf($lang_module['account_registered_name'], $login);
    }

    return '';
}

/**
 * nv_del_user()
 *
 * @param int $userid
 * @return int
 * @throws PDOException
 */
function nv_del_user($userid)
{
    global $db, $global_config, $module_name, $user_info, $lang_module;

    $sql = 'SELECT group_id, username, first_name, last_name, email, photo, in_groups, idsite FROM ' . NV_MOD_TABLE . ' WHERE userid=' . $userid;
    $row = $db->query($sql)->fetch(3);
    if (empty($row)) {
        $return = 0;
    }

    list($group_id, $username, $first_name, $last_name, $email, $photo, $in_groups, $idsite) = $row;

    if ($global_config['idsite'] > 0 and $idsite != $global_config['idsite']) {
        return 0;
    }

    $query = $db->query('SELECT COUNT(*) FROM ' . NV_MOD_TABLE . '_groups_users WHERE group_id IN (1,2,3) AND userid=' . $userid);
    if ($query->fetchColumn()) {
        return 0;
    }
    $userdelete = (!empty($first_name)) ? $first_name . ' (' . $username . ')' : $username;

    $result = $db->exec('DELETE FROM ' . NV_MOD_TABLE . ' WHERE userid=' . $userid);
    if (!$result) {
        return 0;
    }

    $in_groups = array_map('intval', explode(',', $in_groups));

    $db->query('UPDATE ' . NV_MOD_TABLE . '_groups SET numbers = numbers-1 WHERE group_id IN (SELECT group_id FROM ' . NV_MOD_TABLE . '_groups_users WHERE userid=' . $userid . ' AND approved = 1)');
    $db->query('UPDATE ' . NV_MOD_TABLE . '_groups SET numbers = numbers-1 WHERE group_id=' . (($group_id == 7 or in_array(7, $in_groups, true)) ? 7 : 4));
    $db->query('DELETE FROM ' . NV_MOD_TABLE . '_groups_users WHERE userid=' . $userid);
    $db->query('DELETE FROM ' . NV_MOD_TABLE . '_openid WHERE userid=' . $userid);
    $db->query('DELETE FROM ' . NV_MOD_TABLE . '_info WHERE userid=' . $userid);

    nv_insert_logs(NV_LANG_DATA, $module_name, 'log_del_user', 'userid ' . $userid, $user_info['userid']);

    if (!empty($photo) and is_file(NV_ROOTDIR . '/' . $photo)) {
        @nv_deletefile(NV_ROOTDIR . '/' . $photo);
    }

    $subject = $lang_module['delconfirm_email_title'];
    $message = sprintf($lang_module['delconfirm_email_content'], $userdelete, $global_config['site_name']);
    $message = nl2br($message);
    nv_sendmail_async([$global_config['site_name'], $global_config['site_email']], $email, $subject, $message);

    return $userid;
}

/**
 * opidr_login()
 *
 * @param array $openid_info
 */
function opidr_login($openid_info)
{
    global $nv_Request, $nv_redirect, $module_data;

    $nv_Request->unset_request('openid_attribs', 'session');

    $openid_info['redirect'] = nv_redirect_decrypt($nv_redirect);
    $openid_info['client'] = '';

    if (defined('SSO_REGISTER_SECRET')) {
        $sso_client = $nv_Request->get_title('sso_client_' . $module_data, 'session', '');
        $sso_redirect = $nv_Request->get_title('sso_redirect_' . $module_data, 'session', '');
        $iv = substr(SSO_REGISTER_SECRET, 0, 16);
        $sso_redirect = strtr($sso_redirect, '-_,', '+/=');
        $sso_redirect = openssl_decrypt($sso_redirect, 'aes-256-cbc', SSO_REGISTER_SECRET, 0, $iv);

        if (!empty($sso_redirect) and !empty($sso_client) and str_starts_with($sso_redirect, $sso_client)) {
            $openid_info['redirect'] = $sso_redirect;
            $openid_info['client'] = $sso_client;
        }

        $nv_Request->unset_request('sso_client_' . $module_data, 'session');
        $nv_Request->unset_request('sso_redirect_' . $module_data, 'session');
    }

    $contents = openid_callback($openid_info);

    include NV_ROOTDIR . '/includes/header.php';
    echo nv_site_theme($contents, false);
    include NV_ROOTDIR . '/includes/footer.php';
}

/**
 * checkLoginName()
 *
 * @param string $type
 * @param string $name
 * @return mixed
 */
function checkLoginName($type, $name)
{
    global $db;

    $type != 'email' && $type = 'username';
    if ($type == 'email') {
        $where = 'email =' . $db->quote($name);
    } else {
        $where = 'md5username =' . $db->quote(nv_md5safe($name));
    }

    $row = $db->query('SELECT * FROM ' . NV_MOD_TABLE . ' WHERE ' . $where)->fetch();
    if (empty($row[$type])) {
        return false;
    }

    if (strcmp($row[$type], $name) !== 0) {
        return false;
    }

    return $row;
}

$group_id = 0;
if (defined('NV_IS_USER') and isset($array_op[0]) and isset($array_op[1]) and ($array_op[0] == 'register' or $array_op[0] == 'editinfo')) {
    $sql = 'SELECT g.group_id, d.title, g.config FROM ' . NV_MOD_TABLE . '_groups AS g LEFT JOIN ' . NV_MOD_TABLE . "_groups_detail d ON ( g.group_id = d.group_id AND d.lang='" . NV_LANG_DATA . "' )";
    $_query = $db->query($sql);
    $group_lists = [];
    while ($_row = $_query->fetch()) {
        $group_lists[$_row['group_id']] = $_row;
    }

    //$group_lists = $nv_Cache->db($sql, 'group_id', $module_name);

    if (isset($group_lists[$array_op[1]])) { // trường hợp trưởng nhóm truy cập sửa thông tin member thì $array_op[1]= group_id
        $result = $db->query('SELECT group_id FROM ' . NV_MOD_TABLE . '_groups_users WHERE group_id = ' . $array_op[1] . ' AND userid = ' . $user_info['userid'] . ' AND is_leader = 1');

        if ($row = $result->fetch()) {
            $group = $group_lists[$row['group_id']];
            $group['config'] = unserialize($group['config']);

            if ($group['config']['access_addus'] and $array_op[0] == 'register') { // đăng kí
                $op = 'register';
                $module_info['funcs'][$op] = $sys_mods[$module_name]['funcs'][$op];
                $group_id = $row['group_id'];
                define('ACCESS_ADDUS', $group['config']['access_addus']);
            } elseif ($group['config']['access_editus'] and $array_op[0] == 'editinfo') { // sửa thông tin
                $group_id = $row['group_id'];

                $result = $db->query('SELECT group_id FROM ' . NV_MOD_TABLE . '_groups_users
                        WHERE group_id = ' . $group_id . ' and userid = ' . $array_op[2] . ' and is_leader = 0');

                if ($row = $result->fetch()) { // nếu tài khoản nằm trong nhóm đó thì được quyền sửa
                    $userid = $array_op[2];

                    if ($group['config']['access_passus']) {
                        define('ACCESS_PASSUS', $group['config']['access_passus']);
                    }
                    define('ACCESS_EDITUS', $group['config']['access_editus']);
                }
            }
        }
    }
}
