<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
	var layout_center_Tabs;
	var layout_center_selected_title;
	$(function() {
		layout_center_Tabs = $('#layout_center_Tabs').tabs({
			border : false,
			fit : true,
			onLoad : function(panel) {
				/*panel.panel({
					extractor : function(data) {
						try {
							var r = $.parseJSON(data);
							if(r.success == false) {
								$.messager.show({
									title : '提示',
									msg : r.msg
								});
								layout_center_Tabs.tabs('close', layout_center_selected_title);
								return '';
							}else {
								return data;
							}
						} catch (e) {
							return data;
						}
					}
				});*/
			},
			onClose : function(title) {
				var tabNum = layout_center_Tabs.tabs('tabs').length;
				if(tabNum == 0) {
					$('#layout_center_tabs_img').css('display', 'block');;
				}
			}
		});
	});
	function addTab(option) {
		if (layout_center_Tabs.tabs('exists', option.title)) {
			layout_center_Tabs.tabs('select', option.title);
		} else {
			layout_center_selected_title = option.title;
			var tabNum = layout_center_Tabs.tabs('tabs').length;
			if(tabNum == 0) {
				$('#layout_center_tabs_img').css('display', 'none');;
			}
			setTimeout(function(){
				layout_center_Tabs.tabs('add', option);
			},0);
			
		}
	}
</script>
<div id="layout_center_Tabs">
	<img id="layout_center_tabs_img" src="">
</div>