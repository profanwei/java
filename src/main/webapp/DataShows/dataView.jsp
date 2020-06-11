<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- miniui.js -->
      <script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
   
    <title>数据显示</title>
    <style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>

</head>
<body>
<table >
            <tr>
            	<td style="width:80px;">机床状态</td>
                <td style="width:60px;">
                	 <a class="mini-button" iconCls="icon-folder" plain="false" onclick="click1()">open</a>
                </td>
            </tr>
            <tr>
               <td>预约显示</td>
                <td>
                	 <a class="mini-button" iconCls="icon-folder" plain="false" onclick="click2()">open</a>
                </td>
            </tr>
   <!--          <tr>
            	<td>实时监控</td>
            	<td>
            		 <a class="mini-button" iconCls="icon-folder" plain="false" onclick="click3()">open</a>
            	</td>
            </tr> -->
                        <tr>
            	<td>任务统计</td>
            	<td>
            		 <a class="mini-button" iconCls="icon-folder" plain="false" onclick="click4()">open</a>
            	</td>
            </tr>
                        <tr>
            	<td>页面总览</td>
            	<td>
            		 <a class="mini-button" iconCls="icon-folder" plain="false" onclick="click5()">open</a>
            	</td>
            </tr>
        </table>
</body>
<script type="text/javascript">
   function click1(){
	   window.open("machineManage/machinestateplus.jsp");
	   
   }
   function click2(){
	   window.open("dataCollection/machineOrder.jsp");
	   
   }
   function click3(){
	   window.open("dataCollection/machines.jsp");
	   
   }
   function click4(){
	   window.open("taskCollection/graphicsdisplay2.jsp");
	   
   }
   function click5(){
	   window.open("dataCollection/alldata.jsp");
	   
   }



	

















</script>
</html>