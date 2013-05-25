<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script type="text/javascript">
	$(function() {
		initMenuTree();
	});
	function initMenuTree() {
		$('#layout_west_menuTree').tree({
			lines : true,
			parentField : 'pid',
			url : '${pageContext.request.contextPath}/modelController/getMenu.do',
			onLoadSuccess : function(node, data) {
				$(this).tree('collapseAll');
				treeMenuData = data;
			},
			onClick : function(node) {
				if (node.attributes.url && node.attributes.url != '') {
					var url = '${pageContext.request.contextPath}' + node.attributes.url;
					addTab({
						title : node.text,
						href : url,
						closable : true
					});
				} else {
					if (node.state == 'closed') {
						$(this).tree('expand', node.target);
					} else {
						$(this).tree('collapse', node.target);
					}
				}
			}
		});
	}
</script>
<div data-options="border:false,fit:true">
	<div>
		<ul id="layout_west_menuTree"></ul>
	</div>
</div>
