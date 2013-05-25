<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(function() {
		$('#moduls_role_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/roleController/getRole.do',
			fit : true,
			border : false,
			pagination : true,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'roleId',
			nowrap : false,
			columns : [ [ {
				title : '编号',
				field : 'roleId',
				width : 150,
				checkbox : true
			}, {
				title : '角色名',
				field : 'roleName',
				width : 150
			}, {
				title : '角色编号',
				field : 'roleCode',
				width : 350
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="moduls_role_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;' + '<img onclick="moduls_role_distributeFun(\'{2}\');" src="{3}"/> &nbsp;&nbsp;&nbsp;' + '<img onclick="moduls_role_deleteFun(\'{4}\');" src="{5}"/>', row.roleId, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.roleId, 'jslib/jquery-easyui-1.3.1/themes/icons/search.png', row.roleId, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					moduls_role_addFun();
				}
			}, '-', {
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					moduls_role_removeFun();
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#moduls_role_datagrid').datagrid('reload');
				}
			} ]
		});
	});

	function moduls_role_editFun(id) {
		$('#moduls_role_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_role_datagrid').datagrid('getRowIndex', id);
		$('#moduls_role_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editRole.jsp',
			width : 300,
			height : 150,
			modal : true,
			title : '编辑角色',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_editRole_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/roleController/updateRole.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#moduls_role_datagrid').datagrid('load');
									d.dialog('destroy');
								}
								$.messager.show({
									title : '提示',
									msg : r.info
								});
							} catch (e) {
								$.messager.alert('提示', result);
							}
						}
					});
				}
			}, {
				text : '取消',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				var rows = $('#moduls_role_datagrid').datagrid('getChecked');
				$('#moduls_fun_editRole_addForm').form('load', rows[0]);
			}
		});
	}
	function moduls_role_distributeFun(id) {
		if(id) {
			$('#moduls_role_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
			var index = $('#moduls_role_datagrid').datagrid('getRowIndex', id);
			$('#moduls_role_datagrid').datagrid('checkRow', index);
		}
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/RoleResources.jsp',
			width : 600,
			height : 400,
			modal : true,
			title : '角色拥有的资源',
			buttons : [ {
				text : '取消',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad : function() {
				$('#moduls_fun_RoleResources_datagrid').datagrid({
					url : '${pageContext.request.contextPath}/resourcesController/getDistributeResources.do?roleId='+id,
					fit : true,
					border : false,
					rownumbers : true,
					checkOnSelect : false,
					selectOnCheck : false,
					idField : 'resId',
					nowrap : false,
					columns : [ [  {
						title : '资源名称',
						field : 'resName',
						width : 150
					}, {
						title : '资源地址',
						field : 'resUrl',
						width : 150
					}, {
						title : '资源描述',
						field : 'resDes',
						width : 150
					}, {
						title : '资源状态',
						field : 'resState',
						width : 100
					} ] ]
				});
			}
		});
	}
	function moduls_role_addFun() {
		$('#moduls_role_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addRole.jsp',
			width : 300,
			height : 150,
			modal : true,
			title : '添加角色',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_addRole_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/roleController/addRole.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#moduls_role_datagrid').datagrid('load');
								d.dialog('destroy');
							}
							$.messager.show({
								title : '提示',
								msg : r.info
							});
						}
					});
				}
			}, {
				text : '取消',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ],
			onClose : function() {
				$(this).dialog('destroy');
			}
		});
	}
	function moduls_role_removeFun() {
		var rows = $('#moduls_role_datagrid').datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].roleId);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/roleController/deleteRole.do',
						data : {
							roleIds : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$('#moduls_role_datagrid').datagrid('load');
								$('#moduls_role_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
							}
							$.messager.show({
								title : '提示',
								msg : result.info
							});
						}
					});
				}
			});
		} else {
			$.messager.show({
				title : '提示',
				msg : '请勾选要删除的记录！'
			});
		}
	}
	function moduls_role_deleteFun(id) {
		$('#moduls_role_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_role_datagrid').datagrid('getRowIndex', id);
		$('#moduls_role_datagrid').datagrid('checkRow', index);
		moduls_role_removeFun();
	}
</script>
<table id="moduls_role_datagrid"></table>