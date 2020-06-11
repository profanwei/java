<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="com.wl.forms.User" %>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">



<title>智能制造数据可视化系统</title>   

<script type="text/javascript" src="<%=path %>/staticResources/js/echarts.js"></script>
<script type="text/javascript" src="<%=path %>/staticResources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path %>/staticResources/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=path %>/staticResources/js/mqttws31.min.js"></script>
<script type="text/javascript" src="<%=path %>/staticResources/js/dark.js"></script> 



<style> 

/* html, body {
    width: 100%;
} */
/* .container,.container1,.container2{ float:left}  没有用*/
.box {
	
	//border-style: groove; 
	border-radius: 15px;
	

	text-align: center;

}
    
  #boxclass1 {
	position: absolute;
	height: 99%;
	width: 30%;
	left:15%;
	top:10%;
	border-radius: 15px;
 	//border-style: groove; 
	   text-align:center;
}
  #boxclass2 {
	position: absolute;
	height: 99%;
	width: 30%;
	right:15%;
	top:10%;
	border-radius: 15px;
 //	border-style: groove; 
	   text-align:center;
	
}
#boxclass3 {
	position: absolute;
	height: 99%;
	width: 38%;
	left:31%;
	top:0px;
	border-radius: 15px;
// 	border-style: groove; 
	   text-align:center;
}
  
#box1 {
/* 	top:-30px;
	position: relative;
    left:7.5%;
	height:80%;
	width: 25%; */
	float:left;
	width:25%;
}
#box2{
/* top:-40px;
	position: relative;
    left:7.5%;
	height:80%;
	width: 25%; */
	float:left;
	width:25%;
} 

#box5{
	
	
	border-radius: 15px;
	width: 100%;
	height: 49%;
	float:right;
	top:0px;
	right:0px;
	clear: right;
	
} 


#box6{
	position: relative;

	width: 100%;
	float:right;
	height: 49%;
	clear: right;
} 




#box3 {
	float:left;
	width:25%;
/* 	position: relative;
    left:3%;
    top:15%;
	height:80%;
	width: 25%;
	 */
}
#box4 {
	width:25%;
	float:left;
/* 	position: relative;
	left:3%;
	top:15%;
	height:80%;
	width: 25%;
	 */
}


#TopTitle {
	

	position: relative;
	border-radius: 15px;
	height: 7%;
	width: 100%;
    text-align:center;


}




</style> 	
<!--

以下是用来的进行里面的每个input进行格式 调整到的css
-->
<style type="text/css">
a {
/* 	text-decoration: none; */
	font-size:1.8em;;
/* 	color: #000;
	color:#33FFFF; */
}

body {
	font-family: Arial, Sans-Serif;
	font-size: 0.85em;
	overflow-x: hidden;
	overflow-y: auto;
}

img {
	border: none;
}

ul, ul li {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

ul li.first {
	border-top: 0px solid #DFDFDF;
}

ul p {
	float: left;
	margin: 0;
	width: 63%;
	//
	这个
	表示input所在的div的大小
}

ul h3 {
	float: left;                                       
	font-size: 15px;
	font-weight: bold;
	margin: 12px 0 0 0;
	width: 35%; /* 这个是控制左边相距编边界的距离 */
	margin-left: 1%;
	background:	#C0C0C0;
}
ul h4 {
	float: left;
	font-size: 15px;
	font-weight: bold;
	margin: 12px 0 0 0;
	width: 35%; /* 这个是控制左边相距编边界的距离 */
	margin-left: 1%;
}
ul li {
	padding: 0.1% 0;
	width: 100%;
	overflow: hidden;
}

ul input {
	width: 75%; /* 这个是控制input的大小的 */
	padding: 20px;
	margin:3%;
	height:30px;
	position: relative;
	border: solid 1% #00FFFF;
	box-sizing: border-box;
	text-align: center;
	font-size: 100%;
	border: 1px solid #c8cccf;
	/* color:#6a6f77; */
	-web-kit-appearance: none;
	-moz-appearance: none;
	display: block;
	outline: 0;
	padding: 0 0em;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}

ul input.required {
	border: solid 1% #f00;
}

#panelName {
	font-weight: bold;
}

.test02 {
	text-align: center;
}
#content{
	position:relative;
	top:15%;
}

</style>
</head>
<body   >

<div id="boxclass3">

<div class="title" id="TopTitle"><h1><strong>机床实时状态显示</strong></h1></div>
<div id="start" style="height:20px; width: 100%;text-align: center" ></div>
</div>
<div id="content">
<div class="box" id="box3"  >
<h3><a href="<%=path %>/FANUCshowData.jsp" >FANUC加工中心</a></h3><br>
<ul>

