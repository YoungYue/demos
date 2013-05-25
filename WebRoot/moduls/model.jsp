<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
 
	$(function() {
		$('#admin_zygl_treegrid').treegrid({
			url : '${pageContext.request.contextPath}/modelController/getModel.do',
			idField : 'id',
			treeField : 'text',
			parentField : 'pid',
			fit : true,
			fitColumns : false,
			nowrap : false,
			border : false,
			columns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				checkbox : true,
				hidden : true
			}, {
				title : '模块名',
				field : 'text',
				width : 240
			}, {
				title : '模块编码',
				field : 'modCode',
				width : 60
			}, {
				title : '父模块',
				field : 'pid',
				width : 60,
				hidden : true
			}, {
				title : '模块地址',
				field : 'modUrl',
				width : 200
			}, {
				title : '模块描述',
				field : 'modDes',
				width : 180
			}, {
				field : 'action',
				title : '动作',
				width : 70,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="admin_model_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;<img onclick="admin_zygl_deleteFun(\'{2}\');" src="{3}"/>', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					admin_jsgl_appendFun();
				}
			}, '-', {
				text : '展开',
				iconCls : 'icon-redo',
				handler : function() {
					var node = $('#admin_zygl_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_zygl_treegrid').treegrid('expandAll', node.cid);
					} else {
						$('#admin_zygl_treegrid').treegrid('expandAll');
					}
				}
			}, '-', {
				text : '折叠',
				iconCls : 'icon-undo',
				handler : function() {
					var node = $('#admin_zygl_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_zygl_treegrid').treegrid('collapseAll', node.cid);
					} else {
						$('#admin_zygl_treegrid').treegrid('collapseAll');
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#admin_zygl_treegrid').treegrid('reload');
				}
			} ],
			onContextMenu : function(e, row) {
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.id);
				$('#admin_zygl_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});

	function admin_jsgl_appendFun() {
		$('#admin_jsgl_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addModel.jsp',
			width : 500,
			height : 200,
			modal : true,
			title : '添加模块',
			buttons : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#admin_modelAdd_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/modelController/addModel.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#layout_west_menuTree').tree('reload');
								$('#admin_zygl_treegrid').treegrid('reload');
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
	function admin_model_editFun(id) {
		if (id != undefined) {
			$('#admin_zygl_treegrid').treegrid('select', id);
		}
		var node = $('#admin_zygl_treegrid').treegrid('getSelected');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editModel.jsp',
			width : 500,
			height : 200,
			modal : true,
			title : '模块编辑',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#admin_modelEdit_editForm').form('submit', {
						url : '${pageContext.request.contextPath}/modelController/updateModel.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#layout_west_menuTree').tree('reload');
									$('#admin_zygl_treegrid').treegrid('reload');
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
				$('#admin_modelEdit_editForm').form('load', node);
				$("#admin_modelEdit_editForm input[name='modId']").val(node.id);
				$("#admin_modelEdit_editForm input[name='modName']").val(node.text);
				if (node.pid != -1) {
					$('#admin_modelEdit_editForm select').combotree('setValue', node.pid);
				}
			}
		});
	}
	function admin_zygl_deleteFun(id) {
		if (id != undefined) {
			$('#admin_zygl_treegrid').treegrid('select', id);
		}
		var selectedNode = $('#admin_zygl_treegrid').treegrid('getSelected');
		id = selectedNode.id;
		var modelIdArr = [];
		modelIdArr.push(id);
		var nodes = $('#admin_zygl_treegrid').treegrid('getChildren', id);
		$.each(nodes, function(i, node){
			modelIdArr.push(node.id);
		});
		$.messager.confirm('询问', '您确定要删除该模块(子模块也会被删除)?', function(b) {
			if (b) {
				$.ajax({
					url : '${pageContext.request.contextPath}/modelController/deleteModel.do',
					data : {
						modIds : modelIdArr.join(",")
					},
					cache : false,
					dataType : 'JSON',
					success : function(r) {
						if (r.success) {
							$('#layout_west_menuTree').tree('reload');
							$('#admin_zygl_treegrid').treegrid('reload');
						}
						$.messager.show({
							msg : r.info,
							title : '提示'
						});
					}
				});
			}
		});
	}
</script>
<table id="admin_zygl_treegrid"></table>
<div id="admin_zygl_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="admin_zygl_appendFun();" data-options="iconCls:'icon-add'">增加</div>
	<div onclick="admin_zygl_deleteFun();" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="admin_zygl_editFun();" data-options="iconCls:'icon-edit'">编辑</div>
</div>