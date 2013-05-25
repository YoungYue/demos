<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(function() {
		$('#moduls_group_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/resourcesController/getResources.do',
			fit : true,
			border : false,
			pagination : true,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'resId',
			nowrap : false,
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
				width : 150
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="moduls_group_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;<img onclick="moduls_group_deleteFun(\'{2}\');" src="{3}"/>', row.resId, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.resId, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					moduls_group_addFun();
				}
			}, '-', {
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					moduls_group_removeFun();
				}
			}, '-', {
				text : '资源分配',
				iconCls : 'icon-remove',
				handler : function() {
					distributeRes();
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#moduls_group_datagrid').treegrid('reload');
				}
			} ]
		});
	});
	
	function distributeRes() {
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/distributeRes.jsp',
			width : 700,
			height : 420,
			modal : true,
			title : '资源分配',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					var resIdArr = [];
					if(!$('#fun_distributeRes_roleId').combobox('isValid')) {
						$('#fun_distributeRes_roleId').focus();

						return;
					} 

					$('#ress option').each(function(i, option) {
						if ($(option).attr('falg') != 'old') {
							resIdArr.push(option.value);
						}
					});
					if(resIdArr.length == 0) {
						d.dialog('destroy');
						return;
					}
					
					$.ajax({
						url : '${pageContext.request.contextPath}/resourcesController/distributeResources.do',
						data : {
							roleId : $('#fun_distributeRes_roleId').combobox('getValue'),
							resIds : resIdArr.join(',')
						},
						type : 'POST',
						dataType : 'json',
						success : function(result) {
							if(result.success) {
								d.dialog('destroy');
							}
							$.messager.show({
								title : '提示',
								msg : result.info
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

	function moduls_group_editFun(id) {
		$('#moduls_group_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_group_datagrid').datagrid('getRowIndex', id);
		$('#moduls_group_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editResources.jsp',
			width : 350,
			height : 230,
			modal : true,
			title : '编辑资源',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_editGroup_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/resourcesController/updateResources.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#moduls_group_datagrid').datagrid('load');
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
				var rows = $('#moduls_group_datagrid').datagrid('getChecked');
				$('#moduls_fun_editGroup_addForm').form('load', rows[0]);
			}
		});
	}
	function moduls_group_addFun() {
		$('#moduls_group_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addResources.jsp',
			width : 350,
			height : 230,
			modal : true,
			title : '添加资源信息',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_addGroup_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/resourcesController/addResources.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#moduls_group_datagrid').datagrid('load');
								d.dialog('destroy');
							}
							$.messager.show({
								title : '提示',
								msg : r.info
							});
						}
					});
				}
			} , {
				text : '取消',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			}],
			onClose : function() {
				$(this).dialog('destroy');
			}
		});
	}
	function moduls_group_removeFun() {
		var rows = $('#moduls_group_datagrid').datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '确定删除选中组及组下成员？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].resId);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/resourcesController/deleteResources.do',
						data : {
							resIds : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$('#moduls_group_datagrid').datagrid('load');
								$('#moduls_group_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
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
	function moduls_group_deleteFun(id) {
		$('#moduls_group_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_group_datagrid').datagrid('getRowIndex', id);
		$('#moduls_group_datagrid').datagrid('checkRow', index);
		moduls_group_removeFun();
	}
</script>
<table id="moduls_group_datagrid"></table>