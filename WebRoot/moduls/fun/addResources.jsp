<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$('#moduls_fun_addGroup_addForm input').bind('keyup', function(event) {
	if(event.keyCode == 13) {
		$('#moduls_fun_addGroup_addForm').submit();
	}
});

</script>
<div align="center">
<br/>
	<form id="moduls_fun_addGroup_addForm" method="post">
		<table class="tableForm" style="width: 90%;">
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