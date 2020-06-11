<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="com.wl.forms.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <script type="text/javascript" src="<%=path %>/staticResources/js/mqttws31.min.js"></script>
    <!-- miniui.js -->
      <script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
<title>机床状态</title>
<style type="text/css">
    	.state{float:right;
    			position: absolute;
				top: 1%;
				left: 80%;
				height: 5%;
				width: 5%;
    	}
    	span{
    	font-size:15px;
    	}
    	.state1{
    		width:40px;
    		height:20px;
    		float:left;
    	}
    	.state2{
    		width:64px;
    		height:20px;
    		float:left;
    	}
    	input{
    	width:100px;
    	height:20px;
    	line-height:30px;
    	text-align:center;
    	}
    	.zhuangtai{
    	float:left;
    	}
    	img{
    	width:150px;
    	height:150px;
    	float:left;
    	}
    	*{margin:2px;padding:2px;}
    	td{
    	position: relative;
    	width:13%;
    	}
    	body{
    	font-size:1px; 
    	
    /* 	overflow-x:hidden;
    	overflow-y:hidden; */
    	}
    	table{
		  table-layout: fixed;
			}
		table tr{
 			 height: 100px;
 			 width:200px;
				}
    	.circle1{
    	width: 10px;      
    	height: 10px;      
    	background-color:dark;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	float:left;
    	position:relative;
    	top:5px;
    	}   
    	.circle2{
    	width: 10px;      
    	height:10px;      
    	background-color:dark;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	float:left;
    	position:relative;
    	top:5px;
    	}
    	.circle3{
    	width:10px;      
    	height:10px;      
    	background-color:dark;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	float:left;
    	position:relative;
    	top:5px;
    	}
    	.circle4{
    	width: 5px;      
    	height: 5px;      
    	background-color:green;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	}   
    	.circle5{
    	width: 10px;      
    	height: 10px;      
    	background-color:red;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	}
    	.circle6{
    	width:10px;      
    	height:10px;      
    	background-color:gray;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	}  
    	.circle7{
    	width:10px;      
    	height:10px;      
    	background-color:blue;      
    	border-radius: 50%;  
    	margin:10px;
    	padding:10px;
    	}   
    	h4{
    	float:left;
    	font-size:15px;
    	}	
    	h3{
    	text-align:center;
    	}
    	h1{
    	text-align:center;
    	font-size:20px;
    	}
    	#machinestate{
    	position:relative;
    	left:100px;
    	top:80px;
    	}
    	#prompt{
    	position:relative;
    	left:80px;
    	top:-20px;
    	}
    </style>
