<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/js.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pagecard.css">
	<style type="text/css">
/* 	table {
	    table-layout:fixed;
	    word-break: break-all;
	}  */
	</style>
	<style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>
    
<script src="<%=path %>/resource/timePlanJs/jquery.min.js"></script>
<script src="resources/scripts/boot.js" type="text/javascript"></script>
<script src="resources/demo/datagrid/js/ColumnsMenu.js" type="text/javascript"></script>

<script src="<%=path %>/resource/timePlanJs/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/resource/timePlanJs/layer.js"></script>
<script src="<%=path %>/resource/timePlanJs/template.js"></script>
<script src="<%=path %>/resource/timePlanJs/moment-with-locales.js"></script>
<script src="<%=path %>/resource/timePlanJs/laypage.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.qrcode.min.js"></script>

<!--jquery validate begin-->
<script src="<%=path %>/resource/timePlanJs/jquery.validate.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/messages_zh.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.validate.extend.js"></script>
<!--jquery validate end-->

<script src="<%=path %>/resource/timePlanJs/utils.js"></script>
    
    
	<script type='text/javascript' src="<%=basePath%>resources/js/tabcard.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery.min.js"></script>
	<jsp:include page="/commons/miniui_header.jsp" />
	
 <style>
    .labelTd
    {
        text-align:center;
        text-indent:5px;
        }
    </style>
</head>
<body>
	<a  class="mini-button" iconCls="icon-undo" plain="false"  onclick="javascript:history.back(-1)">返回</a>
	<form id="form1">
	   	<table>
		<td><label>客户名称:</label></td>
		<td>
		<input id="workname" class="mini-textbox" style="" textField="text" valueField="id" 
   			value=""   allowInput="true" onvaluechanged="search()"/></td>
   		<td><span>&nbsp;</span></td>
	          <td><input value="查询" type="button" onclick="loadgrid()" style="width:50px;"/></td>
   		</table>
   	</form>
	<div id="grid12" class="mini-datagrid" style="width:100%;height:95%;"
         borderStyle="border:0;" multiSelect="true"  idField="id" showSummaryRow="true" allowAlternating="true" showPager="true"
         url="Xiangxi1servlet">
        <div property="columns">
            <div type="indexcolumn" headerAlign="center" align="center" >序号</div>
            <div field="workname" width="100" headerAlign="center" align="center">客户名称</div>
            <div field="yujishiyong" width="100" headerAlign="center" align="center">累计预约时间（小时）</div>
            <div field="shijishiyong" width="100" headerAlign="center" align="center">累计实际使用时间（小时）</div>
        </div>
    </div>
    
    <script type="text/javascript">
    mini.parse();
    var grid = mini.get("grid12");
    grid.load(); 
	function search(){
		var workname = mini.get("workname").getFormValue();
		 $.ajax({
             type: "POST",
             url:"Xiangxi1servlet",
             data: {
            	 workname: workname
             },
             dataType: "json",
             success: function(data){	 
				if(data.result=true){
					grid.load({workname:workname});
                 } else {
                     U.msg("失败");
                 }
                      }
         });
	}
	 </script>
</body>
</html>