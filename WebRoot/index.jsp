<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>Ipad展馆后台配置系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jslib/jquery-easyui-1.3.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="jslib/tools.js"></script>
<link rel="stylesheet" href="jslib/jquery-easyui-1.3.1/themes/gray/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="jslib/jquery-easyui-1.3.1/themes/icon.css" type="text/css"></link>
<style>
.inputCss {
	font-size: 12px;
	margin: 0;
	padding: 0;
	border: 1px solid #d3d3d3;
	background: #fff;
	line-height:20px;
	height:20px;
	*height:18px;
	*line-height:18px;
	_height:18px;
	_line-height:18px;
}
</style>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 125px; overflow: hidden;">
		<jsp:include page="layout/north.jsp"></jsp:include>
	</div>
	<div data-options="region:'south'" style="height: 28px; bottom: 0px; valign:middle; line-height: 28px;"  align="center">&nbsp; CopyeRight Reserved @2013-2015 
	</div>
	<div data-options="region:'west',title:'系统菜单'" style="width: 200px; overflow: hidden;">
		<jsp:include page="layout/west.jsp"></jsp:include>
	</div>
	<div data-options="region:'east',title:'辅助功能'" style="width: 200px; overflow: hidden;">
		<jsp:include page="layout/east.jsp"></jsp:include>
	</div>
	<div data-options="region:'center',title:'操作界面'">
		<jsp:include page="layout/center.jsp"></jsp:include>
	</div>
