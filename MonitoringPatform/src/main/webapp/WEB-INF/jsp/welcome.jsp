<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>系统监控平台</title>

<link href="${rootURL}resources/easyUI/themes/default/easyui.css" rel="stylesheet">
<link href="${rootURL}resources/easyUI/themes/icon.css" rel="stylesheet">
<link href="${rootURL}resources/easyUI/themes/demo.css" rel="stylesheet">
<link href="${rootURL}resources/css/datagrid.css" rel="stylesheet">
<script type="text/javascript" src="${rootURL}resources/easyUI/jquery.min.js"></script>
<script type="text/javascript" src="${rootURL}resources/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${rootURL}resources/easyUI/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/menu.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/material.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/validateboxExtend.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/jquery.form.js"></script>
<script type="text/javascript" src="${rootURL}resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/permission.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/jquery.zclip.js"></script>
<script type="text/javascript" src="${rootURL}resources/js/base64.js"></script>
<script type="text/javascript">
	$(function() {
		$.get('${rootURL}loadMenu', function(data) {
			loadMenu(data);
		});

	});
</script>
<Style>
#css3menu li {
	float: left;
	list-style-type: none;
}

#css3menu li a {
	color: #fff;
	padding-right: 20px;
}

#css3menu li a.active {
	color: yellow;
}

ul li div.selected {
	background: none repeat scroll 0 0 #EBEBEB;
	border: 1px solid #99bbe8;
	cursor: default;
}

#wnav ul {
	list-style-type: none;
	margin: 0px;
	padding: 10px;
}

#wnav ul li {
	padding: 0px;
}

#wnav ul li a {
	line-height: 24px;
}

#wnav ul li div {
	margin: 2px 0px;
	padding-left: 10px;
	padding-top: 2px;
}

#wnav ul li div.hover {
	border: 1px dashed #99BBE8;
	background: #E0ECFF;
	cursor: pointer;
}

#wnav ul li div.hover a {
	color: #416AA3;
}

#wnav ul li div.selected {
	border: 1px solid #99BBE8;
	background: #E0ECFF;
	cursor: default;
}

#wnav ul li div.selected a {
	color: #416AA3;
	font-weight: bold;
}

/*menu icon*/
.menu-icon-01 {
	/* background:url(${rootURL}resources/images/i01.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -160px -99px;
}

.menu-icon-02 {
	/* background:url(${rootURL}resources/images/i02.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -200px -478px;
}

.menu-icon-03 {
	background: url(${rootURL}resources/images/i03.png) no-repeat center center;
}

.menu-icon-04 {
	/* background:url(${rootURL}resources/images/i04.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -100px -100px;
}

.menu-icon-05 {
	/* background:url(${rootURL}resources/images/i05.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -20px -100px;
}

.menu-icon-06 {
	/* background:url(${rootURL}resources/images/i06.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -340px -79px;
}

.menu-icon-07 {
	background: url(${rootURL}resources/images/i07.png) no-repeat center center;
}

.menu-icon-08 {
	/* background:url(${rootURL}resources/images/i08.png) no-repeat center center; */
	padding: 2px 0px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -140px -378px;
}

.menu-icon-09 {
	background: url(${rootURL}resources/images/i09.png) no-repeat center center;
}
/*child menu icon*/
.menu-icon-add {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -19px 0px;
}

.menu-icon-nav {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/message_16.png) no-repeat;
	/* padding:2px 9px;
	background:url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -100px -18px; */
}

.menu-icon-app {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/app_16.png) no-repeat;
	/* padding:2px 9px;
	background:url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -360px -39px; */
}

.menu-icon-group {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/group_16.png) no-repeat;
	/* padding:2px 9px;
	background:url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -320px -57px; */
}

.menu-icon-device {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -320px -220px;
}

.menu-icon-users {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/user_16.png) no-repeat;
	/* padding:0px 9px;
	background:url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -100px -480px; */
}

.menu-icon-role {
	padding: 0px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -360px -200px;
}

.menu-icon-set {
	padding: 0px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -380px -200px;
}

.menu-icon-log {
	padding: 0px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -380px -80px;
}

.menu-icon-mstdata {
	padding: 2px 9px;
	background: url(${rootURL}resources/images/tabicons.png) no-repeat;
	background-position: -360px -79px;
}
</style>
</head>
<body class="easyui-layout">
	<%-- <div data-options="region:'north',split:true" class="topImg" style="height: 98px;">
		<div>
			<jsp:include page="top.jsp"></jsp:include>
		</div>
	</div> --%>
	<!-- <div data-options="region:'south',split:true" style="height: 50px;" class="bottomImg">
		<div style="padding-left: auto; padding-right: auto; text-align: center;">
			<h4>©2015上海安吉星信息服务有限公司 版权所有</h4>
		</div>
	</div> -->
	<!-- <div data-options="region:'east',collapsed:true,split:true" title="功能模块描述" style="width: 180px;">
		<div id="eastContent" class="eastContent"></div>
	</div> -->
	<div data-options="region:'west',split:true" title="导航菜单" style="width: 150px;">
		<div id='wnav' class="easyui-accordion" data-options="fit:true,border:false"></div>
	</div>
	<div data-options="region:'center',iconCls:'icon-ok'">
		<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true"></div>
	</div>
</body>
</html>
