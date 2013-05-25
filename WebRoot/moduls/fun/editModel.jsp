<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules, {
	checkModelPid : {/* 父级菜单不能是自己或自己的子菜单 */
		validator : function(value, param) {
			var modId = $("#admin_modelEdit_editForm input[name='modId']").val();
			var parMod = $("#admin_modelEdit_editForm select[id='parMod']").combotree('getValue');
			var modelTree = $("#admin_modelEdit_editForm select[id='parMod']").combotree('tree');
			var node = modelTree.tree('find', parMod);
			
			while(true) {
				if(node == null) {
					return true;
				}
				parMenuId = node.id;
				if(parMod != 0 && parMod == modId) {
					return false;
				}
				node = modelTree.tree('find', parMod);
				node = modelTree.tree('getParent', node.target);
			}
			return true;
		},
		message : '父级模块不能是自己或自己的子模块！'
	}
});
</script>
<div align="center">
	<form id="admin_modelEdit_editForm" method="post">
		<input name="modId" hidden="true" />
		<table class="tableForm">
			<tr>
				<th style="width: 100px;font-size: 12px; font-weight: normal;">模块名称</th>
				<td><input name="modName" class="easyui-validatebox" data-options="required:true" />
				</td>
				<th style="width: 80px;font-size: 12px; font-weight: normal;">模块编码</th>
				<td><input name="modCode" class="easyui-validatebox" data-options="validType:'isNumber'" />
				</td>
			</tr>
			<tr>
				<th><font style="font-size: 12px; font-weight: normal;">父模块</font></th>
				<td><select id="parMod" name="parMod" class="easyui-combotree" style="width: 152px" data-options="validType:'checkModelPid', data:treeMenuData"></select>
				</td>
				<th><font style="font-size: 12px; font-weight: normal;">模块地址</font></th>
				<td><input name="modUrl" class="easyui-validatebox"/>
				</td>
			</tr>
			<tr>
				<th><font style="font-size: 12px; font-weight: normal;">模块描述</font></th>
				<td colspan="3"><textarea rows="2" name="modDes" style="width: 394px;" class="easyui-validatebox"></textarea></td>
			</tr>
		</table>
	</form>
</div>