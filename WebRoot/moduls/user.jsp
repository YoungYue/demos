<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
	$(function() {
		$('#moduls_user_datagrid').datagrid({
			url : '${pageContext.request.contextPath}/userController/getUser.do',
			fit : true,
			border : false,
			pagination : true,
			rownumbers : true,
			checkOnSelect : false,
			selectOnCheck : false,
			idField : 'userId',
			nowrap : false,
			columns : [ [ {
				title : '编号',
				field : 'userId',
				width : 150,
				checkbox : true
			}, {
				title : '用户名',
				field : 'username',
				width : 80
			}, {
				title : '所属角色',
				field : 'role.roleId',
				width : 150,
				formatter : function(value, row, index) {
					if (value == 0)
						return '';
					if(row.role != null) {
						return row.role.roleName;
					}
					return '';
				}
			}, {
				title : '状态',
				field : 'state',
				width : 80
			}, {
				title : '认证码',
				field : 'valiCode',
				width : 80
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.id == '0') {
						return '系统角色';
					} else {
						return formatString('<img onclick="moduls_user_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;<img onclick="moduls_user_deleteFun(\'{2}\');" src="{3}"/>&nbsp;&nbsp;&nbsp;<img onclick="moduls_user_modifyUserPassFun(\'{4}\');" src="{5}"/>', row.userId, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.userId, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png', row.userId, 'jslib/jquery-easyui-1.3.1/themes/icons/lock_edit.png');
					}
				}
			} ] ],
			toolbar : '#moduls_user_datagrid_toolbar'
		});
	});

	function moduls_user_editFun(id) {
		$('#moduls_user_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_user_datagrid').datagrid('getRowIndex', id);
		$('#moduls_user_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editUser.jsp',
			width : 500,
			height : 200,
			modal : true,
			title : '编辑用户',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_editUser_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/userController/updateUser.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#moduls_user_datagrid').datagrid('load');
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
				var rows = $('#moduls_user_datagrid').datagrid('getChecked');
				$('#moduls_fun_editUser_addForm').form('load', rows[0]);
				$("#moduls_fun_editUser_addForm input[id='roleId']").combobox('setValue',rows[0].role.roleId);
			}
		});
	}
	function moduls_user_addFun() {
		$('#moduls_user_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addUser.jsp',
			width : 500,
			height : 180,
			closable : false,
			modal : true,
			title : '添加用户',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_addUser_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/userController/addUser.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#moduls_user_datagrid').datagrid('load');
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
	function moduls_user_removeFun() {
		var rows = $('#moduls_user_datagrid').datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			$.messager.confirm('确认', '您是否要删除当前选中的项目？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].userId);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/userController/deleteUser.do',
						data : {
							userIds : ids.join(',')
						},
						dataType : 'json',
						success : function(result) {
							if (result.success) {
								$('#moduls_user_datagrid').datagrid('load');
								$('#moduls_user_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
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
	function moduls_user_deleteFun(id) {
		$('#moduls_user_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_user_datagrid').datagrid('getRowIndex', id);
		$('#moduls_user_datagrid').datagrid('checkRow', index);
		moduls_user_removeFun();
	}
	
	function moduls_user_modifyUserPassFun(id) {
		$('#moduls_user_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		var index = $('#moduls_user_datagrid').datagrid('getRowIndex', id);
		$('#moduls_user_datagrid').datagrid('checkRow', index);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/modifyUserPass.jsp',
			width : 300,
			height : 150,
			modal : true,
			title : '修改密码',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					$('#moduls_fun_modifyUserPass_modifyForm').form('submit', {
						url : '${pageContext.request.contextPath}/userAction!modifyPass.action',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									d.dialog('destroy');
								}
								$.messager.show({
									title : '提示',
									msg : r.msg
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
				var rows = $('#moduls_user_datagrid').datagrid('getChecked');
				console.info(rows);
				$('#moduls_fun_modifyUserPass_modifyForm input[name=userId]').val(rows[0].userId);
			}
		});
	}
</script>
<table id="moduls_user_datagrid"></table>

<div id="moduls_user_datagrid_toolbar">
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="moduls_user_addFun();">增加</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="moduls_user_removeFun();">批量删除</a>
	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" onclick="$('#moduls_user_datagrid').datagrid('reload');">刷新</a>
	<input id="moduls_user_datagrid_toolbar_user"></input>  
</div>

<script type="text/javascript" charset="UTF-8">
$(function() {
	
	$('#moduls_user_datagrid_toolbar_user').searchbox({  
	    searcher:function(username,groupId){  
	        console.info(username + "," + groupId)  ;
	        $('#moduls_user_datagrid').datagrid('load', {
	        	groupId : groupId,
	        	q : username
	        });
	    },  
	    prompt:'请输入用户编号'  
	});  
});
</script>