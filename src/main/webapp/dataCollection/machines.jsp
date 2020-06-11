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
   
    <title>页面轮播</title>
    <style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>

</head>
<body>
<div>
<iframe id="myIframe" src="SuperSound.jsp" width=100%  onload="changeFrameHeight()" ></iframe>
</div>

</body>
<script type="text/javascript">
var i=1;

setInterval("changejsp()",5000);
function changejsp(){
	console.log(i);
	var params=["SuperSound.jsp","HDHshowData.jsp","FANUCshowData.jsp"];
	
	document.getElementById("myIframe").src=params[i];
	i++;
	if(i>2){
		i=0
	}
	
	
} 
function changeFrameHeight(){
    var ifm= document.getElementById("myIframe"); 
    ifm.height=document.documentElement.clientHeight;
    console.log(document.documentElement.clientHeight);

}

window.onresize=function(){  
     changeFrameHeight();  

} 



	

















</script>
</html>