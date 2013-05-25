<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
	<br />
	<form id="moduls_fun_editUser_addForm" method="post">
		<input name="userId" hidden="true" style="display: none;"/>
		<table class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户账户</th>
				<td><input name="username" class="easyui-validatebox" disabled="disabled" data-options="required:true" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户姓名</th>
				<td><input name="realName" class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户密码</th>
				<td><input name="password" class="easyui-validatebox" data-options="required:true" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户角色</th>
				<td><input name="role.roleId" id="roleId" class="easyui-combobox" style="width: 152px;" data-options="valueField:'roleId',textField:'roleName',required:true,url:'${pageContext.request.contextPath}/roleController/getRoleList.do'" /></td>
			</tr>
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户状态</th>
				<td><input name="state" class="easyui-validatebox" data-options="required:false" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">认&nbsp;证&nbsp;码</th>
				<td><input name="valiCode" class="easyui-validatebox" data-options="required:false" /></td>
			</tr>
		</table>
	</form>
</div>