</head>
<body> 
	   	<div id= "machinestate" style="width:1600px;height:760px;">
	   		<div style="width:46%; float:left;">
	   		<h1>101实验室</h1>
	   		<table style="height:400px;text-align: center;border-collapse:collapse;" border="gray 2px solid;">
	   		<tr>
	           <td >
	           <div id="images"><img src="resources/images/DHHCX.jpg" />
	           </div><br>
	           	<div class="zhuangtai"><h4>数控电火花成形机床</h4><br><br>
	           		<div id="103" class="circle3"></div>
					<div id="102" class="circle2"></div>
					<div id="101" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="ROBOTRM35" /></p></div>
				</td>
				<td>
	           <div><img src="resources/images/CJMCX.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>超精密成形平面磨床</h4><br><br>
	           		<div id="203" class="circle3"></div>
					<div id="202" class="circle2"></div>
					<div id="201" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="WAZA415X-NC" /></p></div>
				</td>
			</tr>
	   		<tr>
	   			<td>
	           <div><img src="resources/images/DSZS.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>数控低速走丝电火花线切割</h4><br><br>
	           		<div id="303" class="circle3"></div>
					<div id="302" class="circle2"></div>
					<div id="301" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="E-CUT"  /></p></div>
				</td>
				<td>
	           <div><img src="resources/images/SKCC.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>数控车床</h4><br><br>
	           		<div id="403" class="circle3"></div>
					<div id="402" class="circle2"></div>
					<div id="401" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="SK50P"  /></p></div>
				</td>
			</tr>
			
	   		<tr>
	   		<td>
	           <div><img src="resources/images/SKGSCXMC.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>数控高速成形磨床</h4><br><br>
	           		<div id="503" class="circle3"></div>
					<div id="502" class="circle2"></div>
					<div id="501" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="MT408"  /></p></div>
	            		
				</td>
				<td>
	           <div><img src="resources/images/CNC.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>CNC雕刻机</h4><br><br>
	           		<div id="603" class="circle3"></div>
					<div id="602" class="circle2"></div>
					<div id="601" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="睿雕400MTRT"  /></p></div>
				</td>
			</tr>

			</table>
			</div>
	   		<div style="width:46%; float:left;">
	   		<h1>102实验室</h1>
	   		<table style="text-align: left;border-collapse:collapse;" border="gray 2px solid;">
	   		<tr>
	           <td>
	           <div><img src="resources/images/CXFH.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>车铣复合加工中心</h4><br><br>
	           		<div id="703" class="circle3"></div>
					<div id="702" class="circle2"></div>
					<div id="701" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="M35 MILLTURN/2000M"  /></p></div>
				</td>
				<td>
	           <div><img src="resources/images/GSWZB.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>高速五坐标加工中心</h4><br><br>
	           		<div id="803" class="circle3"></div>
					<div id="802" class="circle2"></div>
					<div id="801" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="VCP710" /></p></div>
				</td>
			</tr>
	   		<tr>
	   			<td>
	           <div><img src="resources/images/chaogaosumo.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>超高速磨床</h4><br><br>
	           		<div id="903" class="circle3"></div>
					<div id="902" class="circle2"></div>
					<div id="901" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="HZ-Y150"  /></p></div>
				</td>
				<td>
	           <div><img src="resources/images/JGZX.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>倒立式车削加工中心</h4><br><br>
	           		<div id="1003" class="circle3"></div>
					<div id="1002" class="circle2"></div>
					<div id="1001" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="VL2"  /></p></div>
				</td>
			</tr>
			
	   		<tr>
	   		<td>
	           <div><img src="resources/images/CSFZ1.jpg" />
	           </div><br/>
	           	<div class="zhuangtai"><h4>超声辅助高速加工中心</h4><br><br>
	           		<div id="1103" class="circle3"></div>
					<div id="1102" class="circle2"></div>
					<div id="1101" class="circle1"></div><br><br><br><br>
				 <p><span >设备型号</span><input type="text" value="定制" /></p></div>
				</td>
			<td>
				<div id="prompt">
					<div class="state1"><div >&nbsp;开机</div><div   class="circle4"></div></div>
					<div class="state1"><div >&nbsp;报警</div><div   class="circle5"></div></div>
					<div class="state1"><div >&nbsp;关机</div><div   class="circle6"></div></div>
					<div class="state2"><div >已有预约&nbsp;</div><div   class="circle7"></div></div>
				</div>
			</td>
			</tr>

			</table>
			</div>
		</div>
