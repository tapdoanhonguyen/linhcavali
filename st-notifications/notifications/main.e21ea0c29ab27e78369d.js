/*! For license information please see main.e21ea0c29ab27e78369d.js.LICENSE.txt */
(()=>{var t={192:(t,e,r)=>{"use strict";r(725);const n=ReactDOM;var o=r.n(n);function i(t,e){(null==e||e>t.length)&&(e=t.length);for(var r=0,n=new Array(e);r<e;r++)n[r]=t[r];return n}function a(t,e){if(t){if("string"==typeof t)return i(t,e);var r=Object.prototype.toString.call(t).slice(8,-1);return"Object"===r&&t.constructor&&(r=t.constructor.name),"Map"===r||"Set"===r?Array.from(t):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?i(t,e):void 0}}function c(t){return function(t){if(Array.isArray(t))return i(t)}(t)||function(t){if("undefined"!=typeof Symbol&&null!=t[Symbol.iterator]||null!=t["@@iterator"])return Array.from(t)}(t)||a(t)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function u(t,e,r){return e in t?Object.defineProperty(t,e,{value:r,enumerable:!0,configurable:!0,writable:!0}):t[e]=r,t}function l(t,e,r,n,o,i,a){try{var c=t[i](a),u=c.value}catch(t){return void r(t)}c.done?e(u):Promise.resolve(u).then(n,o)}function s(t){return function(){var e=this,r=arguments;return new Promise((function(n,o){var i=t.apply(e,r);function a(t){l(i,n,o,a,c,"next",t)}function c(t){l(i,n,o,a,c,"throw",t)}a(void 0)}))}}var f=r(687),p=r.n(f),y=r(363);function d(){return d=Object.assign||function(t){for(var e=1;e<arguments.length;e++){var r=arguments[e];for(var n in r)Object.prototype.hasOwnProperty.call(r,n)&&(t[n]=r[n])}return t},d.apply(this,arguments)}function h(t,e,r,n,o,i,a){try{var c=t[i](a),u=c.value}catch(t){return void r(t)}c.done?e(u):Promise.resolve(u).then(n,o)}function v(t){return function(){var e=this,r=arguments;return new Promise((function(n,o){var i=t.apply(e,r);function a(t){h(i,n,o,a,c,"next",t)}function c(t){h(i,n,o,a,c,"throw",t)}a(void 0)}))}}function m(t,e){(null==e||e>t.length)&&(e=t.length);for(var r=0,n=new Array(e);r<e;r++)n[r]=t[r];return n}function b(t,e){return function(t){if(Array.isArray(t))return t}(t)||function(t,e){var r=null==t?null:"undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(null!=r){var n,o,i=[],a=!0,c=!1;try{for(r=r.call(t);!(a=(n=r.next()).done)&&(i.push(n.value),!e||i.length!==e);a=!0);}catch(t){c=!0,o=t}finally{try{a||null==r.return||r.return()}finally{if(c)throw o}}return i}}(t,e)||function(t,e){if(t){if("string"==typeof t)return m(t,e);var r=Object.prototype.toString.call(t).slice(8,-1);return"Object"===r&&t.constructor&&(r=t.constructor.name),"Map"===r||"Set"===r?Array.from(t):"Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)?m(t,e):void 0}}(t,e)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}var g=function(t){return t.replace(/([-_][a-z])/g,(function(t){return t.toUpperCase().replace("-","").replace("_","")}))},w=function(t,e,n,o){return v(p().mark((function i(){var a,c,u;return p().wrap((function(i){for(;;)switch(i.prev=i.next){case 0:return i.next=2,r.I("module-federation");case 2:return a=window[t],i.next=5,a.init(r.S.default);case 5:return i.next=7,window[t].get("./".concat(e));case 7:return c=i.sent,u=c(),"function"==typeof o&&o({module:e,micro:n}),i.abrupt("return",u);case 11:case"end":return i.stop()}}),i)})))};function O(t,e){var r=t.micro,n=t.module,o=t.children,i=t.fallback,a=void 0===i?null:i,c=t.onLoaded,u=t.onImported,l=b((0,y.useState)(),2),s=l[0],f=l[1],h=function(t){var e=b((0,y.useState)(!1),2),r=e[0],n=e[1];return(0,y.useEffect)((function(){if(t){if(!window.moduleFederationCache.has(t)){var e=document.createElement("script");return e.src=t,e.type="text/javascript",e.async=!0,e.onload=function(){window.moduleFederationCache.add(t),n(!0)},document.head.appendChild(e),function(){window.moduleFederationCache.delete(t),document.head.removeChild(e),e.onload=void 0}}n(!0)}}),[t]),{ready:r}}(function(t){var e=b(t.split("/"),2),r=e[0],n=e[1],o="".concat(g(r)).concat(n?"/".concat(n):"");return"".concat(window.appUrl,"/st-").concat(r,"/").concat(o,"/remoteEntry.js")}(r)),m=h.ready,O=function(){var t=v(p().mark((function t(){var e,o,i;return p().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(!m||s){t.next=7;break}return e=r.split("/")[0],o=w(g(e),n,r,u),t.next=5,o();case 5:i=t.sent,f((function(){return i.default}));case 7:case"end":return t.stop()}}),t)})));return function(){return t.apply(this,arguments)}}();return(0,y.useEffect)((function(){O()}),[m]),(0,y.useEffect)((function(){m&&s&&c&&c({micro:r,module:n})}),[m,s]),s?React.createElement(s,d({ref:e},t),o):a}window.moduleFederationCache=window.moduleFederationCache||new Set;var x=(0,y.forwardRef)(O),j=r(893);function S(t,e){var r=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),r.push.apply(r,n)}return r}function E(t){return(0,j.jsx)(x,function(t){for(var e=1;e<arguments.length;e++){var r=null!=arguments[e]?arguments[e]:{};e%2?S(Object(r),!0).forEach((function(e){u(t,e,r[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(r)):S(Object(r)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(r,e))}))}return t}({micro:"fukku",module:"mng-snackbar"},t))}const _=function(){var t=s(p().mark((function t(e){var r,n,o,i,a,c,u,l;return p().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return r=e.icon,n=e.title,o=e.subtitle,i=e.button,a=e.type,c=e.delay,u=void 0===c?3e3:c,t.next=3,window.verne.labels.getByLabelIds(["accessibility.".concat(a,".icon"),"accessibility.snackbar.close.button"]);case 3:return l=t.sent,t.abrupt("return",{id:"mng-notifications",icon:r,title:n,subtitle:o,delay:u,type:a,textButton:null==i?void 0:i.text,onClick:null==i?void 0:i.onClick,isLink:null==i?void 0:i.isLink,isSubmit:null==i?void 0:i.isSubmit,"data-testid":a,iconAriaLabel:l["accessibility.info.icon"],accessibleCloseText:l["accessibility.snackbar.close.button"]});case 5:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}();function P(t,e){var r=Object.keys(t);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(t);e&&(n=n.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),r.push.apply(r,n)}return r}function L(t){for(var e=1;e<arguments.length;e++){var r=null!=arguments[e]?arguments[e]:{};e%2?P(Object(r),!0).forEach((function(e){u(t,e,r[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(r)):P(Object(r)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(r,e))}))}return t}const k=function(){var t,e,r=(t=(0,y.useState)(!1),e=2,function(t){if(Array.isArray(t))return t}(t)||function(t,e){var r=null==t?null:"undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(null!=r){var n,o,i=[],a=!0,c=!1;try{for(r=r.call(t);!(a=(n=r.next()).done)&&(i.push(n.value),!e||i.length!==e);a=!0);}catch(t){c=!0,o=t}finally{try{a||null==r.return||r.return()}finally{if(c)throw o}}return i}}(t,e)||a(t,e)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()),n=r[0],o=r[1],i=(0,y.useRef)(),u=(0,y.useRef)([]),l=function(){return document.getElementById("iris-button")},f=function(){var t=s(p().mark((function t(e,r){var a;return p().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:if(n){t.next=9;break}return t.next=3,_(L(L({},e),{},{type:r}));case 3:i.current=t.sent,(a=l())&&(a.style.display="none"),o(!0),t.next=10;break;case 9:u.current=[].concat(c(u.current),[L(L({},e),{},{type:r})]);case 10:case"end":return t.stop()}}),t)})));return function(e,r){return t.apply(this,arguments)}}();return(0,y.useEffect)((function(){if(!n&&u.current.length){var t=function(){var t=s(p().mark((function t(){var e;return p().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return e=u.current[0],t.next=3,f(e,e.type);case 3:u.current=u.current.splice(1);case 4:case"end":return t.stop()}}),t)})));return function(){return t.apply(this,arguments)}}();t()}window.notification={info:function(t){return f(t,"info")},error:function(t){return f(t,"error")}}}),[n]),n?(0,j.jsx)(E,L({onClose:function(){var t=l();t&&(t.style.display="flex"),o(!1)}},i.current)):null};window.render_notifications=function(){o().render((0,j.jsx)(k,{}),document.getElementById("notifications"))}},725:t=>{t.exports=""},418:t=>{"use strict";var e=Object.getOwnPropertySymbols,r=Object.prototype.hasOwnProperty,n=Object.prototype.propertyIsEnumerable;function o(t){if(null==t)throw new TypeError("Object.assign cannot be called with null or undefined");return Object(t)}t.exports=function(){try{if(!Object.assign)return!1;var t=new String("abc");if(t[5]="de","5"===Object.getOwnPropertyNames(t)[0])return!1;for(var e={},r=0;r<10;r++)e["_"+String.fromCharCode(r)]=r;if("0123456789"!==Object.getOwnPropertyNames(e).map((function(t){return e[t]})).join(""))return!1;var n={};return"abcdefghijklmnopqrst".split("").forEach((function(t){n[t]=t})),"abcdefghijklmnopqrst"===Object.keys(Object.assign({},n)).join("")}catch(t){return!1}}()?Object.assign:function(t,i){for(var a,c,u=o(t),l=1;l<arguments.length;l++){for(var s in a=Object(arguments[l]))r.call(a,s)&&(u[s]=a[s]);if(e){c=e(a);for(var f=0;f<c.length;f++)n.call(a,c[f])&&(u[c[f]]=a[c[f]])}}return u}},251:(t,e,r)=>{"use strict";r(418);var n=r(363),o=60103;if("function"==typeof Symbol&&Symbol.for){var i=Symbol.for;o=i("react.element"),i("react.fragment")}var a=n.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.ReactCurrentOwner,c=Object.prototype.hasOwnProperty,u={key:!0,ref:!0,__self:!0,__source:!0};e.jsx=function(t,e,r){var n,i={},l=null,s=null;for(n in void 0!==r&&(l=""+r),void 0!==e.key&&(l=""+e.key),void 0!==e.ref&&(s=e.ref),e)c.call(e,n)&&!u.hasOwnProperty(n)&&(i[n]=e[n]);if(t&&t.defaultProps)for(n in e=t.defaultProps)void 0===i[n]&&(i[n]=e[n]);return{$$typeof:o,type:t,key:l,ref:s,props:i,_owner:a.current}}},893:(t,e,r)=>{"use strict";t.exports=r(251)},363:t=>{"use strict";t.exports=React},61:(t,e,r)=>{var n=r(698).default;function o(){"use strict";t.exports=o=function(){return e},t.exports.__esModule=!0,t.exports.default=t.exports;var e={},r=Object.prototype,i=r.hasOwnProperty,a=Object.defineProperty||function(t,e,r){t[e]=r.value},c="function"==typeof Symbol?Symbol:{},u=c.iterator||"@@iterator",l=c.asyncIterator||"@@asyncIterator",s=c.toStringTag||"@@toStringTag";function f(t,e,r){return Object.defineProperty(t,e,{value:r,enumerable:!0,configurable:!0,writable:!0}),t[e]}try{f({},"")}catch(t){f=function(t,e,r){return t[e]=r}}function p(t,e,r,n){var o=e&&e.prototype instanceof h?e:h,i=Object.create(o.prototype),c=new L(n||[]);return a(i,"_invoke",{value:S(t,r,c)}),i}function y(t,e,r){try{return{type:"normal",arg:t.call(e,r)}}catch(t){return{type:"throw",arg:t}}}e.wrap=p;var d={};function h(){}function v(){}function m(){}var b={};f(b,u,(function(){return this}));var g=Object.getPrototypeOf,w=g&&g(g(k([])));w&&w!==r&&i.call(w,u)&&(b=w);var O=m.prototype=h.prototype=Object.create(b);function x(t){["next","throw","return"].forEach((function(e){f(t,e,(function(t){return this._invoke(e,t)}))}))}function j(t,e){function r(o,a,c,u){var l=y(t[o],t,a);if("throw"!==l.type){var s=l.arg,f=s.value;return f&&"object"==n(f)&&i.call(f,"__await")?e.resolve(f.__await).then((function(t){r("next",t,c,u)}),(function(t){r("throw",t,c,u)})):e.resolve(f).then((function(t){s.value=t,c(s)}),(function(t){return r("throw",t,c,u)}))}u(l.arg)}var o;a(this,"_invoke",{value:function(t,n){function i(){return new e((function(e,o){r(t,n,e,o)}))}return o=o?o.then(i,i):i()}})}function S(t,e,r){var n="suspendedStart";return function(o,i){if("executing"===n)throw new Error("Generator is already running");if("completed"===n){if("throw"===o)throw i;return{value:void 0,done:!0}}for(r.method=o,r.arg=i;;){var a=r.delegate;if(a){var c=E(a,r);if(c){if(c===d)continue;return c}}if("next"===r.method)r.sent=r._sent=r.arg;else if("throw"===r.method){if("suspendedStart"===n)throw n="completed",r.arg;r.dispatchException(r.arg)}else"return"===r.method&&r.abrupt("return",r.arg);n="executing";var u=y(t,e,r);if("normal"===u.type){if(n=r.done?"completed":"suspendedYield",u.arg===d)continue;return{value:u.arg,done:r.done}}"throw"===u.type&&(n="completed",r.method="throw",r.arg=u.arg)}}}function E(t,e){var r=t.iterator[e.method];if(void 0===r){if(e.delegate=null,"throw"===e.method){if(t.iterator.return&&(e.method="return",e.arg=void 0,E(t,e),"throw"===e.method))return d;e.method="throw",e.arg=new TypeError("The iterator does not provide a 'throw' method")}return d}var n=y(r,t.iterator,e.arg);if("throw"===n.type)return e.method="throw",e.arg=n.arg,e.delegate=null,d;var o=n.arg;return o?o.done?(e[t.resultName]=o.value,e.next=t.nextLoc,"return"!==e.method&&(e.method="next",e.arg=void 0),e.delegate=null,d):o:(e.method="throw",e.arg=new TypeError("iterator result is not an object"),e.delegate=null,d)}function _(t){var e={tryLoc:t[0]};1 in t&&(e.catchLoc=t[1]),2 in t&&(e.finallyLoc=t[2],e.afterLoc=t[3]),this.tryEntries.push(e)}function P(t){var e=t.completion||{};e.type="normal",delete e.arg,t.completion=e}function L(t){this.tryEntries=[{tryLoc:"root"}],t.forEach(_,this),this.reset(!0)}function k(t){if(t){var e=t[u];if(e)return e.call(t);if("function"==typeof t.next)return t;if(!isNaN(t.length)){var r=-1,n=function e(){for(;++r<t.length;)if(i.call(t,r))return e.value=t[r],e.done=!1,e;return e.value=void 0,e.done=!0,e};return n.next=n}}return{next:I}}function I(){return{value:void 0,done:!0}}return v.prototype=m,a(O,"constructor",{value:m,configurable:!0}),a(m,"constructor",{value:v,configurable:!0}),v.displayName=f(m,s,"GeneratorFunction"),e.isGeneratorFunction=function(t){var e="function"==typeof t&&t.constructor;return!!e&&(e===v||"GeneratorFunction"===(e.displayName||e.name))},e.mark=function(t){return Object.setPrototypeOf?Object.setPrototypeOf(t,m):(t.__proto__=m,f(t,s,"GeneratorFunction")),t.prototype=Object.create(O),t},e.awrap=function(t){return{__await:t}},x(j.prototype),f(j.prototype,l,(function(){return this})),e.AsyncIterator=j,e.async=function(t,r,n,o,i){void 0===i&&(i=Promise);var a=new j(p(t,r,n,o),i);return e.isGeneratorFunction(r)?a:a.next().then((function(t){return t.done?t.value:a.next()}))},x(O),f(O,s,"Generator"),f(O,u,(function(){return this})),f(O,"toString",(function(){return"[object Generator]"})),e.keys=function(t){var e=Object(t),r=[];for(var n in e)r.push(n);return r.reverse(),function t(){for(;r.length;){var n=r.pop();if(n in e)return t.value=n,t.done=!1,t}return t.done=!0,t}},e.values=k,L.prototype={constructor:L,reset:function(t){if(this.prev=0,this.next=0,this.sent=this._sent=void 0,this.done=!1,this.delegate=null,this.method="next",this.arg=void 0,this.tryEntries.forEach(P),!t)for(var e in this)"t"===e.charAt(0)&&i.call(this,e)&&!isNaN(+e.slice(1))&&(this[e]=void 0)},stop:function(){this.done=!0;var t=this.tryEntries[0].completion;if("throw"===t.type)throw t.arg;return this.rval},dispatchException:function(t){if(this.done)throw t;var e=this;function r(r,n){return a.type="throw",a.arg=t,e.next=r,n&&(e.method="next",e.arg=void 0),!!n}for(var n=this.tryEntries.length-1;n>=0;--n){var o=this.tryEntries[n],a=o.completion;if("root"===o.tryLoc)return r("end");if(o.tryLoc<=this.prev){var c=i.call(o,"catchLoc"),u=i.call(o,"finallyLoc");if(c&&u){if(this.prev<o.catchLoc)return r(o.catchLoc,!0);if(this.prev<o.finallyLoc)return r(o.finallyLoc)}else if(c){if(this.prev<o.catchLoc)return r(o.catchLoc,!0)}else{if(!u)throw new Error("try statement without catch or finally");if(this.prev<o.finallyLoc)return r(o.finallyLoc)}}}},abrupt:function(t,e){for(var r=this.tryEntries.length-1;r>=0;--r){var n=this.tryEntries[r];if(n.tryLoc<=this.prev&&i.call(n,"finallyLoc")&&this.prev<n.finallyLoc){var o=n;break}}o&&("break"===t||"continue"===t)&&o.tryLoc<=e&&e<=o.finallyLoc&&(o=null);var a=o?o.completion:{};return a.type=t,a.arg=e,o?(this.method="next",this.next=o.finallyLoc,d):this.complete(a)},complete:function(t,e){if("throw"===t.type)throw t.arg;return"break"===t.type||"continue"===t.type?this.next=t.arg:"return"===t.type?(this.rval=this.arg=t.arg,this.method="return",this.next="end"):"normal"===t.type&&e&&(this.next=e),d},finish:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.finallyLoc===t)return this.complete(r.completion,r.afterLoc),P(r),d}},catch:function(t){for(var e=this.tryEntries.length-1;e>=0;--e){var r=this.tryEntries[e];if(r.tryLoc===t){var n=r.completion;if("throw"===n.type){var o=n.arg;P(r)}return o}}throw new Error("illegal catch attempt")},delegateYield:function(t,e,r){return this.delegate={iterator:k(t),resultName:e,nextLoc:r},"next"===this.method&&(this.arg=void 0),d}},e}t.exports=o,t.exports.__esModule=!0,t.exports.default=t.exports},698:t=>{function e(r){return t.exports=e="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t.exports.__esModule=!0,t.exports.default=t.exports,e(r)}t.exports=e,t.exports.__esModule=!0,t.exports.default=t.exports},687:(t,e,r)=>{var n=r(61)();t.exports=n;try{regeneratorRuntime=n}catch(t){"object"==typeof globalThis?globalThis.regeneratorRuntime=n:Function("r","regeneratorRuntime = r")(n)}}},e={};function r(n){var o=e[n];if(void 0!==o)return o.exports;var i=e[n]={exports:{}};return t[n](i,i.exports,r),i.exports}r.m=t,r.c=e,r.n=t=>{var e=t&&t.__esModule?()=>t.default:()=>t;return r.d(e,{a:e}),e},r.d=(t,e)=>{for(var n in e)r.o(e,n)&&!r.o(t,n)&&Object.defineProperty(t,n,{enumerable:!0,get:e[n]})},r.o=(t,e)=>Object.prototype.hasOwnProperty.call(t,e),(()=>{r.S={};var t={},e={};r.I=(n,o)=>{o||(o=[]);var i=e[n];if(i||(i=e[n]={}),!(o.indexOf(i)>=0)){if(o.push(i),t[n])return t[n];r.o(r.S,n)||(r.S[n]={}),r.S[n];var a=[];return t[n]=a.length?Promise.all(a).then((()=>t[n]=1)):1}}})(),r(192)})();