<!-- <li>
<h3>当前时间</h3>
<p><input type="text" value="" id="creatime5505" name="creatime5505" /></p>
</li> -->

<li>
<tr>
<td><h3>机床编号</h3></td>
<td><p><input type="text" value="VL2" id="machineIp5505" name="machineIp5505" /></p></td></tr>
</li>

<li>
<h4>机床型号</h4>
<p><input type="text" value="VL2" id="machineName5505" name="machineName5505" /></p>
</li>

<li>
<h3>数控系统</h3>
<p><input type="text" value="" id="machineSystem5505" name="machineSystem5505" /></p>
</li>
<li>
<h4>开机状态</h4>
<p><input type="text" value="" id="powerStatus5505" name="powerStatus5505" /></p>
</li>

<li >
<h3>运行模式</h3>
<p><input type="text" value="" id="mode5505" name="mode5505" /></p>
</li>

<li>
<h4>主轴转速倍率</h4>
<p><input type="text" value="" id="spindleSpeed5505" name="spindleSpeed5505" /></p>
</li>

<li>
<h3>进给速度</h3>
<p><input type="text" value="" id="factFeedSpeed5505" name="factFeedSpeed5505" /></p>
</li>

<li>
<h4>报警编号</h4>
<p><input type="text" value="" id="alarmNum5505" name="alarmNum5505" /></p>
</li>

<li>
<h3>报警信息</h3>
<p><input type="text" value="" id="alarmInfo5505" name="alarmInfo5505" /></p>
</li>
<li>
<h4>当前运行的程序</h4>
<p><input type="text" value="" id="runMode5505" name="runMode5505" /></p>
</li>
<li>
<h3>程序运行时间</h3>
<p><input type="text" value="" id="runTime5505" name="runTime5505" /></p>
</li>
<li>
<h4>程序运行状态</h4>
<p><input type="text" value="" id="runCondition5505" name="runCondition5505" /></p>
</li>
<li>
<h3>运行程序编号</h3>
<p><input type="text" value="" id="runProgramNum5505" name="runProgramNum5505" /></p>
</li>

</ul>
</div>
<div class="box" id="box4">
<h3><a href="<%=path %>/HDHshowData.jsp">高速五坐标加工中心</a></h3><br>
<ul>

<!-- <li>
<h3>当前时间</h3>
<p><input type="text" value="" id="creatime5504" name="creatime5504" /></p>
</li> -->

<li>
<h3>机床编号</h3>
<p><input type="text" value="2001001763" id="machineIp5504" name="machineIp5504" /></p>
</li>

<li>
<h4>机床型号</h4>
<p><input type="text" value="UCP710" id="machineName5504" name="machineName5504" /></p>
</li>

<li>
<h3>数控系统</h3>
<p><input type="text" value="" id="machineSystem5504" name="machineSyetem5504" /></p>
</li>
<li>
<h4>开机状态</h4>
<p><input type="text" value="" id="powerStatus5504" name="powerStatus5504" /></p>
</li>

<li >
<h3>运行模式</h3>
<p><input type="text" value="" id="mode5504" name="mode5504" /></p>
</li>

<li>
<h4>主轴转速倍率</h4>
<p><input type="text" value="" id="spindleSpeed5504" name="spindleSpeed5504" /></p>
</li>

<li>
<h3>进给倍率</h3>
<p><input type="text" value="" id="factFeedSpeed5504" name="factFeedSpeed5504" /></p>
</li>

<li>
<h4>报警编号</h4>
<p><input type="text" value="" id="alarmNum5504" name="alarmNum5504" /></p>
</li>

<li>
<h3>报警信息</h3>
<p><input type="text" value="" id="alarmInfo5504" name="alarmInfo5504" /></p>
</li>
<li>
<h4>当前运行的程序</h4>
<p><input type="text" value="" id="runMode5504" name="runMode5504" /></p>
</li>
<li>
<h3>程序运行时间</h3>
<p><input type="text" value="" id="runTime5504" name="runTime5504" /></p>
</li>
<li>
<h4>程序运行状态</h4>
<p><input type="text" value="" id="runCondition5504" name="runCondition5504" /></p>
</li>
<li>
<h3>运行程序编号</h3>
<p><input type="text" value="" id="runProgramNum5504" name="runProgramNum5504" /></p>
</li>
</ul>
</div>
<div class="box" id="box1"  >
<h3><a href="<%=path %>/SuperSound.jsp">超声辅助高速加工中心</a></h3><br>
<ul>

