<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules, {
	checkRoleName : {/* 扩展验证两次密码 */
		validator : function(value, param) {
			if($.trim(value).length=0) {
				return true;
			}
			var falg = true;
			$.ajax({
				type : 'POST',
				url : 'roleController/roleNameExist.do',
				data : {
					roleName : value
				},
				cache : false,
				async : false,
				dataType : 'JSON',
				success : function(r) {
					if (r.success) {
						falg = false;
					}
				}
			});

			return falg;
		},
		message : '角色名已经存在！'
	}
});
</script>
<div align="center">
<br/>
	<form id="moduls_fun_addRole_addForm" method="post">
		<table class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">角色名称</th>
				<td><input name="roleName" class="easyui-validatebox" data-options="required:true,validType:'checkRoleName'" />
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