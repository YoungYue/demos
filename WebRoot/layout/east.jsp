<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#layout_east_calendar').calendar({  
			fit : false,
			border : false,
		    current:new Date()  
		});  
	});
</script>
<div id="layout_east_calendar" style="width:200px;height:200px;"></div>