(function(e){function t(t){for(var o,a,i=t[0],p=t[1],c=t[2],d=0,_=[];d<i.length;d++)a=i[d],Object.prototype.hasOwnProperty.call(r,a)&&r[a]&&_.push(r[a][0]),r[a]=0;for(o in p)Object.prototype.hasOwnProperty.call(p,o)&&(e[o]=p[o]);l&&l(t);while(_.length)_.shift()();return n.push.apply(n,c||[]),s()}function s(){for(var e,t=0;t<n.length;t++){for(var s=n[t],o=!0,i=1;i<s.length;i++){var p=s[i];0!==r[p]&&(o=!1)}o&&(n.splice(t--,1),e=a(a.s=s[0]))}return e}var o={},r={app:0},n=[];function a(t){if(o[t])return o[t].exports;var s=o[t]={i:t,l:!1,exports:{}};return e[t].call(s.exports,s,s.exports,a),s.l=!0,s.exports}a.m=e,a.c=o,a.d=function(e,t,s){a.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:s})},a.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},a.t=function(e,t){if(1&t&&(e=a(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var s=Object.create(null);if(a.r(s),Object.defineProperty(s,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)a.d(s,o,function(t){return e[t]}.bind(null,o));return s},a.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return a.d(t,"a",t),t},a.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},a.p="";var i=window["webpackJsonp"]=window["webpackJsonp"]||[],p=i.push.bind(i);i.push=t,i=i.slice();for(var c=0;c<i.length;c++)t(i[c]);var l=p;n.push([0,"chunk-vendors"]),s()})({0:function(e,t,s){e.exports=s("56d7")},"0330":function(e,t,s){},"034f":function(e,t,s){"use strict";s("85ec")},"0696":function(e,t,s){"use strict";s("e39e")},"135d":function(e,t,s){"use strict";s("0330")},"3ed2":function(e,t,s){"use strict";s("c4aa")},4992:function(e,t,s){},"56d7":function(e,t,s){"use strict";s.r(t);s("e260"),s("e6cf"),s("cca6"),s("a79d");var o=s("2b0e"),r=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{class:{App:!e.openned}},[s("div",{attrs:{id:"key"},on:{click:e.hideMouse}},[e._v(e._s(e.mouseON?e.translate.TR_CLICK_HERE:e.translate.TR_PRESS_KEY)),s("br"),e._v(e._s(e.mouseON?e.translate.TR_TO_CAM:e.translate.TR_TO_USE))]),s("div",{attrs:{id:"App"}},[s("div",{attrs:{id:"exit"},on:{click:e.close}},[e._v("X")]),"Home"===e.page?s("Home",{attrs:{OpenScreen:e.openScreen,list_props:e.list_props,translate:e.translate,NameResource:e.NameResource}}):e._e(),"Create"===e.page?s("Create",{attrs:{OpenScreen:e.openScreen,translate:e.translate,NameResource:e.NameResource}}):e._e(),"Element"===e.page?s("Element",{attrs:{OpenScreen:e.openScreen,getProps:e.sendProps,translate:e.translate,NameResource:e.NameResource,close:e.close}}):e._e(),"Update"===e.page?s("Update",{attrs:{OpenScreen:e.openScreen,getProps:e.sendProps,translate:e.translate,NameResource:e.NameResource,close:e.close}}):e._e(),"Folders"===e.page?s("Folders",{attrs:{OpenScreen:e.openScreen,getProps:e.sendProps,translate:e.translate,NameResource:e.NameResource,close:e.close}}):e._e(),"Folder"===e.page?s("Folder",{attrs:{OpenScreen:e.openScreen,folder_props:e.folder_props,getProps:e.sendProps,translate:e.translate,NameResource:e.NameResource,close:e.close}}):e._e()],1)])},n=[],a=(s("d3b7"),function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"screen"},[o("Title",{attrs:{title:e.translate.TR_TITLE_HOME,subtitle:e.translate.TR_SUBTITLE_HOME}}),o("div",{staticClass:"body"},[o("div",{attrs:{id:"new"},on:{click:function(t){return e.openScreen("Create")}}},[e._v("+")]),o("div",{attrs:{id:"folder"},on:{click:function(t){return e.openScreen("Folders")}}},[o("img",{attrs:{src:s("f27d"),alt:""},on:{click:function(t){return e.openScreen("Folders")}}})]),o("div",{attrs:{id:"closest"},on:{click:e.getClosest}},[o("img",{attrs:{src:s("edea"),alt:""},on:{click:e.getClosest}})]),o("div",{attrs:{id:"order"}},[o("p",{staticClass:"order-text"},[e._v(e._s(e.translate.TR_ORDER_TEXT))]),o("p",{staticClass:"order-subtext"},[e._v(e._s(e.translate.TR_ORDER_SUBTEXT)+" "+e._s(this.list_props.length))])]),o("div",{staticClass:"SearchBox"},[o("img",{attrs:{src:s("bbc5"),alt:""}}),o("input",{directives:[{name:"model",rawName:"v-model",value:e.search,expression:"search"}],attrs:{type:"text",placeholder:e.translate.TR_SEARCH1},domProps:{value:e.search},on:{input:function(t){t.target.composing||(e.search=t.target.value)}}})]),o("ul",{attrs:{id:"list"}},e._l(e.list_props.filter((function(t){return t.prop.includes(e.search)})),(function(t,s){return o("li",{key:s,staticClass:"list-item"},[o("div",{attrs:{id:"numberBox"}},[o("p",{staticClass:"numberText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(s+1))])]),o("div",{attrs:{id:"boxBorder"}},[o("div",{attrs:{id:"infoBox"}},[o("p",{staticClass:"propText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(t.prop))]),o("p",{staticClass:"coordsText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v("x = "+e._s(t.pos_x)+", y = "+e._s(t.pos_y)+", z = "+e._s(t.pos_z))])]),o("div",{attrs:{id:"statusBox"}},[o("p",{staticClass:"statusText",class:{TextEnable:1==t.status,TextDisabled:0==t.status},on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(1==t.status?e.translate.TR_STATUS_ON:e.translate.TR_STATUS_OFF))])])])])})),0)])],1)}),i=[],p=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{attrs:{id:"titleBox"}},[s("p",{staticClass:"title"},[e._v(e._s(e.title))]),s("p",{staticClass:"subtitle"},[e._v(e._s(e.subtitle))])])},c=[],l={name:"Title",props:{title:{type:String,default:"PROPS"},subtitle:{type:String,default:"Todos os props spawnados"}}},d=l,_=s("2877"),u=Object(_["a"])(d,p,c,!1,null,null,null),h=u.exports,g={name:"Home",props:{OpenScreen:{},list_props:{},translate:{},NameResource:{}},components:{Title:h},data:function(){return{search:""}},methods:{openScreen:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;this.OpenScreen(e,t)},getClosest:function(){fetch("https://".concat(this.NameResource,"/getClosest"),{method:"POST",body:JSON.stringify({})})}},created:function(){window.addEventListener("message",this.receiveLua)},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},T=g,m=(s("0696"),Object(_["a"])(T,a,i,!1,null,null,null)),f=m.exports,v=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"screen"},[s("Title",{attrs:{title:e.translate.TR_TITLE_CREATE,subtitle:e.translate.TR_SUBTITLE_CREATE}}),s("div",{staticClass:"body"},[s("div",{staticClass:"scroller"},[s("div",{attrs:{id:"form-create"}},[s("div",{staticClass:"form"},[s("p",[e._v("P")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.prop,expression:"prop"}],attrs:{type:"text",placeholder:e.translate.TR_CREATE_INPUT_PROP},domProps:{value:e.prop},on:{input:function(t){t.target.composing||(e.prop=t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("X")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.pos_x,expression:"pos_x"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_X},domProps:{value:e.pos_x},on:{input:function(t){t.target.composing||(e.pos_x=t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("Y")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.pos_y,expression:"pos_y"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_Y},domProps:{value:e.pos_y},on:{input:function(t){t.target.composing||(e.pos_y=t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("Z")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.pos_z,expression:"pos_z"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_Z},domProps:{value:e.pos_z},on:{input:function(t){t.target.composing||(e.pos_z=t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("H")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.heading,expression:"heading"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_HEADING},domProps:{value:e.heading},on:{input:function(t){t.target.composing||(e.heading=t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("F")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.folder,expression:"folder"}],attrs:{type:"text",placeholder:e.translate.TR_CREATE_FOLDER,spellcheck:"false"},domProps:{value:e.folder},on:{input:function(t){t.target.composing||(e.folder=t.target.value)}}})])]),s("div",{attrs:{id:"buttons-create"}},[s("div",[s("p",{on:{click:e.getInfoPerson}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_PERSON))]),s("p",{on:{click:e.getInfoGround}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_GROUND))]),s("p",{on:{click:e.createProp}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_CREATE))]),s("p",{on:{click:function(t){return e.openScreen("Home")}}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_BACK))])])])])])],1)},E=[],P={name:"Create",props:{OpenScreen:{},translate:{},NameResource:{}},components:{Title:h},data:function(){return{prop:"",pos_x:"",pos_y:"",pos_z:"",heading:"",folder:"none"}},methods:{getInfoPerson:function(){fetch("https://".concat(this.NameResource,"/getInfoPerson"),{method:"POST",body:JSON.stringify({})})},getInfoGround:function(){fetch("https://".concat(this.NameResource,"/getInfoGround"),{method:"POST",body:JSON.stringify({pos_x:this.pos_x,pos_y:this.pos_y,pos_z:this.pos_z,heading:this.heading})})},createProp:function(){this.prop.length>0&&this.pos_x&&this.pos_y&&this.pos_z&&this.heading&&(this.OpenScreen("Update",{isLoading:!0}),fetch("https://".concat(this.NameResource,"/createProp"),{method:"POST",body:JSON.stringify({prop:this.prop,pos_x:this.pos_x,pos_y:this.pos_y,pos_z:this.pos_z,heading:this.heading,folder:this.folder})}))},openScreen:function(e){this.OpenScreen(e)},receiveLua:function(e){if(e&&e.data){var t=e.data;t.player_info&&(this.pos_x=t.player_info.pos_x,this.pos_y=t.player_info.pos_y,this.pos_z=t.player_info.pos_z,this.heading=t.player_info.heading)}}},created:function(){window.addEventListener("message",this.receiveLua)},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},R=P,A=(s("3ed2"),Object(_["a"])(R,v,E,!1,null,null,null)),y=A.exports,O=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"screen"},[s("Title",{attrs:{title:e.translate.TR_TITLE_ELEMENT,subtitle:e.getProps.prop}}),s("div",{staticClass:"body"},[e.isLoading?s("div",{staticClass:"loader"}):s("div",[s("div",{staticClass:"options-update"},[s("p",{on:{click:e.changeStatus}},[e._v(e._s(0==e.getProps.status?e.translate.TR_ELEMENT_STATUS_ON:e.translate.TR_ELEMENT_STATUS_OFF))])]),1==e.getProps.status?s("div",{staticClass:"options-update"},[s("p",{on:{click:function(t){return e.openScreen("Update",e.getProps)}}},[e._v(e._s(e.translate.TR_ELEMENT_UPDATE))])]):e._e(),s("div",{staticClass:"options-update"},[s("p",{on:{click:e.deleteProp}},[e._v(e._s(e.translate.TR_ELEMENT_DELETE))])]),s("div",{staticClass:"options-update"},[s("p",{on:{click:e.teleportToProp}},[e._v(e._s(e.translate.TR_ELEMENT_TELEPORT))])]),s("div",{staticClass:"options-update"},[s("p",{on:{click:e.duplicateProp}},[e._v(e._s(e.translate.TR_ELEMENT_DUPLICATE))])]),s("div",{staticClass:"options-update"},[s("p",{on:{click:e.cancel}},[e._v(e._s(e.translate.TR_ELEMENT_CANCEL))])])])])],1)},S=[],C={name:"Element",props:{element:{},getProps:{},OpenScreen:{},translate:{},NameResource:{},close:{}},components:{Title:h},data:function(){return{isLoading:!1}},methods:{openScreen:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;this.OpenScreen(e,t)},teleportToProp:function(){fetch("https://".concat(this.NameResource,"/teleportToProp"),{method:"POST",body:JSON.stringify({pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z})})},changeStatus:function(){fetch("https://".concat(this.NameResource,"/changeStatus"),{method:"POST",body:JSON.stringify({id:this.getProps.id,prop:this.getProps.prop,status:0==this.getProps.status?1:0,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading})}),this.isLoading=!0},duplicateProp:function(){this.OpenScreen("Update",{isLoading:!0}),fetch("https://".concat(this.NameResource,"/createProp"),{method:"POST",body:JSON.stringify({prop:this.getProps.prop,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading,folder:this.getProps.folder})})},cancel:function(){this.OpenScreen("Home")},deleteProp:function(){fetch("https://".concat(this.NameResource,"/deleteProp"),{method:"POST",body:JSON.stringify({id:this.getProps.id})}),this.OpenScreen("Home"),this.close()},receiveLua:function(e){if(e&&e.data){var t=e.data;t.changeStatus&&t.id==this.getProps.id&&(this.isLoading=!1,this.getProps.status=t.status)}}},created:function(){window.addEventListener("message",this.receiveLua)},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},N=C,x=(s("135d"),Object(_["a"])(N,O,S,!1,null,null,null)),L=x.exports,b=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"screen"},[s("Title",{attrs:{title:e.translate.TR_TITLE_UPDATE,subtitle:e.translate.TR_SUBTITLE_UPDATE}}),s("div",{staticClass:"body"},[e.getProps.isLoading?s("div",{staticClass:"loader"}):s("div",{staticClass:"scroller"},[s("div",{attrs:{id:"form-create"}},[s("div",{staticClass:"form"},[s("p",[e._v("P")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.prop,expression:"getProps.prop"}],attrs:{type:"text",placeholder:e.translate.TR_CREATE_INPUT_PROP},domProps:{value:e.getProps.prop},on:{change:e.sendRecreate,input:function(t){t.target.composing||e.$set(e.getProps,"prop",t.target.value)}}})]),s("div",{staticClass:"form"},[s("p",[e._v("X")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.pos_x,expression:"getProps.pos_x"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_X},domProps:{value:e.getProps.pos_x},on:{input:[function(t){t.target.composing||e.$set(e.getProps,"pos_x",t.target.value)},e.sendUpdate]}})]),s("div",{staticClass:"form"},[s("p",[e._v("Y")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.pos_y,expression:"getProps.pos_y"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_Y},domProps:{value:e.getProps.pos_y},on:{input:[function(t){t.target.composing||e.$set(e.getProps,"pos_y",t.target.value)},e.sendUpdate]}})]),s("div",{staticClass:"form"},[s("p",[e._v("Z")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.pos_z,expression:"getProps.pos_z"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_POS_Z},domProps:{value:e.getProps.pos_z},on:{input:[function(t){t.target.composing||e.$set(e.getProps,"pos_z",t.target.value)},e.sendUpdate]}})]),s("div",{staticClass:"form"},[s("p",[e._v("H")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.heading,expression:"getProps.heading"}],attrs:{type:"number",step:"0.1",placeholder:e.translate.TR_CREATE_HEADING},domProps:{value:e.getProps.heading},on:{input:[function(t){t.target.composing||e.$set(e.getProps,"heading",t.target.value)},e.sendUpdate]}})]),s("div",{staticClass:"form"},[s("p",[e._v("F")]),s("input",{directives:[{name:"model",rawName:"v-model",value:e.getProps.folder,expression:"getProps.folder"}],attrs:{type:"text",placeholder:e.translate.TR_CREATE_FOLDER,spellcheck:"false"},domProps:{value:e.getProps.folder},on:{input:function(t){t.target.composing||e.$set(e.getProps,"folder",t.target.value)}}})])]),s("div",{attrs:{id:"buttons-create"}},[s("div",[s("p",{on:{click:e.getInfoPerson}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_PERSON))]),s("p",{on:{click:e.getInfoGround}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_GROUND))]),s("p",{on:{click:e.savaUpdateProp}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_UPDATE))]),s("p",{on:{click:e.cancelUpdate}},[e._v(e._s(e.translate.TR_CREATE_BUTTON_BACK))])])])])])],1)},w=[],z={name:"Create",components:{Title:h},props:{getProps:{},OpenScreen:{},NameResource:{},translate:{},close:{}},data:function(){return{}},methods:{openScreen:function(e){this.OpenScreen(e)},sendUpdate:function(){this.getProps.pos_x&&this.getProps.pos_y&&this.getProps.pos_z&&this.getProps.heading&&fetch("https://".concat(this.NameResource,"/updateProp"),{method:"POST",body:JSON.stringify({id:this.getProps.id,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading})})},sendRecreate:function(){this.getProps.prop.length>0&&this.getProps.pos_x&&this.getProps.pos_y&&this.getProps.pos_z&&this.getProps.heading&&fetch("https://".concat(this.NameResource,"/recreateProp"),{method:"POST",body:JSON.stringify({id:this.getProps.id,prop:this.getProps.prop,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading})})},getInfoPerson:function(){fetch("https://".concat(this.NameResource,"/getInfoPerson"),{method:"POST",body:JSON.stringify({})})},getInfoGround:function(){fetch("https://".concat(this.NameResource,"/getInfoGround"),{method:"POST",body:JSON.stringify({pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading})})},savaUpdateProp:function(){this.getProps.prop.length>0&&this.getProps.pos_x&&this.getProps.pos_y&&this.getProps.pos_z&&this.getProps.heading&&(fetch("https://".concat(this.NameResource,"/savaUpdateProp"),{method:"POST",body:JSON.stringify({id:this.getProps.id,prop:this.getProps.prop,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading,folder:this.getProps.folder})}),this.OpenScreen("Home"),this.close())},cancelUpdate:function(){fetch("https://".concat(this.NameResource,"/cancelUpdate"),{method:"POST",body:JSON.stringify({id:this.getProps.id,prop:this.getProps.prop,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z})}),this.openScreen("Home")},receiveLua:function(e){if(e&&e.data){var t=e.data;t.element?(this.getProps.id=t.element.id,this.getProps.prop=t.element.prop,this.getProps.pos_x=t.element.pos_x,this.getProps.pos_y=t.element.pos_y,this.getProps.pos_z=t.element.pos_z,this.getProps.heading=t.element.heading,this.getProps.folder=t.element.folder,this.getProps.isLoading=!1):t.player_info?(this.getProps.pos_x=t.player_info.pos_x,this.getProps.pos_y=t.player_info.pos_y,this.getProps.pos_z=t.player_info.pos_z,this.getProps.heading=t.player_info.heading,fetch("https://".concat(this.NameResource,"/updateProp"),{method:"POST",body:JSON.stringify({id:this.getProps.id,pos_x:this.getProps.pos_x,pos_y:this.getProps.pos_y,pos_z:this.getProps.pos_z,heading:this.getProps.heading})})):t.backToCreate&&this.OpenScreen("Create")}}},created:function(){window.addEventListener("message",this.receiveLua)},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},U=z,D=(s("c5e0"),Object(_["a"])(U,b,w,!1,null,null,null)),H=D.exports,B=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"screen"},[o("Title",{attrs:{title:e.translate.TR_TITLE_FOLDERS,subtitle:e.translate.TR_SUBTITLE_FOLDERS}}),o("div",{staticClass:"body"},[e.isLoading?o("div",{staticClass:"loader"}):o("div",[o("div",{staticClass:"SearchBox"},[o("img",{attrs:{src:s("bbc5"),alt:""}}),o("input",{directives:[{name:"model",rawName:"v-model",value:e.search,expression:"search"}],attrs:{type:"text",placeholder:e.translate.TR_SEARCH2},domProps:{value:e.search},on:{input:function(t){t.target.composing||(e.search=t.target.value)}}})]),e._l(e.folders.filter((function(t){return t.folder.includes(e.search)})),(function(t,s){return o("div",{key:s,staticClass:"options-update"},[o("p",{on:{click:function(s){return e.openFolder(t.folder)}}},[e._v(e._s(t.folder))])])})),o("div",{staticClass:"options-update"},[o("p",{on:{click:e.cancel}},[e._v(e._s(e.translate.TR_ELEMENT_CANCEL))])])],2)])],1)},k=[],F={name:"Element",props:{element:{},getProps:{},OpenScreen:{},translate:{},NameResource:{},close:{}},components:{Title:h},data:function(){return{isLoading:!0,folders:[],search:""}},methods:{openScreen:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;this.OpenScreen(e,t)},openFolder:function(e){fetch("https://".concat(this.NameResource,"/openFolder"),{method:"POST",body:JSON.stringify({folder:e})}),this.openScreen("Folder",{folder:e})},cancel:function(){this.OpenScreen("Home")},receiveLua:function(e){if(e&&e.data){var t=e.data;t.receiveFolders&&(this.isLoading=!1,this.folders=t.folders)}}},created:function(){window.addEventListener("message",this.receiveLua),fetch("https://".concat(this.NameResource,"/loadFolders"),{method:"POST",body:JSON.stringify({})})},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},I=F,M=Object(_["a"])(I,B,k,!1,null,null,null),J=M.exports,G=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"screen"},[o("Title",{attrs:{title:e.translate.TR_TITLE_HOME,subtitle:e.getProps.folder}}),o("div",{staticClass:"body"},[o("div",{staticClass:"SearchBox"},[o("img",{attrs:{src:s("bbc5"),alt:""}}),o("input",{directives:[{name:"model",rawName:"v-model",value:e.search,expression:"search"}],attrs:{type:"text",placeholder:e.translate.TR_SEARCH1},domProps:{value:e.search},on:{input:function(t){t.target.composing||(e.search=t.target.value)}}})]),o("ul",{attrs:{id:"list"}},e._l(e.folder_props.filter((function(t){return t.prop.includes(e.search)})),(function(t,s){return o("li",{key:s,staticClass:"list-item"},[o("div",{attrs:{id:"numberBox"}},[o("p",{staticClass:"numberText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(s+1))])]),o("div",{attrs:{id:"boxBorder"}},[o("div",{attrs:{id:"infoBox"}},[o("p",{staticClass:"propText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(t.prop))]),o("p",{staticClass:"coordsText",on:{click:function(s){return e.openScreen("Element",t)}}},[e._v("x = "+e._s(t.pos_x)+", y = "+e._s(t.pos_y)+", z = "+e._s(t.pos_z))])]),o("div",{attrs:{id:"statusBox"}},[o("p",{staticClass:"statusText",class:{TextEnable:1==t.status,TextDisabled:0==t.status},on:{click:function(s){return e.openScreen("Element",t)}}},[e._v(e._s(1==t.status?e.translate.TR_STATUS_ON:e.translate.TR_STATUS_OFF))])])])])})),0),o("div",{staticClass:"folder-button",attrs:{id:"buttons-create"}},[o("div",[o("p",{on:{click:e.activeAll}},[e._v(e._s(e.translate.TR_FOLDER_ACTIVE_ALL))]),o("p",{on:{click:e.disableAll}},[e._v(e._s(e.translate.TR_FOLDER_DISABLE_ALL))]),o("p",{on:{click:e.deleteAll}},[e._v(e._s(e.translate.TR_FOLDER_DELETE_ALL))]),o("p",{on:{click:function(t){return e.openScreen("Home")}}},[e._v(e._s(e.translate.TR_ELEMENT_CANCEL))])])])])],1)},j=[],Y={name:"Home",props:{OpenScreen:{},getProps:{},folder_props:{},translate:{},NameResource:{},close:{}},components:{Title:h},data:function(){return{search:""}},methods:{openScreen:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;this.OpenScreen(e,t)},activeAll:function(){fetch("https://".concat(this.NameResource,"/activeAll"),{method:"POST",body:JSON.stringify({folder:this.getProps.folder})}),this.close()},disableAll:function(){fetch("https://".concat(this.NameResource,"/disableAll"),{method:"POST",body:JSON.stringify({folder:this.getProps.folder})}),this.close()},deleteAll:function(){fetch("https://".concat(this.NameResource,"/deleteAll"),{method:"POST",body:JSON.stringify({folder:this.getProps.folder})}),this.close()},receiveLua:function(e){if(e&&e.data){var t=e.data;t.openFolder&&(this.folder_props=t.folder_props)}}},created:function(){window.addEventListener("message",this.receiveLua)},destroyed:function(){window.removeEventListener("message",this.receiveLua)}},Q=Y,X=(s("bf92"),Object(_["a"])(Q,G,j,!1,null,null,null)),Z=X.exports,K={name:"App",components:{Home:f,Create:y,Update:H,Element:L,Folders:J,Folder:Z},data:function(){return{page:"Home",sendProps:null,list_props:[{id:1,prop:"cs_televisio2naaaaaaaaaaaaaaaaaaaaaaaaa",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:1},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:2,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0},{id:10,prop:"cs_television",pos_x:250.5,pos_y:150,pos_z:2,rot_x:0,rot_y:0,rot_z:0,status:0}],folder_props:[],translate:{TR_TITLE_HOME:"PROPS",TR_SUBTITLE_HOME:"Todos os props spawnados",TR_ORDER_TEXT:"ordenado por index",TR_ORDER_SUBTEXT:"total criados:",TR_STATUS_ON:"ativado",TR_STATUS_OFF:"desativado",TR_TITLE_CREATE:"PROPS",TR_SUBTITLE_CREATE:"Criar prop",TR_TITLE_UPDATE:"PROPS",TR_SUBTITLE_UPDATE:"Atualizar prop",TR_CREATE_PROP:"Prop",TR_CREATE_INPUT_PROP:"Digite um Prop Name",TR_CREATE_POS_X:"Posição X do Prop",TR_CREATE_POS_Y:"Posição Y do Prop",TR_CREATE_POS_Z:"Posição Z do Prop",TR_CREATE_HEADING:"Heading do Prop",TR_CREATE_BUTTON_PERSON:"Pegar do meu personagem",TR_CREATE_BUTTON_CREATE:"Criar",TR_CREATE_BUTTON_UPDATE:"Salvar",TR_CREATE_BUTTON_BACK:"Voltar",TR_CREATE_BUTTON_GROUND:"Colocar no chão",TR_CREATE_FOLDER:"Pasta",TR_TITLE_ELEMENT:"PROPS",TR_ELEMENT_STATUS_ON:"Ativar",TR_ELEMENT_STATUS_OFF:"Desativar",TR_ELEMENT_UPDATE:"Atualizar",TR_ELEMENT_DELETE:"Delete",TR_ELEMENT_TELEPORT:"Teleportar para ele",TR_ELEMENT_DUPLICATE:"Duplicar",TR_ELEMENT_CANCEL:"Cancelar",TR_TITLE_FOLDERS:"PROPS",TR_SUBTITLE_FOLDERS:"Pastas",TR_FOLDER_ACTIVE_ALL:"Ativar tudo",TR_FOLDER_DISABLE_ALL:"Desativar tudo",TR_FOLDER_DELETE_ALL:"Excluir Pasta",TR_CLICK_HERE:"Clique aqui",TR_PRESS_KEY:"Pressione F5",TR_TO_USE:"Para utilizar o mouse",TR_TO_CAM:"Para se mover",TR_SEARCH1:"Search Prop",TR_SEARCH2:"Search Folder"},NameResource:"spawn_props",openned:!1,mouseON:!0}},methods:{openScreen:function(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;this.sendProps=t,this.page=e},close:function(){fetch("https://".concat(this.NameResource,"/close"),{method:"POST",body:JSON.stringify({})}),this.openned=!1},receiveLua:function(e){if(e&&e.data){var t=e.data;t.page?this.page=t.page:t.list_props?(this.list_props=t.list_props,this.openned=!0):t.mouseEnabled?this.mouseON=t.mouseEnabled:t.configs?(this.translate=t.translate,this.NameResource=t.NameResource):t.openFolder?this.folder_props=t.folder_props:t.getClosest&&this.openScreen("Element",t.object)}},hideMouse:function(){fetch("https://".concat(this.NameResource,"/disableMouse"),{method:"POST",body:JSON.stringify({})}),this.mouseON=!1},keyPress:function(e){var t=e.key;"Escape"==t&&this.close()}},created:function(){window.addEventListener("message",this.receiveLua),window.addEventListener("keydown",this.keyPress)},destroyed:function(){window.removeEventListener("message",this.receiveLua),window.removeEventListener("keydown",this.keyPress)}},q=K,V=(s("034f"),Object(_["a"])(q,r,n,!1,null,null,null)),W=V.exports;o["a"].config.productionTip=!1,new o["a"]({render:function(e){return e(W)}}).$mount("#app")},"5ae7":function(e,t,s){},"85ec":function(e,t,s){},bbc5:function(e,t,s){e.exports=s.p+"img/search.eaf220a6.png"},bf92:function(e,t,s){"use strict";s("5ae7")},c4aa:function(e,t,s){},c5e0:function(e,t,s){"use strict";s("4992")},e39e:function(e,t,s){},edea:function(e,t,s){e.exports=s.p+"img/nearby.c887dfcf.png"},f27d:function(e,t){e.exports="data:image/png;base64,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"}});
//# sourceMappingURL=app.7c5b1175.js.map