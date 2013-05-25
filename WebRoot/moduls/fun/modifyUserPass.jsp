<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
<br/>
	<form id="moduls_fun_modifyUserPass_modifyForm" method="post">
		<input name="userId" hidden="true" style="display: none;"/>
		<table class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">新密码</th>
				<td><input name="password" type="password" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
		</table>
	</form>
</div>