<script type="text/javascript">
		var runTime1 =0;  
		var runTime2 =0;
		var runTime3 =0;
		var runTime4 =0;
		var runTime5 =0;
		var runTime6 =0;
		var runTime7 =0;
		var runTime8 =0;
		var runTime9 =0;
		var runTime10 =0;
		var runTime11 =0;
		var beginTime1 =0;  
		var beginTime2 =0;
		var beginTime3 =0;
		var beginTime4 =0;
		var beginTime5 =0;
		var beginTime6 =0;
		var beginTime7 =0;
		var beginTime8 =0;
		var beginTime9 =0;
		var beginTime10 =0;
		var beginTime11 =0;
		var clientid='<%=((User)session.getAttribute("user")).getStaffCode() %>'+Math.random();console.log(clientid);
		client = new Paho.MQTT.Client("222.192.72.12",8083,clientid); //建立客户端实例
		client.connect({
			onSuccess: onConnect,
			userName: "admin",
			password: "public"
		}); //连接服务器并注册连接成功处理事件
		client.onConnectionLost = onConnectionLost; //注册连接断开处理事件
		client.onMessageArrived = onMessageArrived; //注册消息接收处理事件
		function onConnect() {
			console.log("已连接");
		 	client.subscribe("DataCollect/Heidehain/Machine_5504"); //订阅主题
			client.subscribe("DataCollect/Fanuc/Machine_5505"); 
			client.subscribe("DataCollect/DMG/Machine_5503");
			client.subscribe("DataCollect/Grinder/Machine_5513");

		}
		function onConnectionLost(responseObject) {
			if(responseObject.errorCode !== 0) {
				console.log("连接已断开");
			}
			client.connect({
				onSuccess: onConnect,
				userName: "admin",
				password: "public"
			});

		}
		function onMessageArrived(message) {
			 topic = message.destinationName;
			 payload = message.payloadString;
		
			 var strs= new Array(); //定义一数组 
		     strs=payload.split(","); //字符分割
		     
		     if(strs[1]=='高速五坐标加工中心'){
		    	 isOn=strs[26];
		    	 isWaring = strs[20];
		    	 /* runTime8 = strs[11]; 
		    	 beginTime8 = strs[10]; 
		    	 document.getElementById('runTime8').value=runTime8;
		    	 document.getElementById('beginTime8').value=beginTime8; */
		    	 if(isOn.includes("NOT")){
			    	 document.getElementById("801").style.background="gray";
			    	}
		    	 else{
		    		 document.getElementById("801").style.background="green";
		    	 }
		    	 if(isWaring==null||isWaring==""){
		    	 }else{		    		 
		    		 document.getElementById("802").style.background="red";
		    	 }
	
		     }
		     else if(strs[1]=='加工中心'){
		    	 isOn = strs[46];
		    	 isWaring = strs[38];
		    	 /* console.log(isWaring);
		    	 runTime10 = strs[43]; 
		    	 var myArray=new Array();
		    	 var myArray1=new Array()
		    	 myArray=runTime10.split("h");
		    	 myArray1=myArray[1].split("m");
		    	 runTime10=myArray[0]+":"+myArray1[0];
		    	 beginTime10 = strs[48]; 
		    	 var myArray2=new Array();
		    	 var myArray3=new Array()
		    	 myArray2=beginTime10.split("h");
		    	 myArray3=myArray[1].split("m");
		    	 beginTime10=myArray2[0]+":"+myArray3[0];
		    	 document.getElementById('runTime10').value=runTime10; 
		    	 document.getElementById('beginTime10').value=beginTime10; */
		    	 if(isOn=="关机"){
			    	 document.getElementById("1001").style.background="gray";
			    	}
		    	 else{
		    		 document.getElementById("1001").style.background="green";
		    	 }
		    	 if(isWaring==0||isWaring==2){
		    	 }else{		    		 
		    		 document.getElementById("1002").style.background="red";
		    	 }
		     }
		     else if(strs[1]=='超声辅助高速加工中心'){
		    	 isOn = strs[5];
		    	 isWaring = strs[8];
		    	 /* runTime11 = strs[7]; 
		    	 beginTime11 = strs[6]; 
		    	 var myArray=new Array();
		    	 myArray[0]=Math.floor(beginTime11/60);
		    	 myArray[1]=beginTime11%60;
		    	 beginTime11=myArray[0]+":"+myArray[1];
		    	 var myArray1=new Array();
		    	 myArray1[0]=Math.floor(runTime11/3600);
		    	 myArray1[1]=Math.floor(runTime11/60);
		    	 runTime11=myArray1[0]+":"+myArray1[1];
		    	 document.getElementById('runTime11').value=runTime11; 
		    	 document.getElementById('beginTime11').value=beginTime11; */
		    	 if(isOn=="已开机"){
			    	 document.getElementById("1101").style.background="green";
			    	}
		    	 else{
		    		 document.getElementById("1101").style.background="gray";
		    	 }
		    	 if(isWaring==_N_CYC_JM_SPFFF){
		    	 }else{		    		 
		    		 document.getElementById("1102").style.background="red";
		    	 }
		     }
		     else if(strs[1]=="数控高速成型磨床"){
		    	 isOn = strs[5];
		    	 isWaring = strs[38];
		    	 /* runTime5 = strs[43]; 
		    	 beginTime11 = strs[2]; 
		    	 if(runTime5==undefined){
		    	 document.getElementById('runTime5').value=""; 
		    	 }else{
		    	 document.getElementById('runTime5').value=runTime5; 
		    	 }
		    	 if(beginTime5==0){
			     document.getElementById('beginTime5').value=""; 
			     }else{
			     document.getElementById('beginTime5').value=beginTime5;
			     } */
		    	 if(isOn=="close"){
			    	 document.getElementById("501").style.background="gray";
			    	}
		    	 else{
		    		 document.getElementById("501").style.background="green";
		    	 }
		    	 if(isWaring==null||isWaring==""){
		    	 }else{		    		 
		    		 document.getElementById("502").style.background="red";
		    	 }
		     }
		}
		     init();
		     function init(){
		    	 $.ajax({
		    		type:"POST",
		   			url:"GetStateservlet",
		   			dataType:"json",
		   			success:function(result){
		   			if(result!=null){
		   			 for(var i=0;i<result.length;i++){
		    		 	if(result[i].machineId=="2013000822"){
		    			 if(result[i].futurestate=="1"){
		    				 document.getElementById("503").style.background="blue";
		    			 }
		    		 	}	
		    		 	if(result[i].machineId=="2012000271"){
			    			 if(result[i].futurestate=="1"){
			    				 document.getElementById("1103").style.background="blue";
			    			 }
			    		 	}
		    		 	if(result[i].machineId=="VL2"){
			    			 if(result[i].futurestate=="1"){
			    				 document.getElementById("1003").style.background="blue";
			    			 }
			    		 	}
		    		 	if(result[i].machineId=="2001001763"){
			    			 if(result[i].futurestate=="1"){
			    				 document.getElementById("803").style.background="blue";
			    			 }
			    		 	}
		    		 }
		   			 
		    		 }
		    		 
		    	 }
		    	 
		    	 
		     });
		     }
		     setInterval(init,1000000); 
</script>
</body>
</html>