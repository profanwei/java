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
   
    <title>数据清空</title>
    <style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>

</head>
<body>
<table style="">
            <tr>
            	<td style="width:80px;">FANUC</td>
                <td style="width:60px;">
                	 <a class="mini-button" iconCls="icon-remove" plain="false" onclick="clear1()">Clear</a>
                </td>
            </tr>
            <tr>
               <td>Hedehain</td>
                <td>
                	 <a class="mini-button" iconCls="icon-remove" plain="false" onclick="clear2()">Clear</a>
                </td>
            </tr>
            <tr>
            	<td>DMG</td>
            	<td>
            		 <a class="mini-button" iconCls="icon-remove" plain="false" onclick="clear3()">Clear</a>
            	</td>
            </tr>
        </table>
</body>
<script type="text/javascript">
function clear1(){
    mini.confirm("确定清除数据？一旦清除不可恢复！！", "提示",
            function (action) {
                if (action == "ok") {
                	$.ajax({
                		type: "post",
                		url:"ClearServlet",
                		success:function(){				
                		  mini.alert("清除成功")
                		    },
                		error : function() {
                		     mini.alert("清除失败，请重新尝试………"); 
                		}
                	});
                } else {
                	window.location.reload();
                }
            }
        );

}
function clear2(){
    mini.confirm("确定清除数据？一旦清除不可恢复！！", "提示",
            function (action) {
                if (action == "ok") {
                	$.ajax({
                		type: "post",
                		url:"ClearServlet1",
                		success:function(){				
                		  mini.alert("清除成功")
                		    },
                		error : function() {
                		     mini.alert("清除失败，请重新尝试………"); 
                		}
                	});
                } else {
                	window.location.reload();
                }
            }
        );

}
function clear3(){
    mini.confirm("确定清除数据？一旦清除不可恢复！！", "提示",
            function (action) {
                if (action == "ok") {
                	$.ajax({
                		type: "post",
                		url:"ClearServlet2",
                		success:function(){				
                		  mini.alert("清除成功")
                		    },
                		error : function() {
                		     mini.alert("清除失败，请重新尝试………"); 
                		}
                	});
                } else {
                	window.location.reload();
                }
            }
        );

}
	

















</script>
</html>