<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
<br/>
	<form id="moduls_fun_editRole_addForm" method="post">
		<input name="roleId" hidden="true" style="display: none;"/>
		<table class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">角色名称</th>
				<td><input name="roleName" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th style="width: 80px;font-size: 12px; font-weight: normal;">角色编号</th>
				<td><input name="roleCode" class="easyui-validatebox" data-options="required:false" />
				</td>
			</tr>
		</table>
	</form>
</div>