<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
var north_crrUser = new Object();
$(function() {
	north_crrUser.userId = "${sessionScope.crrUser.userId}";
	north_crrUser.realName = "${sessionScope.crrUser.realName}";
	north_crrUser.roleName = "${sessionScope.crrUser.role.roleName}";
	var userInfo = '欢迎您！' + north_crrUser.realName;
	userInfo += '&nbsp;&nbsp;角色:' + north_crrUser.roleName;
	$("#userInfo").html(userInfo);
});

var layout_north_logout = function() {
	window.location.href = "login.html";
};
</script>
<img src="${pageContext.request.contextPath}/image/system/topImg.jpg" />
<div id="userInfo" style="position: absolute; right: 100px; bottom: 5px; "></div>
<div style="position: absolute; right: 0px; bottom: 0px; ">
	<a href="javascript:void(0);" class="easyui-menubutton" onclick="layout_north_logout();" menu="#layout_north_zxMenu" iconCls="icon-back">注销</a>
</div>