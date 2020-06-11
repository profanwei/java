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
    	#iframe1{
    		width:960px;
    	height:540px;
    	}
    	#iframe2{
    	position:relative;
    	right:0px;
    	top:0px;
    	width:960px;
    	height:540px;
    	}
    	#iframe3{
    	position:relative;
    	left:960px;
    	bottom:540px;
    	width:960px;
    	height:540px;
    
    	}
    	#iframe4{
    	position:relative;
    	right:-720px;
    	bottom:1755px;
    	width:960px;
    	height:540px;
    	transform:scale(0.5);
    	}
    	body{
    	width:1920px;
    	height:1080px;
    	
    	}
    </style>

</head>
<body>

<div id="iframe1" >
 <iframe  src="machineManage/machinestateplus.jsp" width=960px height=540px   ></iframe> 
</div >
<div id="iframe2">
<iframe  id="iframe" src="SuperSound1.jsp" width=960px height=540px   ></iframe>
</div>
<div id="iframe3">
<iframe  src="taskCollection/graphicsdisplay1.jsp" width=960px height=540px   ></iframe>
</div>
<div id="iframe4">
<iframe   width=1920px height=1080px src=""  ></iframe>  <!-- src="dataCollection/machineOrder1.jsp" -->
</div> 


</body>
<script type="text/javascript">
var i=2;

setInterval("changejsp()",60000);
function changejsp(){
	console.log(i);
	var params=["SuperSound1.jsp","HDHshowData1.jsp","FANUCshowData1.jsp","GrindershowData1.jsp"];
	document.getElementById("iframe").src=params[i];
	i++;
	if(i>3){
		i=0
	}
	
	
} 
/* function changeFrameHeight(){
    var ifm= document.getElementById("iframe1"); 
    ifm.height=document.documentElement.clientHeight/2;
    console.log(document.documentElement.clientHeight/2);

} */

/* window.onresize=function(){  
     changeFrameHeight();  

}  */
</script>
</html>