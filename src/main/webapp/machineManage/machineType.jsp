<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"><script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
    <!-- miniui.js -->
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
    <title>新增设备</title>
    <style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>
  </head>
  
  <body>
  	<div class="mini-toolbar">
  		<a class="mini-button" iconCls="icon-save" plain="false"  onclick="add()">新增</a>
  		</div>
	<div id="grid1" class="mini-datagrid" style="width:100%;height:95%;"
         borderStyle="border:0;" multiSelect="true"  idField="id" showSummaryRow="true" allowAlternating="true" showPager="true"
         url="ShowMachineTypeServlet">
        <div property="columns">
            <div type="indexcolumn" headerAlign="center" align="center" >序号</div>
             <div name="action" width="30" headerAlign="center" align="center" renderer="onOperatePower"cellStyle="padding:0;">操作</div>
            <div field="machineType" width="100" headerAlign="center" align="center" >类型编号
            </div>
            <div field="typeName" width="100" headerAlign="center" align="center" >设备类型
            </div>


        </div>
    </div> 

   <script>
   mini.parse();
   var grid = mini.get("grid1");
   grid.load();
   function onOperatePower(e) {
       var str = "";
       str += "<span>";
       str += "<a style='margin-right:2px;' title='编辑' href=javascript:ondEdit(\'" + e.row.machineType+"\') ><span class='icon-remove' style='width:30px;height:20px;display:inline-block'></span></a>";
       str += "</span>";
       str += "<span>";

       return str;
   }
   
   function ondEdit(machineType){
		mini.confirm("删除类型", "提示",
                function (action){            
                  if (action == "ok") {
					 var url = "DeleteType?machineType="+machineType;
					 var params =null;
		   		        jQuery.post(url, params, function(data){
		   		        	
		   		         mini.alert(data.result, "提示",function(){

		  					window.grid.reload();
		  					
		  				 })/* alert(data.result);
		   	   		  		grid.reload(); */
		   	   		        },'json');
		   	   		 }
                }
            );
       
	}
   function add(machineId){
       window.location.href = "machineManage/addMachineType.jsp";
	}

   </script>
  </body>
</html>
