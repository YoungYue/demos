<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$("#admin_menuAdd_addForm select[id='menuType']").combobox({
		onChange : function(newValue, oldValue) {
			var url = 'effectController/getListByMenuType.do?menuType='+newValue;   
            $('#effect_eid').combobox('reload', url); 
            $('#effect_eid').combobox('setValue', '');
		}
	});
	$("#admin_menuAdd_addForm select[id='effect_eid']").combobox({
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
			$('#admin_menuAdd_addForm_table').append(addMenu_Str);
			
			$("#admin_menuAdd_addForm select[name='"+selectName+"']").combobox({
				valueField : 'epId',
				textField : 'epValue',
				editable : false,
				data : $.parseJSON(ep.epValue),
				value : $.parseJSON(ep.epValue)[0].epId
			});
		});
		
	} else {
		$("#admin_menuAdd_addForm tr[id='addMenu_tr_epId']").remove();
	}
};
</script>
<div align="center">
	<form id="admin_menuAdd_addForm" method="post">
		<input type="hidden" name="epId" />
		<br />
		<table id="admin_menuAdd_addForm_table" class="tableForm">
			<tr>
				<th style="width: 60px;font-size: 12px; font-weight: normal;">菜单名称:</th>
				<td><input name="menuName" class="easyui-validatebox inputCss" style="width: 198px" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<th><font style="font-size: 12px; font-weight: normal;">父级菜单:</font></th>
				<td><select name="parMenuId" class="easyui-combotree" style="width: 200px" data-options="data:menu_menuData"></select>
				</td>
			</tr>
			<tr>
				<th style="font-size: 12px; font-weight: normal;">菜单类型:</th>
				<td><select id="menuType" name="menuType" class="easyui-combobox" data-options="panelHeight:50" name="dept" style="width:200px;">
						<option value="0">内容菜单</option>
						<option value="1">扩展菜单</option>
				</select>
				</td>
			</tr>
			<tr>
				<th style="font-size: 12px; font-weight: normal;">显示效果:</th>
				<td><select id="effect_eid" name="effect.eid" class="easyui-combobox" data-options="valueField:'eid', textField:'eName', url:'effectController/getListByMenuType.do?menuType=0'" name="dept" style="width:200px;">
				</select>
				</td>
			</tr>
		</table>
	</form>
</div>