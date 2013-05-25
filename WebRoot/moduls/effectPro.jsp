<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">

	$(function() {
		$('#moduls_effectPro_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/effectProController/getList.do',
			fit : true,
			border : false,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'epId',
			nowrap : false,
			columns : [ [ {
				title : '编号',
				field : 'epId',
				width : 150,
				checkbox : true
			}, {
				title : '属性名称',
				field : 'epKey',
				width : 150
			}, {
				title : '属性值',
				field : 'epValue',
				width : 150,
				formatter : function(value, row, index) {
					var values = new Array();
					$.each($.parseJSON(row.epValue), function(i, ep) {
						values.push(ep.epValue);
					});
					return values.join(",");
				}
			}, {
				title : '所属效果',
				field : 'effect.eid',
				width : 200,
				formatter : function(value, row, index) {
					return row.effect.eName;
				}
			}, {
				title : '属性注释',
				field : 'epNote',
				width : 200
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="moduls_effectPro_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;' + '<img onclick="moduls_effectPro_deleteFun(\'{2}\');" src="{3}"/>', row.epId, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.epId, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					moduls_effectPro_addFun();
				}
			}, '-', {
				text : '批量删除',
				iconCls : 'icon-remove',
				handler : function() {
					moduls_effectPro_removeFun();
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#moduls_effectPro_datagrid').datagrid('reload');
				}
			} ]
		});
	});

	function moduls_effectPro_editFun(id) {
		$('#moduls_effectPro_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_effectPro_datagrid').datagrid('getRowIndex', id);
		$('#moduls_effectPro_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editEffectPro.html',
			width : 300,
			height : 180,
			modal : true,
			title : '编辑显示效果属性',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_editEffectPro_editForm').form('submit', {
						url : '${pageContext.request.contextPath}/effectProController/update.do',
						success : function(result) {
							try {
								var info = '修改失败！';
								var r = $.parseJSON(result);
								if (r.success) {
									info = '修改成功！';
									$('#moduls_effectPro_datagrid').datagrid('load');
									d.dialog('destroy');
								}
								$.messager.show({
									title : '提示',
									msg : info
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
				var rows = $('#moduls_effectPro_datagrid').datagrid('getChecked');
				console.info(rows);
				$('#moduls_fun_editEffectPro_editForm').form('load', rows[0]);
				$("#moduls_fun_editEffectPro_editForm input[id='eid']").combobox('setValue',rows[0].effect.eid);
			}
		});
	}
	
	function moduls_effectPro_addFun() {
		$('#moduls_effectPro_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addEffectPro.html',
			width : 320,
			height : 220,
			modal : true,
			title : '添加显示效果属性',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_addEffectPro_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/effectProController/add.do',
						success : function(result) {
							var info = '添加失败！';
							var r = $.parseJSON(result);
							if (r.success) {
								info = '添加成功！';
								$('#moduls_effectPro_datagrid').datagrid('load');
								d.dialog('destroy');
							}
							$.messager.show({
								title : '提示',
								msg : info
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
	function moduls_effectPro_removeFun() {
		var rows = $('#moduls_effectPro_datagrid').datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].epId);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/effectProController/delete.do',
						data : {
							ids : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							var info = '删除失败！';
							if (result.success) {
								info = '删除成功！';
								$('#moduls_effectPro_datagrid').datagrid('load');
								$('#moduls_effectPro_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
							}
							$.messager.show({
								title : '提示',
								msg : info
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
	function moduls_effectPro_deleteFun(id) {
		$('#moduls_effectPro_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_effectPro_datagrid').datagrid('getRowIndex', id);
		$('#moduls_effectPro_datagrid').datagrid('checkRow', index);
		moduls_effectPro_removeFun();
	}
</script>
<table id="moduls_effectPro_datagrid"></table>