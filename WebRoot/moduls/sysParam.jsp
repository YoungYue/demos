<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	var imgUrl = "${pageContext.request.contextPath}/resources/userFiles/"
					+ north_crrUser.userId 
					+ "/sysParamFiles/";
	$('#moduls_sysParam_datagrid').datagrid({
		url : '${pageContext.request.contextPath}/sysParamController/getSysParam.do?falg=0',
		fit : true,
		border : false,
		checkOnSelect : false,
		selectOnCheck : false,
		idField : 'sid',
		nowrap : false,
		columns : [ [ {
			title : 'ID',
			field : 'sid',
			width : 150,
			hidden : true
		}, {
			title : '参数名称',
			field : 'paraName',
			width : 150
		}, {
			title : '文件缩略图',
			field : 'thumbnail',
			width : 200,
			formatter : function(value, row, index) {
				if(row.paraFile != null) {
					return '<img src="'+imgUrl + row.paraFile +'" width="190" height="100" onLoad="moduls_sysParam_imgOnLoad(this)"></img>';
				} else {
					return '';
				}
			}
		}, {
			field : 'action',
			title : '动作',
			width : 100,
			formatter : function(value, row, index) {
				if (row.id == '0') {
					return '系统角色';
				} else {
					return formatString('<img title="设置文件" onclick="moduls_sysParam_editFun(\'{0}\');" src="{1}"/>', row.sid, 'jslib/jquery-easyui-1.3.1/themes/icons/pencil.png');
				}
			}
		} ] ]
	});
});

function moduls_sysParam_imgOnLoad(img) {
	console.info(img.src);
	var theImage = new Image();
	theImage.src = $(img).attr("src");
	var nowImageWidth = Math.round(theImage.width/(theImage.height/100));
	$(img).attr({
		width : nowImageWidth,
		heigth : 100
	});
}

function moduls_sysParam_editFun(id) {
	$('#moduls_sysParam_datagrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
	var index = $('#moduls_sysParam_datagrid').datagrid('getRowIndex', id);
	$('<div/>').dialog({
		href : '${pageContext.request.contextPath}/moduls/fun/editSysParam.html',
		width : 300,
		height : 150,
		modal : true,
		title : '参数编辑',
		buttons : [ {
			text : '保存',
			iconCls : 'icon-save',
			handler : function() {
				var d = $(this).closest('.window-body');
				$('#moduls_fun_editSysParam_Form').form('submit', {
					url : '${pageContext.request.contextPath}/sysParamController/updateSysParam.do',
					success : function(result) {
						try {
							var r = $.parseJSON(result);
							if (r.success) {
								$('#moduls_sysParam_datagrid').datagrid('load');
								d.dialog('destroy');
							}
							$.messager.show({
								title : '提示',
								msg : '参数设置成功！'
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
			var row = $('#moduls_sysParam_datagrid').datagrid('getSelected');
			console.info(row);
			$('#moduls_fun_editSysParam_Form').form('load', row);
		}
	});
}
</script>
<table id="moduls_sysParam_datagrid"></table>