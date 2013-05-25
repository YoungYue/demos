<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(function() {
		$('#moduls_effect_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/effectController/getEffect.do',
			fit : true,
			border : false,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'eid',
			nowrap : false,
			columns : [ [ {
				title : '编号',
				field : 'eid',
				width : 150,
				checkbox : true
			}, {
				title : '效果名称',
				field : 'eName',
				width : 150
			}, {
				title : '菜单类型',
				field : 'menuType',
				width : 150,
				formatter : function(value, row, index) {
					if(value == 0) {
						return "内容菜单";
					} else {
						return "扩展菜单";
					}
				}
			}, {
				title : '效果描述',
				field : 'eDescription',
				width : 350
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.eid == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="moduls_effect_editFun(\'{0}\');" src="{1}"/> &nbsp;&nbsp;&nbsp;' + '<img onclick="moduls_effect_deleteFun(\'{2}\');" src="{3}"/>', row.eid, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.eid, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					moduls_effect_addFun();
				}
			}, '-', {
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					moduls_effect_removeFun();
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#moduls_effect_datagrid').datagrid('reload');
				}
			} ]
		});
	});

	function moduls_effect_editFun(id) {
		console.info(id);
		$('#moduls_effect_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_effect_datagrid').datagrid('getRowIndex', id);
		$('#moduls_effect_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editEffect.jsp',
			width : 300,
			height : 200,
			modal : true,
			title : '编辑效果',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_editEffect_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/effectController/updateEffect.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#moduls_effect_datagrid').datagrid('load');
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
				var rows = $('#moduls_effect_datagrid').datagrid('getChecked');
				$('#moduls_fun_editEffect_addForm').form('load', rows[0]);
			}
		});
	}
	function moduls_effect_addFun() {
		$('#moduls_effect_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addEffect.jsp',
			width : 300,
			height : 200,
			modal : true,
			title : '添加效果',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_addEffect_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/effectController/addEffect.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								d.dialog('destroy');
								$('#moduls_effect_datagrid').datagrid('load');
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
	function moduls_effect_removeFun() {
		var rows = $('#moduls_effect_datagrid').datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].eid);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/effectController/deleteEffect.do',
						data : {
							eids : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$('#moduls_effect_datagrid').datagrid('load');
								$('#moduls_effect_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
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
	function moduls_effect_deleteFun(id) {
		$('#moduls_effect_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_effect_datagrid').datagrid('getRowIndex', id);
		$('#moduls_effect_datagrid').datagrid('checkRow', index);
		moduls_effect_removeFun();
	}
</script>
<table id="moduls_effect_datagrid"></table>