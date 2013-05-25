<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
	<br />
	<form id="moduls_fun_addUser_addForm" method="post">
		<table class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户账户:</th>
				<td><input name="username" class="easyui-validatebox inputCss" style="width: 150px;" data-options="validType:'userExist', required:true" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户姓名:</th>
				<td><input name="realName" class="easyui-validatebox inputCss" style="width: 150px;" data-options="required:true" /></td>
			</tr>
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户密码:</th>
				<td><input name="password" class="easyui-validatebox inputCss" style="width: 150px;" data-options="required:true" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户角色:</th>
				<td><input name="role.roleId" class="easyui-combobox inputCss" style="width: 152px;" data-options="valueField:'roleId',textField:'roleName',required:true,url:'${pageContext.request.contextPath}/roleController/getRoleList.do'" /></td>
			</tr>
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">用户状态:</th>
				<td><input name="state" class="easyui-validatebox inputCss" style="width: 150px;" data-options="required:false" /></td>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">认&nbsp;证&nbsp;码:</th>
				<td><input name="valiCode" class="easyui-validatebox inputCss" style="width: 150px;" data-options="required:false" /></td>
			</tr>
		</table>
	</form>
</div>