<!-- <li>
<h3>当前时间</h3>
<p><input type="text" value="" id="creatime5503" name="creatime5503" /></p>
</li> -->

<li>
<h3>机床编号</h3>
<p><input type="text" value="2012000271" id="machineIp5503" name="machineIp5503" /></p>
</li>

<li>
<h4>机床型号</h4>
<p><input type="text" value="定制" id="machineName5503" name="machineName5503" /></p>
</li>

<li>
<h3>数控系统</h3>
<p><input type="text" value="" id="machineSystem5503" name="machineSyetem5503" /></p>
</li>
<li>
<h4>开机状态</h4>
<p><input type="text" value="" id="powerStatus5503" name="powerStatus5503" /></p>
</li>

<li >
<h3>运行模式</h3>
<p><input type="text" value="" id="mode5503" name="mode5503" /></p>
</li>

<li>
<h4>主轴转速倍率</h4>
<p><input type="text" value="" id="spindleSpeed5503" name="spindleSpeed5503" /></p>
</li>

<li>
<h3>进给倍率</h3>
<p><input type="text" value="" id="factFeedSpeed5503" name="factFeedSpeed5503" /></p>
</li>

<li>
<h4>报警编号</h4>
<p><input type="text" value="" id="alarmNum5503" name="alarmNum5503" /></p>
</li>

<li>
<h3>报警信息</h3>
<p><input type="text" value="" id="alarmInfo5503" name="alarmInfo5503" /></p>
</li>
<li>
<h4>当前运行的的程序</h4>
<p><input type="text" value="" id="runMode5503" name="runMode5503" /></p>
</li>
<li>
<h3>程序运行时间</h3>
<p><input type="text" value="" id="runTime5503" name="runTime5503" /></p>
</li>
<li>
<h4>程序运行状态</h4>
<p><input type="text" value="" id="runCondition5503" name="runCondition5503" /></p>
</li>
<li>
<h3>运行程序行号</h3>
<p><input type="text" value="" id="runProgramNum5503" name="runProgramNum5503" /></p>
</li>

</ul>
</div>



<div class="box" id="box2">
<h3><a href="<%=path %>/GrindershowData.jsp">数控高速成型磨床</a></h3><br>
<ul>

<!-- <li>
<h3>当前时间</h3>
<p><input type="text" value="" id="creatime5513" name="creatime5513" /></p>
</li> -->

<li>
<h3>机床编号</h3>
<p><input type="text" value="2007004971" id="machineIp5513" name="machineIp5513" /></p>
</li>

<li>
<h4>机床型号</h4>
<p><input type="text" value="MT408" id="machineName5513" name="machineName5513" /></p>
</li>

<li>
<h3>数控系统</h3>
<p><input type="text" value="" id="machineSystem5513" name="machineSystem5513" /></p>
</li>
<li>
<h4>开机状态</h4>
<p><input type="text" value="" id="powerStatus5513" name="powerStatus5513" /></p>
</li>

<li>
<h3>实际进给倍率</h3>
<p><input type="text" value="" id="factFeedSpeed5513" name="factFeedSpeed5513" /></p>
</li>
<li>
<h4>进给倍率</h4>
<p><input type="text" value="" id="feedRateOvr5513" name="feedRateOvr5513" /></p>
</li>
<li>
<h3>主轴倍率</h4>
<p><input type="text" value="" id="aaSngIAxStart5513" name="aaSngIAxStart5513" /></p>
</li>
<li>
<h4>报警索引</h3>
<p><input type="text" value="" id="alarmNum5513" name="alarmNum5513" /></p>
</li>
<li>
<h3>报警信息</h4>
<p><input type="text" value="" id="alarmInfo5513" name="alarmInfo5513" /></p>
</li>
<li>
<h4>当前运行的程序</h3>
<p><input type="text" value="" id="runMode5513" name="runMode5513" /></p>
</li>
<li>
<h3>循环时间</h4>
<p><input type="text" value="" id="circletime5513" name="circletime5513" /></p>
</li>
<li>
<h4>程序运行时间</h3>
<p><input type="text" value="" id="runTime5513" name="runTime5513" /></p>
</li>

<li>
<h3>运行程序行号</h3>
<p><input type="text" value="" id="runProgramNum5513" name="runProgramNum5513" /></p>
</li>
</ul>
</div>
</div>

