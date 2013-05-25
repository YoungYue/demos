<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="UTF-8">
	var menu_menuData;
	
	$(function() {
		$('#admin_menu_treegrid').treegrid({
			url : '${pageContext.request.contextPath}/menuController/getList.do',
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
				hidden : true
			}, {
				title : '菜单名称',
				field : 'text',
				width : 240
			}, {
				title : '菜单类型',
				field : 'menuType',
				width : 100,
				formatter : function(value, row, index) {
					var str = '';
					switch (value) {
					case '0':
						str = '内容菜单';
						break;
					case '1':
						str = '扩展菜单';
						break;
					}
					return str;
				}
			}, {
				title : '显示效果',
				field : 'effect.eName',
				width : 100,
				formatter : function(value, row, index) {
					//if(row.effect != null) {
						return row.effect.eName;
					//}
					//return '';
				}
			}, {
				title : '父级菜单id',
				field : 'pid',
				width : 60,
				hidden : true
			}, {
				field : 'action',
				title : '动作',
				width : 100,
				formatter : function(value, row, index) {
					if (row.menuType == '0') {
						return formatString('<img onclick="admin_menu_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;<img onclick="admin_menu_deleteFun(\'{2}\');" src="{3}"/>&nbsp;&nbsp;&nbsp;<img onclick="admin_menu_contentMenuManager(\'{4}\');" src="{5}"/>', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/edit_remove.png');
					} else {
						return formatString('<img onclick="admin_menu_editFun(\'{0}\');" src="{1}"/>&nbsp;&nbsp;&nbsp;<img onclick="admin_menu_deleteFun(\'{2}\');" src="{3}"/>', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png', row.id, 'jslib/jquery-easyui-1.3.1/themes/icons/cancel.png');
					}
				}
			} ] ],
			onLoadSuccess : function(row, data) {
				menu_menuData = data;
			},
			toolbar : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					admin_menu_appendFun();
				}
			}, '-', {
				text : '展开',
				iconCls : 'icon-redo',
				handler : function() {
					var node = $('#admin_menu_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_menu_treegrid').treegrid('expandAll', node.cid);
					} else {
						$('#admin_menu_treegrid').treegrid('expandAll');
					}
				}
			}, '-', {
				text : '折叠',
				iconCls : 'icon-undo',
				handler : function() {
					var node = $('#admin_menu_treegrid').treegrid('getSelected');
					if (node) {
						$('#admin_menu_treegrid').treegrid('collapseAll', node.cid);
					} else {
						$('#admin_menu_treegrid').treegrid('collapseAll');
					}
				}
			}, '-', {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#admin_menu_treegrid').treegrid('reload');
				}
			} ],
			onContextMenu : function(e, row) {
				if(row.effect.eid == 6 || row.effect.eid == 5) {
					$('#admin_menu_menu').menu('appendItem', {
						id : 'previewSubmenu',
						text: '预览子菜单位置',
						iconCls: 'icon-detailed',
						onclick: previewSubmenuPlace
					});
				}
				
				e.preventDefault();
				$(this).treegrid('unselectAll');
				$(this).treegrid('select', row.id);
				
				$('#admin_menu_menu').menu({
					onHide : function() {
						$('#admin_menu_menu').menu('removeItem',$('div[id=admin_menu_menu] div[id=previewSubmenu]'));
					}
				});
				
				$('#admin_menu_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
	});
	
	function admin_menu_contentMenuManager(id) {
		$('<div/>').dialog({
			href : 'moduls/contentMenu.html',
			width : 700,
			height : $(window).height(),
			closable : false,
			noheader : true,
			border : false,
			modal : true,
			buttons : [ {
				text : '退出',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ]
		});
	}
	
	function previewSubmenuPlace() {
		var row = $('#admin_menu_treegrid').treegrid('getSelected');
		
		set_moduls_fun_menuPorperty_parentBackgroundImg(row.id);
		$('<div/>').dialog({
			href : 'moduls/fun/menuPorperty/previewSubmenu.html',
			width : 512,
			height : 384,
			closable : false,
			noheader : true,
			border : false,
			modal : true,
			buttons : [ {
				text : '退出',
				iconCls : 'icon-remove',
				handler : function() {
					$(this).closest('.window-body').dialog('destroy');
				}
			} ]
		});
	}

	function admin_menu_appendFun() {
		$('#admin_jsgl_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/addMenu.jsp',
			width : 350,
			height : 250,
			modal : true,
			title : '添加菜单',
			buttons : [ {
				text : '增加',
				iconCls : 'icon-add',
				handler : function() {
					var d = $(this).closest('.window-body');
					
					var values = new Array();
					$.each($("#admin_menuAdd_addForm tr[id='addMenu_tr_epId']").find("input[class='combo-value']"), function(i, ep) {
						values.push(ep.value);
					});
					
					if(values.length != 0) {
						$("#admin_menuAdd_addForm input[name='epId']").val(values.join(","));
					}
					
					$('#admin_menuAdd_addForm').form('submit', {
						url : '${pageContext.request.contextPath}/menuController/addMenu.do',
						success : function(result) {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#admin_menu_treegrid').treegrid('reload');
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
	function admin_menu_editFun(id) {
		if (id != undefined) {
			$('#admin_menu_treegrid').treegrid('select', id);
		}
		var node = $('#admin_menu_treegrid').treegrid('getSelected', id);
		$('<div/>').dialog({
			href : '${pageContext.request.contextPath}/moduls/fun/editMenu.jsp',
			width : 350,
			height : 250,
			closable : false,
			modal : true,
			title : '菜单编辑',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					
					var values = new Array();
					$.each($("#admin_menuEdit_editForm tr[id='addMenu_tr_epId']").find("input[class='combo-value']"), function(i, ep) {
						values.push(ep.value);
					});
					if(values.length != 0) {
						$("#admin_menuEdit_editForm input[name='epId']").val(values.join(","));
					}
					
					$('#admin_menuEdit_editForm').form('submit', {
						url : '${pageContext.request.contextPath}/menuController/updateMenu.do',
						success : function(result) {
							try {
								var r = $.parseJSON(result);
								if (r.success) {
									$('#admin_menu_treegrid').treegrid('reload');
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
			onLoad : function() {
				$("#admin_menuEdit_editForm input[name='menuId']").val(node.id);
				$("#admin_menuEdit_editForm input[name='menuName']").val(node.text);
				if (node.pid != 0) {
					$("#admin_menuEdit_editForm select[id='parMenuId']").combotree('setValue', node.pid);
				}
				$("#admin_menuEdit_editForm select[id='menuType']").combobox('setValue', node.menuType);
				$("#admin_menuEdit_editForm select[id='effect_eid']").combobox('setValue', node.effect.eid);
				setTimeout(function() {
					$("#admin_menuEdit_editForm select[comboname='epId']").combobox('setValue', node.epId);
				}, 1000);
			}
		});
	}

	function admin_menu_deleteFun(id) {
		if (id != undefined) {
			$('#admin_menu_treegrid').treegrid('select', id);
		}
		var selectedNode = $('#admin_menu_treegrid').treegrid('getSelected');
		id = selectedNode.id;
		var menuIdArr = [];
		menuIdArr.push(id);
		var nodes = $('#admin_menu_treegrid').treegrid('getChildren', id);
		$.each(nodes, function(i, node) {
			menuIdArr.push(node.id);
		});
		$.messager.confirm('询问', '您确定要删除该菜单(子菜单也会被删除)？', function(b) {
			if (b) {
				$.ajax({
					url : '${pageContext.request.contextPath}/menuController/deleteMenu.do',
					data : {
						menuIds : menuIdArr.join(",")
					},
					cache : false,
					dataType : 'JSON',
					success : function(r) {
						if (r.success) {
							$('#admin_menu_treegrid').treegrid('reload');
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

	var moduls_menu_menuId;
	var moduls_menu_admin_menu_proFun_dialog;
	function admin_menu_proFun() {
		var selectedNode = $('#admin_menu_treegrid').treegrid('getSelected');
		var id = selectedNode.id;
		var node = $('#admin_menu_treegrid').treegrid('getSelected', id);
		var url = '${pageContext.request.contextPath}/moduls/fun/menuPorperty/';
		moduls_menu_menuId = node.id;
		switch (node.effect.eid) {
		case 4:
			url = url + 'jgg.html';
			break;
		case 5:
			url = url + 'rd.html';
			break;
		case 6:
			url = url + 'yl.html';
			break;
		default:
			url = url + 'dh.html';
		}

		$('<div/>').dialog({
			href : url,
			width : 350,
			height : 250,
			closable : false,
			modal : true,
			title : '菜单属性',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					var d = $(this).closest('.window-body');
					var obj = moduls_fun_menuPro_getFormValue();
					if(!obj.falg) {
						return;
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/menuController/updateMenuPro.do',
						data : {
							menuId : id,
							menuPro : obj.value
						},
						cache : false,
						dataType : 'JSON',
						type : 'POST',
						success : function(r) {
							if (r.success)
								d.dialog('destroy');
							$.messager.show({
								msg : r.info,
								title : '提示'
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
			onLoad : function() {
				moduls_menu_admin_menu_proFun_dialog = $(this).closest('.window-body');
			}
		});
	}
	
	/**
	 *检查父级菜单显示效果,
	 *如果是预览显示,那么 菜单属性需要动态增加预览图片和预览位置两个属性
	 *如果是热点显示,那么 菜单属性需要动态增加热点位置属性
	 */
	var moduls_fun_menuPorperty_parentBackgroundImg;
	function moduls_menu_checkParentEffect(formId) {
		var pid = $('#admin_menu_treegrid').treegrid('getSelected').pid;
		if(pid != 0) {
			var nodeData = $('#admin_menu_treegrid').treegrid('find', pid);
			if(nodeData.effect.eid == 6) {
				//父级菜单显示效果为预览类型
				var str = '<tr id="addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">预览图片:</th>'
					 	  + '<td><input name="previewMenuPicture" inputType="1" class="inputCss" style="width:180px;"></input>'
					 	  + '</td></tr>'
					 	  + '<tr id="addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">预览位置:</th>'
					 	  + '<td><input name="previewPlace" inputType2="1" iconInputName="previewMenuPicture" class="inputCss" style="width:180px;" /></td></tr>'
					 	  + '<tr id="addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">菜单位置:</th>'
					 	  + '<td><input name="menuPlace" inputType2="1" iconInputName="nodeMenuPicture" class="inputCss" style="width:180px;" /></td></tr>';
					 	  
				$('#'+ formId +' table').prepend(str);
				
			}else if(nodeData.effect.eid == 5) {
				//父级菜单显示效果为热点类型
				var str = '<tr id="addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">热点位置:</th>'
				 	  + '<td><input name="hotpointPlace" inputType2="1" iconInputName="nodeMenuPicture" class="inputCss" style="width:180px;"></input>'
				 	  + '</td></tr>';
				 	  
			$('#'+ formId +' table').prepend(str);
		}else if(nodeData.effect.eid == 4) {
			//父级菜单显示效果为九宫格类型
			var str = '<tr id="addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">是否占位:</th>'
			 	  + '<td><input type="checkbox" name="isZw" id="isZw" value="1" /></td></tr>';
			 	  
			$('#'+ formId +' table').prepend(str);
		}
			
			if(nodeData.effect.eid == 5 || nodeData.effect.eid == 6) {
				set_moduls_fun_menuPorperty_parentBackgroundImg(pid);
			}
		}
		
	};
	
	function set_moduls_fun_menuPorperty_parentBackgroundImg(pid) {
		$.ajax({
			url : 'menuController/getMenuPro.do',
			data : {
				menuId : pid
			},
			cache : false,
			async : false,
			dataType : 'JSON',
			success : function(r) {
				$(r).each(function(i,value) {
					if(value.proKey == 'nodeBackgroundPicture') {
						moduls_fun_menuPorperty_parentBackgroundImg = value.proValue;
						return;
					} 
				});
			}
		});
	}
	
	/**
	 *在上传文件组件上绑定一个事件
	 */
	var moduls_fun_menuPorperty_inputName;
	var moduls_fun_menuPorperty_oldFileName;
	var moduls_fun_menuPorperty_dialog;
	function moduls_menu_addClickOnUpFileInput(proName) {
		$("input["+proName+"]").click(function() {
			moduls_fun_menuPorperty_inputName = this.name;
			moduls_fun_menuPorperty_oldFileName = this.value;
			$('<div/>').dialog({
				href : 'moduls/fun/menuPorperty/uploadFile.html',
				width : 430,
				height : 370,
				closable : false,
				title : '上传文件',
				modal : true,
				buttons : [ {
					text : '取消',
					iconCls : 'icon-remove',
					handler : function() {
						$(this).closest('.window-body').dialog('destroy');
					}
				} ],
				onLoad : function() {
					moduls_fun_menuPorperty_dialog = $(this).closest('.window-body');
				}
			});
		});
		
	}
	
	/**
	 *在设置(预览、热点)位置组件上绑定一个事件
	 */
	var moduls_fun_menuPorperty_hotPointValueInputName;
	var moduls_fun_menuPorperty_hotPointIconInputName;
	var moduls_fun_menuPorperty_hotPoint_dialog;
	function moduls_menu_addClickOnSetPlaceInput(proName) {
		$("input["+proName+"]").click(function() {
			moduls_fun_menuPorperty_hotPointValueInputName = this.name;
			moduls_fun_menuPorperty_hotPointIconInputName = $(this).attr('iconInputName');
			$('<div/>').dialog({
				href : 'moduls/fun/menuPorperty/hotPoint.html',
				width : 650,
				height : 500,
				closable : false,
				noheader : true,
				border : false,
				modal : true,
				onLoad : function() {
					moduls_fun_menuPorperty_hotPoint_dialog = $(this).closest('.window-body');
				}
			});
		});
	}
</script>
<table id="admin_menu_treegrid"></table>
<div id="admin_menu_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="admin_menu_appendFun();" data-options="iconCls:'icon-add'">增加</div>
	<div onclick="admin_menu_deleteFun();" data-options="iconCls:'icon-remove'">删除</div>
	<div onclick="admin_menu_editFun();" data-options="iconCls:'icon-edit'">编辑</div>
	<div onclick="admin_menu_proFun();" data-options="iconCls:'icon-edit'">属性</div>
</div>