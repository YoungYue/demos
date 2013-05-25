<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style type="text/css">
#ress {
	border: 1px solid #A6CAF0;
	width: 165px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#moduls_fun_distributeRes_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/resourcesController/getResources.do',
			fit : true,
			pagination : true,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'resId',
			nowrap : false,
			fitColumns : true,
			columns : [ [ {
				title : '编号',
				field : 'resId',
				width : 150,
				checkbox : true
			}, {
				title : '资源名称',
				field : 'resName',
				width : 150
			}, {
				title : '资源描述',
				field : 'resDes',
				width : 150
			}, {
				title : '资源状态',
				field : 'resState',
				width : 150
			} ] ]
		});

		$('#fun_distributeRes_roleId').combobox({
			onSelect : function(record) {
				getDistributeResources(record.roleId);
			}
		});

		$("#addRes").click(function() {
			var rows = $('#moduls_fun_distributeRes_datagrid').datagrid('getChecked');
			$.each(rows, function(i, row) {
				var falg = $("#ress option[value='" + row.resId + "']").val();
				if (!falg) {
					$("#ress").append("<option falg='new' value='"+row.resId+"'>" + row.resName + "</option>");
				}
			});
		});

		$("#delRes").click(function() {
			var options = $("#ress").find("option:selected");
			var ids = [];
			$.each(options, function(i, option) {
				if ($(option).attr('falg') == 'old') {
					ids.push($(option).attr('value'));
				}
			});
			$(options).remove();
			if (ids.length != 0) {
				delDistributeResources(ids);
			}
		});

	});

	var delDistributeResources = function(ids) {
		$.ajax({
			url : '${pageContext.request.contextPath}/resourcesController/delDistributeResources.do',
			data : {
				ids : ids.join(',')
			},
			type : 'POST',
			dataType : 'json',
			success : function(result) {
			}
		});
	};

	var getDistributeResources = function(roleId) {
		$.ajax({
			url : '${pageContext.request.contextPath}/resourcesController/getDistributeResources.do',
			data : {
				roleId : roleId
			},
			dataType : 'json',
			success : function(result) {
				$('#ress option').remove();

				$.each(result, function(i, roleRes) {
					var falg = $("#ress option[value='" + roleRes.resources.resId + "']").val();
					if (!falg) {
						$("#ress").append("<option falg='old' value='"+roleRes.id+"'>" + roleRes.resources.resName + "</option>");
					}
				});
			}
		});
	};
</script>
<br />
<div align="left">
	&nbsp;&nbsp;角色:&nbsp; <input id="fun_distributeRes_roleId" class="easyui-combobox" style="width: 152px;" data-options="valueField:'roleId',textField:'roleName',required:true,url:'${pageContext.request.contextPath}/roleController/getRoleList.do'" />
</div>
<hr>
<table cellspacing="0" border="0" style="width: 100%;height: 300px;">
	<tr>
		<td width="450"><table id="moduls_fun_distributeRes_datagrid"></table></td>
		<td><a id="addRes" href="javascript:void(0)" class="easyui-linkbutton">>></a> <br> <br> <a id="delRes" href="javascript:void(0)" class="easyui-linkbutton"><<</a>
		</td>
		<td width="200"><select id="ress" name="select" size="17" multiple="multiple">
		</select>
		</td>
	</tr>
</table>
