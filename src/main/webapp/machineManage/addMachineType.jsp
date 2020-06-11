<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="<%=path%>/scripts/boot.js"></script>
<!-- miniui.js -->
<script type="text/javascript" src="<%=path%>/scripts/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/scripts/miniui/miniui.js"></script>
<script type="text/javascript" src="<%=path%>/scripts/boot.js"></script>
<link href="<%=path%>/scripts/miniui/themes/default/miniui.css"
	rel="stylesheet" type="txt/css"></link>
<link href="<%=path%>/scripts/miniui/themes/icons.css" rel="stylesheet"
	type="txt/css"></link>
<title>新增设备</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
fieldset {
    margin: 0 auto;
    float: none;
}
</style>
</head>

<body>
	<div class="mini-toolbar">
		<a class="mini-button" iconCls="icon-save" plain="false"
			onclick="getForm()">保存</a>
			<span class="separator"></span> 
		 <a class="mini-button" plain="false" iconCls="icon-undo" onclick="javascript:window.history.back(-1);">返回</a>
	</div>
	<fieldset style="width: 100%;" align="center">
		<legend> 新增设备类型 </legend>
		<div id="userdiv">
			<table style="text-align: left; border-collapse: collapse;"
				border="gray 1px solid;" width="100%">
				<tr>
					<td><label for="machineType$text">类型编号</label></td>
					<td><input id="machineType" name="machineType"
						class="mini-textbox" width="100%" required="true" emptyText="如Grinder"/></td>
					<td><label for="typeName$text">设备类型</label></td>
					<td><input id="typeName" name="typeName" class="mini-textbox"
						width="100%" required="true" emptyText="如磨床"/></td>
				</tr>
			</table>
		</div>



		<script>
		function getForm(){
   			var form = new mini.Form("#userdiv");

            	var data = form.getData();
                var params = eval("("+mini.encode(data)+")");
                var url = 'AddMachineType';
   		        jQuery.post(url, params, function(data){
   	   		  		mini.alert(data.result, "提示",
		                 function (){            		                    
		                    	window.location.href = window.location.href;			                    
		                 }
		             );
   	   		        },'json');
          
   		}
		</script>
</body>
</html>