<script>
var clientid='<%=((User)session.getAttribute("user")).getStaffCode() %>'+Math.random();console.log(clientid);
client = new Paho.MQTT.Client("222.192.72.12",8083,clientid); //建立客户端实例
client.connect({
	onSuccess: onConnect,
	userName: "admin",
	password: "public"
}); //连接服务器并注册连接成功处理事件
client.onConnectionLost = onConnectionLost; //注册连接断开处理事件
client.onMessageArrived = onMessageArrived; //注册消息接收处理事件
<%-- $(function () {//1默认打开网页就会开是的函数，同时调用初始化函数
	$.ajax({
		type:"POST",
		url:"<%=path %>/GetMach.action",
		dataType:"json",

		success:function(result){

			
		},

		})

}); --%>
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
	 console.log(payload);
	 var strs= new Array(); //定义一数组 
     strs=payload.split(","); //字符分割
     
     if(strs[1]=='高速五坐标加工中心'){
    	 
    createTime=strs[0];//当前时间
    machineName=strs[1]; //机床名称
    machineIp= strs[2];  //机床IP
    machineSystem=strs[3]; //机床数控系统
    isOn=strs[26];
 /*    runTime=strs[10]; */
    circleTime=strs[11];
    runProgramName=strs[15];
    runCondition=strs[14];
    runProgramNum=strs[16];
    alarmNum=strs[19];
    alarmInfo=strs[20];
    runMode=strs[18];
    spindleSpeed=strs[21];
    factFeedSpeed=strs[22];
	
	           
               /* document.getElementById('creatime5504').value=createTime; */
/* 	           document.getElementById('machineName5504').value=machineName; 
	           document.getElementById('machineIp5504').value=machineIp;    */
	           document.getElementById('machineSystem5504').value=machineSystem; 
	      	   document.getElementById('powerStatus5504').value=isOn;  
	      	  /*  document.getElementById('runTime').value=runTime; */
	      	   document.getElementById('runTime5504').value=circleTime;
	      	   document.getElementById('runMode5504').value=runProgramName;
	      	   document.getElementById('runCondition5504').value=runCondition;
	      	   document.getElementById('runProgramNum5504').value=runProgramNum;
	      	   document.getElementById('alarmNum5504').value=alarmNum;
	      	   document.getElementById('alarmInfo5504').value=alarmInfo;
	      	   document.getElementById('mode5504').value=runMode;
	      	   document.getElementById('spindleSpeed5504').value=spindleSpeed;
	      	   document.getElementById('factFeedSpeed5504').value=factFeedSpeed;

	          
   
}else if(strs[1]=='加工中心'){
    
    createTime=strs[0];//当前时间
    machineName=strs[1]; //机床名称
    machineIp= strs[2];  //机床IP
    machineSystem=strs[3]; //机床数控系统
    isOn = strs[46]; //机床开关机状态
    runMode = strs[30]; //机床运行模式
    alarmInfo = strs[42];  //报警信息
    alarmNum = strs[40]; //报警数量
    runTime = strs[43];  //运行时间
    runProgramNum = strs[31];
    runCondition=strs[29];
    factFeedSpeed=strs[38];
    spindleSpeed=strs[47];
    
      /*  document.getElementById('creatime5505').value=createTime; */
/*        document.getElementById('machineName5505').value=machineName; 
       document.getElementById('machineIp5505').value=machineIp;   */ 
       document.getElementById('machineSystem5505').value=machineSystem; 
	   document.getElementById('powerStatus5505').value=isOn; 
	   document.getElementById('mode5505').value=runMode;
	   document.getElementById('alarmInfo5505').value=alarmInfo;
	   document.getElementById('alarmNum5505').value=alarmNum;
	   document.getElementById('runTime5505').value=runTime;
	   document.getElementById('runMode5505').value=runProgramNum;
	   document.getElementById('runCondition5505').value=runCondition;
	   document.getElementById('runProgramNum5505').value=runProgramNum;
	   document.getElementById('spindleSpeed5505').value=spindleSpeed;
  	   document.getElementById('factFeedSpeed5505').value=factFeedSpeed; 
}else if(strs[1]=='超声辅助高速加工中心'){
    createTime=strs[0];//当前时间
    machineName=strs[1]; //机床名称
    machineIp= strs[3];  //机床IP
    machineSystem=strs[2]; //机床数控系统
    isOn = strs[5]; //机床开关机状态
    runMode = strs[13]; //机床运行模式
    alarmInfo = strs[12];  //报警信息
    alarmNum = strs[11]; //报警数量
    runTime = strs[7];  //运行时间
    runProgramNum = strs[10];
    runCondition=strs[9];
    spindleSpeed=strs[14];
    factFeedSpeed=strs[15];
    runProgramName=strs[8];
    
    /* document.getElementById('creatime5503').value=createTime; */
/*     document.getElementById('machineName5503').value=machineName; 
    document.getElementById('machineIp5503').value=machineIp;    */
    document.getElementById('machineSystem5503').value=machineSystem; 
	   document.getElementById('powerStatus5503').value=isOn;  
	  /*  document.getElementById('runTime').value=runTime; */
	   document.getElementById('runTime5503').value=runTime;
	   document.getElementById('runMode5503').value=runProgramName;
	   document.getElementById('runCondition5503').value=runCondition;
	   document.getElementById('runProgramNum5503').value=runProgramNum;
	   document.getElementById('alarmNum5503').value=alarmNum;
	   document.getElementById('alarmInfo5503').value=alarmInfo;
	   document.getElementById('mode5503').value=runMode;
	   document.getElementById('spindleSpeed5503').value=spindleSpeed;
	   document.getElementById('factFeedSpeed5503').value=factFeedSpeed;

}else if(strs[1]=="数控高速成型磨床"){
    createTime=strs[0];//当前时间
    machineName=strs[1]; //机床名称
    machineIp=strs[2];  //机床IP
    machineSystem=strs[3]; //机床数控系统
    isOn=strs[5]; //机床开关机状态
    alarmInfo=strs[9];  //报警信息
    alarmNum=strs[8]; //报警索引
    runTime=strs[11];  //运行时间
    aaSngIAxStart=strs[22];
    runProgramNum=strs[15];
    factFeedSpeed=strs[7];
    runProgramName=strs[10];
    feedRateOvr= strs[6];//倍率
    circletime=strs[19];
    if(isOn=="close"){
    	isOn="关机";
    }else{
    	isOn="开机";
    }
    /* document.getElementById('creatime5513').value=createTime; */
/*     document.getElementById('machineName5513').value=machineName; 
    document.getElementById('machineIp5513').value=machineIp;  */  
    document.getElementById('machineSystem5513').value=machineSystem; 
    feedRateOvr= strs[6];//倍率
    circletime=strs[17];
    /* document.getElementById('creatime5513').value=createTime; */
/*     document.getElementById('machineName5513').value=machineName; 
    document.getElementById('machineIp5513').value=machineIp;  */  
    document.getElementById('machineSystem5513').value=machineSystem; 
    feedRateOvr=strs[6];//倍率
    circletime=strs[19];
    
       document.getElementById('machineSystem5513').value=machineSystem; 
	   document.getElementById('powerStatus5513').value=isOn;  
	   document.getElementById('runTime5513').value=runTime;
	   document.getElementById('runMode5513').value=runProgramName;
	   document.getElementById('runProgramNum5513').value=runProgramNum;
	   document.getElementById('alarmNum5513').value=alarmNum;
	   document.getElementById('alarmInfo5513').value=alarmInfo;
	   document.getElementById('feedRateOvr5513').value=feedRateOvr;
	   document.getElementById('circletime5513').value=circletime;
	   document.getElementById('factFeedSpeed5513').value=factFeedSpeed;
	   document.getElementById('aaSngIAxStart5513').value=aaSngIAxStart;
	
	
	
}
     $(function () {
         var t = null;
         t = setTimeout(time, 1000);//開始运行
         function time() {
             clearTimeout(t);//清除定时器
             dt = new Date();
             var year = dt.getFullYear();
             var month = dt.getMonth() + 1;//(0-11,0代表1月)
             var date = dt.getDate();//获取天
             var num = dt.getDay();//获取星期
             var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
             var hour = dt.getHours();//获取时
             var minute = dt.getMinutes();//获取分
             var second = dt.getSeconds();//获取秒
             //分秒时间是一位数字，在数字前补0。
             date = extra(date);
             month = extra(month);
             minute = extra(minute);
             second = extra(second);
             document.getElementById("start").innerHTML = year + " 年 " + month + " 月 " + date + " 日 " + hour + "：" + minute + "：" + second + " " + weekday[num];
             t = setTimeout(time, 1000); //设定定时器，循环运行
         }
  
     });
 //补位函数。
     function extra(x) {
         //如果传入数字小于10，数字前补一位0。
         if (x < 10) {
             return "0" + x;
         }
         else {
             return x;
         }
     }


}       


</script>
</body>

</html>

