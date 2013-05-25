<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$("#admin_menuEdit_editForm select[id='menuType']").combobox({
		onChange : function(newValue, oldValue) {
			var url = 'effectController/getListByMenuType.do?menuType='+newValue;   
            $('#effect_eid').combobox('reload', url); 
            $('#effect_eid').combobox('setValue', '');
		}
	});
	
	$("#admin_menuEdit_editForm select[id='effect_eid']").combobox({
		url : 'effectController/getListByMenuType.do?menuType=' + $("#admin_menuEdit_editForm select[id='menuType']").combobox('getValue'),
		onChange : function(newValue, oldValue) {
			if(newValue) {
				$.get("effectProController/getList.do"
						, {eid : newValue}
						, moduls_fun_addMenu_setEffectPro
						,'json');
			}
		}
	});
});

var moduls_fun_addMenu_setEffectPro = function(data) {
	if(data.length > 0) {
		$.each(data, function(i, ep) {
			var selectName = "epId_temp" + i;
			var addMenu_Str = '<tr id = "addMenu_tr_epId"><th style="font-size: 12px; font-weight: normal;">'+ep.epKey+':</th>'
				  + '<td><select name="'+selectName+'"  style="width:200px;"></select></td></tr>';
			$('#admin_menuEdit_editForm_table').append(addMenu_Str);
			
			$("#admin_menuEdit_editForm select[name='"+selectName+"']").combobox({
				valueField : 'epId',
				textField : 'epValue',
				editable : false,
				data : $.parseJSON(ep.epValue),
				value : $.parseJSON(ep.epValue)[0].epId
			});
		});
		
		var row = $('#admin_menu_treegrid').treegrid('getSelected');
		if(row.epId) {
			var values = row.epId.split(",");
			$.each($("#admin_menuEdit_editForm tr[id='addMenu_tr_epId']").find("select"), function(i, epSelect) {
				if(i == values.length) {
					return;
				}
				$(epSelect).combobox('setValue', values[i]);
			});
		}
		
	} else {
		$("#admin_menuEdit_editForm tr[id='addMenu_tr_epId']").remove();
	}
};

$.extend($.fn.validatebox.defaults.rules, {
	checkMenuPid : {/* 父级菜单不能是自己或自己的子菜单 */
		validator : function(value, param) {
			var menuId = $("#admin_menuEdit_editForm input[name='menuId']").val();
			var parMenuId = $("#admin_menuEdit_editForm select[id='parMenuId']").combotree('getValue');
			var menuTree = $("#admin_menuEdit_editForm select[id='parMenuId']").combotree('tree');
			var node = menuTree.tree('find', parMenuId);
			
			while(true) {
				if(node == null) {
					return true;
				}
				parMenuId = node.id;
				if(parMenuId != 0 && parMenuId == menuId) {
					return false;
				}
				node = menuTree.tree('find', parMenuId);
				node = menuTree.tree('getParent', node.target);
			}
			return true;
		},
		message : '父级菜单不能是自己或自己的子菜单！'
	}
});
</script>

<div align="center">
	<form id="admin_menuEdit_editForm" method="post">
	<input type="hidden" name=menuId>
	<input type="hidden" name="epId" />
	<br/>
		<table id="admin_menuEdit_editForm_table" class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">菜单名称:</th>
				<td><input name="menuName" class="easyui-validatebox inputCss" style="width: 198px" data-options="required:true" /></td>
			</tr>
			<tr>
				<th><font style="font-size: 12px; font-weight: normal;">父级菜单:</font>
				</th>
				<td><select id="parMenuId" name="parMenuId" class="easyui-combotree" style="width: 200px" data-options="validType:'checkMenuPid', data:menu_menuData"></select></td>
			</tr>
			<tr>
				<th style="font-size: 12px; font-weight: normal;">菜单类型:</th>
				<td><select id="menuType" name="menuType" class="easyui-combobox" style="width:200px;">
						<option value="0">内容菜单</option>
						<option value="1">扩展菜单</option>
				</select></td>
			</tr>
			<tr>
				<th style="font-size: 12px; font-weight: normal;">显示效果:</th>
				<td><select id="effect_eid" name="effect.eid" class="easyui-combobox" data-options="valueField:'eid', textField:'eName', url:'effectController/getListByMenuType.do?menuType=0'" style="width:200px;">
				</select>
				</td>
			</tr>
		</table>
	</form>
</div>