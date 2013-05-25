<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
</script>
<div align="center">
	<form id="admin_modelAdd_addForm" method="post">
		<table class="tableForm">
			<tr>
				<th style="width: 100px;font-size: 12px; font-weight: normal;">模块名</th>
				<td><input name="modName" class="easyui-validatebox" data-options="required:true" /></td>
				<th style="width: 80px;font-size: 12px;">模块编码</th>
				<td><input name="modCode" class="easyui-validatebox" data-options="validType:'isNumber'" /></td>
			</tr>
			<tr>
				<th><font style="font-size: 12px;">父模块</font>
				</th>
				<td><select name="parMod" class="easyui-combotree" style="width: 152px" data-options="data:treeMenuData"></select></td>
				<th><font style="font-size: 12px;">模块地址</font>
				</th>
				<td><input name="modUrl" class="easyui-validatebox" data-options="required:false" /></td>
			</tr>
			<tr>
				<th><font style="font-size: 12px;">模块描述</font>
				</th>
				<td colspan="3"><textarea rows="2" name="modDes" style="width: 394px;" class="easyui-validatebox" data-options="required:false"></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>