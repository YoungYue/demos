<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div align="center">
<br/>
	<form id="moduls_fun_editGroup_addForm" method="post">
		<input name="resId" hidden="true" style="display: none;"/>
		<table class="tableForm">
			<tr>
				<th style="width: 50px;font-size: 12px; font-weight: normal;">资源名称</th>
				<td><input name="resName" style="width: 230px;" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th style="width: 50px;font-size: 12px; font-weight: normal;">资源地址</th>
				<td><input name="resUrl" style="width: 230px;" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th style="width: 50px;font-size: 12px; font-weight: normal;">资源描述</th>
				<td><input name="resDes" style="width: 230px;" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th style="width: 50px;font-size: 12px; font-weight: normal;">资源状态</th>
				<td><input name="resState" style="width: 230px;" class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>			
		</table>
	</form>
</div>