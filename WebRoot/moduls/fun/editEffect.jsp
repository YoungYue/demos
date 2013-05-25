<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
	<br />
	<form id="moduls_fun_editEffect_addForm" method="post">
		<input name="eid" hidden="true" style="display: none;" />
		<table class="tableForm">
			<tr>
				<th style="font-size: 12px; font-weight: normal;">菜单类型:</th>
				<td><select id="menuType" name="menuType" class="easyui-combobox" data-options="width:152,panelHeight:50" name="menuType" style="width:200px;">
						<option value="0">内容菜单</option>
						<option value="1">扩展菜单</option>
				</select></td>
			</tr>
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">效果名称</th>
				<td><input name="eName" class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<th style="width: 80px;font-size: 12px; font-weight: normal;">效果描述</th>
				<td><input name="eDescription" class="easyui-validatebox" data-options="required:false" /></td>
			</tr>
		</table>
	</form>
</div>