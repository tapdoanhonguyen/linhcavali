    <noscript>
        <div class="alert alert-danger">{LANG.nojs}</div>
    </noscript>
    <header>
        <div class="site-banner" style="background-image: url('{BANNER_SRC}');"></div>
        <div class="section-header-bar">
            <div class="wraper">
                <nav class="header-nav">
                    <div class="header-nav-inner">
                        <div class="contactDefault">
                            [CONTACT_DEFAULT]
                        </div>
                        <div class="social-icons">
                            [SOCIAL_ICONS]
                        </div>
                        <div class="personalArea">
                            [PERSONALAREA]
                        </div>
                    </div>
                    <div id="tip" data-content="">
                        <div class="bg"></div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="section-header">
            <div class="wraper">
                <div id="header">
                    <div class="logo">
                        <a title="{SITE_NAME}" href="{THEME_SITE_HREF}"><img src="{LOGO_SRC}" alt="{SITE_NAME}"></a>
                        <!-- BEGIN: site_name_h1 -->
                        <h1>{SITE_NAME}</h1>
                        <h2>{SITE_DESCRIPTION}</h2>
                        <!-- END: site_name_h1 -->
                        <!-- BEGIN: site_name_span -->
                        <span class="site_name">{SITE_NAME}</span>
                        <span class="site_description">{SITE_DESCRIPTION}</span>
                        <!-- END: site_name_span -->
                    </div>
                    <div class="right-ads">
                        [HEAD_RIGHT]
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="section-nav">
        <div class="wraper">
            <nav class="second-nav" id="menusite">
                <div class="container">
                    <div class="row">
                        <div class="bg box-shadow">
                            [MENU_SITE]
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="section-body">
        <div class="wraper">
            <section>
                <div class="container" id="body">
                    <nav class="third-nav">
                        <div class="row">
                            <div class="bg">
                            <div class="clearfix">
                                <div class="col-xs-24 col-sm-18 col-md-18">
                                    <!-- BEGIN: breadcrumbs -->
                                    <div class="breadcrumbs-wrap">
                                        <div class="display">
                                            <a class="show-subs-breadcrumbs hidden" href="#" data-toggle="showSubBreadcrumbs"><em class="fa fa-lg fa-angle-right"></em></a>
                                            <ul class="breadcrumbs list-none"></ul>
                                        </div>
                                        <ul class="subs-breadcrumbs"></ul>
                                        <ul class="temp-breadcrumbs hidden" itemscope itemtype="https://schema.org/BreadcrumbList">
                                            <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a href="{THEME_SITE_HREF}" itemprop="item" title="{LANG.Home}"><span itemprop="name">{LANG.Home}</span></a><i class="hidden" itemprop="position" content="1"></i></li>
                                            <!-- BEGIN: loop --><li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a href="{BREADCRUMBS.link}" itemprop="item" title="{BREADCRUMBS.title}"><span class="txt" itemprop="name">{BREADCRUMBS.title}</span></a><i class="hidden" itemprop="position" content="{BREADCRUMBS.position}"></i></li><!-- END: loop -->
                                        </ul>
                                    </div>
                                    <!-- END: breadcrumbs -->
                                    <!-- BEGIN: currenttime --><span class="current-time">{NV_CURRENTTIME}</span><!-- END: currenttime -->
                                </div>
								<div class="block block-content">
									<form class="form minisearch" id="search_mini_form" action="https://www.acfc.com.vn/catalogsearch/result/" method="get">
										<div class="field search">
											<label class="label" for="search" data-role="minisearch-label">
												<span>{LANG.search}</span>
											</label>
											<div class="control">
												<input id="search" type="text" name="q" value="" placeholder="{LANG.search}..." class="input-text" maxlength="128" role="combobox" aria-haspopup="false" aria-autocomplete="both" autocomplete="off" aria-expanded="false">
												
													<div id="searchautocomplete" class="searchautocomplete vertically" style="width: 300px; background: rgb(255, 255, 255); color: rgb(0, 0, 0); display: none;">
												<div id="search_autocomplete" class="wpx-search-autocomplete-hidden"></div>
									
									
												<div class="container-autocomplete">
															<div class="prod-container"></div>
														</div>
										</div>


								

													</div>
										</div>
										<div class="actions">
											<button type="submit" title="{LANG.search}" class="action search" aria-label="{LANG.search}">
												<span class="icon"><img src="https://exacdn.acfc.com.vn/static/version1678436277/frontend/Acfc/default/vi_VN/images/icon-search.svg"></span>
											</button>
										</div>
									</form>
								</div>
                                <div class="headerSearch col-xs-24 col-sm-6 col-md-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" maxlength="{NV_MAX_SEARCH_LENGTH}" placeholder="{LANG.search}..."><span class="input-group-btn"><button type="button" class="btn btn-info" data-url="{THEME_SEARCH_URL}" data-minlength="{NV_MIN_SEARCH_LENGTH}" data-click="y"><em class="fa fa-search fa-lg"></em></button></span>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </nav>
                    [THEME_ERROR_INFO]
