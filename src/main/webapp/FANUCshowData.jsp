<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <%@page import="com.wl.forms.User" %>

<title>法兰克系统实时显示界面</title>   

<script type="text/javascript" src="staticResources/js/echarts.js"></script>
<script type="text/javascript" src="staticResources/js/jquery.min.js"></script>
<script type="text/javascript" src="staticResources/js/echarts.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<!-- <script type="text/javascript" src="staticResources/js/miniui.js"></script> -->

<script type="text/javascript" src="staticResources/js/dark.js"></script>
<script type="text/javascript" src="staticResources/js/mqttws31.min.js"></script>

<style> 
/* .container,.container1,.container2{ float:left}  没有用*/

    
    
.border{position:absolute;padding:5px;border-style: solid;border-color: #F75000;}
.row1{border-width: 5px 0 0 5px;top:-5px;left:-5px;}
.row2{border-width: 5px 5px 0 0;top:-5px;right:-5px;}
.col1{border-width: 0 0 5px 5px;bottom:-5px;left:-5px;}
.col2{border-width: 0 5px 5px 0;bottom:-5px;right:-5px;}

#status{
position:relative;
	height:9%;
	width: 670px;
    text-align:center;
	margin:0 auto;  
	border:1px solid #D2E9FF;
	top:8%;
	font-size:28px;
	font-weight:bold;
}
#box1 {
	position: relative;
	/* border-style: groove; */
	width: 27%;
	height: 35%;
	top:-14%;
	text-align:center;

		border:1px solid #D2E9FF;

}
#box6{
	position: absolute;
	/* border-style: groove; */
	border-radius: 15px;
	width: 630px;
	height: 510px;
	top: -110px;
	right: 0px;
} 
#box2{
position:relative;
	width:27%;
	height:460px;
	top:-10%;

border:1px solid #D2E9FF;

} 
#innerbox{
position:relative;
	width:100%;
	height:430px;



}


#box8{
position:relative;
border:1px solid #D2E9FF;
width:27%;
height:95%;
top:-103.54%;
right:-72%;
text-align:center
} 


.box {
	position: absolute;
	/* border-style: groove; */
	border-radius: 15px;
	width: 530px;
	height: 565px;
	text-align: center;
}
#box10{
position: relative;
left:30%;
bottom:171.5%;
/* top:-160.5%; */

	height: 570px;
	width: 40%;
		border:1px solid #D2E9FF;
		
}
#totalTable {
	position:absolute;

/*    	transform: translate(-50%,0); */
	height: 580px;
	width: 100%;
		left: 50%;
   	transform: translate(-50%,0);
   
    bottom: -20px;
}
.macinheInfoFiedldset{
	border-radius: 15px;
	}
#machineInfo{
	position: absolute;
	left: 50%;
   	transform: translate(-50%,0);
    top: 95px;
   
	height: 150px;
	width: 800px;
	
	}
#TopTitle {
	left:30%;
	
position:relative;
top:4%;
	height:9%;
	width: 40%;
    text-align:center;
/* 	margin:0 auto; */  
	border:1px solid #D2E9FF;
	/* border-style: groove; */
}

    #panelName {
	position: fixed;
	height: 3%;
	width: auto;
	top:280px;
	left:2.8%;
	


	/* border-style: groove; */ 
}


@media screen and (max-height: 2000px){
#panelPostion{
	position: relative;
    width:100%;
	top:-5%;
	height:280px;
	/* border-style: groove; */
	}
	}
	@media screen and (max-height: 990px){
#panelPostion{
	position: relative;
    width:100%;
	top:-5%;
	height:280px;
	/* border-style: groove; */
	}
	}
	
	
	
#test02{
		text-align: center;
}
#cha{
/*  margin-top:4%;  */
}
</style> 	
<style type="text/css">

        body
        {
            font-family:Arial, Sans-Serif;
            font-size:0.85em;
          color:#FFFFFF; 
			overflow-x:hidden;
			overflow-y:hidden;
			background-image: url("staticResources/image/bgimage.jpg"); 
	
        }

        img 
        {
            border:none;
        }

        ul, ul li
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        ul li.first
        {
            border-top: 0px solid #DFDFDF;
        }
       
        ul p
        {
            float: left;
            margin: 0;
            width: 310px;
        }

        ul h3
        {
            float: left;
            font-size: 14px;
            font-weight: bold;
            margin: 1px 0 0 0;
            width: 200px;
            margin-left:2px;
        }

        ul li
        {      
            padding: 9px 0;
            width:600px;
            overflow:hidden;
        }

        ul input[type="text"], ul input[type="password"]

        {
        align:center;
				text-align:center;
				margin-left:-20%;
            width:60%;
            padding:5px;
            position:relative;
            border:solid 1px #666;
            background-color: transparent;
            color:#FFFFFF; 
            readonly:readonly;
   
        }

        ul input.required 
        {
            border: solid 1px #f00;
        }

#panelName {
	font-weight: bold;
}
</style>
</head>
<body   >

<div  id="TopTitle">
    <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>
<h1><strong>FANUC加工中心</strong></h1>
</div>
<div class="title" id="status" >
    <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>
	<div id="cha">

	</div>

</div>

<div class="box1" id="box1">
 <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>
<div class="panelPostion" id="panelPostion">   
</div>


<div  id="panelName">
<h3 align="center">主轴转速 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;进给速度&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;主轴负载</h3>
</div>

</div> 

 <div id="box2">
  <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>
 <div id="innerbox">
</div>
</div>  


<div class="box" id="box8">


 <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>


<h1>
   机床状态信息 
			<!-- <img src="staticResources/image/machineStatusInfo.jpg"
				alt="Account information" /> -->
		</h1>
		<ul>
<li>
<h3>机床IP</h3>
<p>
<input type="text" value="" id="machineIp" name="machineIp" /></p>
</li>
<li>
<h3>机床名称</h3>
<p>
<input type="text" value="" id="machineName" name="machineName" /></p>
</li>
<li>
<h3>操作系统</h3>
<p>
<input type="text" value="" id="machineSystem" name="MachineSystem" /></p>
</li>
<li>
<h3>当前时间</h3>
<p>
<input type="text" value="" id="createTime" name="createTime" /></p>
</li>
<li >
<h3>机床运行状态</h3>
<p>
<input type="text" value="" id="runCondition" name="runCondition" /></p>
</li>
<li>
<h3>运行模式</h3>
<p>
<input type="text" value="" id="runMode" name="runMode" /></p>
</li>
<li>
<h3>运行的程序号</h3>
<p>
<input type="text" value="" id="runProgramNum" name="runProgramNum" /></p>
</li>
<!-- <li>
<h3>主程序的程序号</h3>
<p>
<input type="text" value="" id="mainProgramNum" name="mainProgramNum" /></p>
</li> -->
<li>
<h3>运行的NC程序号</h3>
<p>
<input type="text" value="" id="runNcProgramNum" name="runNcProgramNum" /></p>
</li>
<li>
<h3>运行的刀片组号</h3>
<p>
<input type="text" value="" id="runCutterGroupNum" name="runCutterGroupNum" /></p>
</li><!-- <li>
<h3>运行的刀片号</h3>
<p>
<input type="text" value="" id="runCutterNum" name="runCutterNum" /></p>
</li> -->

</ul>
<ul>
<!-- <li >
<h3>伺服轴数量</h3>
<p>
<input type="text" value="" id="controledServoAsisNum" name="controledServoAsisNum" /></p>
</li> -->
<!-- <li>
<h3>主轴数</h3>
<p>
<input type="text" value="" id="spindleNum" name="spindleNum" /></p>
</li> -->
<li>
<h3>机床报警</h3>
<p>
<input type="text" value="" id="isAlarm" name="isAlarm" /></p>
</li>
<li>
<h3>报警编号</h3>
<p>
<input type="text" value="" id="alarmNum" name="alarmNum" /></p>
</li>
<li>
<h3>报警类型</h3>
<p>
<input type="text" value="" id="alarmClass" name="alarmClass" /></p>
</li>
<li>
<h3>报警信息</h3>
<p>
<input type="text" value="" id="alarmInfo" name="alarmInfo" /></p>
</li><li>
<h3>运行时间</h3>
<p>
<input type="text" value="" id="runTime" name="runTime" /></p>
</li>
<!-- <li>
<h3>循环时间</h3>
<p>
<input type="text" value="" id="circleTime" name="circleTime" /></p>
</li> -->
<!-- <li>
<h3>切削时间</h3>
<p>
<input type="text" value="" id="cutTime" name="cutTime" /></p>
</li> -->
<!-- <li>
<h3>机床开关机床态</h3>
<p>
<input type="text" value="" id="isOn" name="isOn" /></p>
</li> -->
<!-- <li>
<h3>CNC版本号</h3>
<p>
<input type="text" value="" id="CNCversion" name="CNCversion" /></p>
</li> -->
</ul>

</div> 

</div>  
<div id="box10">
<span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span>
<div id="totalTable" ></div> 
</div>





<script type="text/javascript">
 
/* mini.parse(); */
 
var createTime=0;
var machineName=0 ;         
var machineIp =0;           
var machineSystem =0;       
var machineId=0  ;  

var relativeX=0 ;           
var relativeZ=0 ;           
var relativeC=0 ; 
var relativeV=0 ; 

var absoluteX=0 ;           
var absoluteZ=0 ;           
var absoluteC=0 ;   
var absoluteV =0; 

var machineX=0 ;                    
var machineZ=0 ;            
var machineC=0 ;            
var machineV=0 ;  

var resMovDistanceX=0 ;       
var resMovDistanceZ=0 ;     
var resMovDistanceC=0 ;     
var resMovDistanceV=0 ;   

var spindleName=0 ;         
var spindleNum=0 ;          
var spindleLoad=0 ;         
var spindleSpeed=0 ; 

var servoAsisLoad1=0 ;      
var servoAsisLoad2=0 ;      
var servoAsisLoad3=0 ;      
var servoAsisLoad4=0;  

var runCondition=0 ;        
var runMode=0;              
var runProgramNum=0 ;       
var mainProgramNum =0;      
var runNcProgramNum =0;     
var runCutterGroupNum=0 ;   
var runCutterNum=0;         
var CNCclass=0;             
var controledServoAsisNum=0;
var CNCversion=0;           
var factFeedSpeed=0 ;       
var isAlarm=0;             
var alarmNum =0;            
var alarmClass=0 ;          
var alarmInfo=0 ;           
var runTime =0;             
var circleTime=0 ;          
var cutTime =0;             
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
	client.subscribe("DataCollect/Fanuc/Machine_5505"); //订阅主题
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
	console.log("刷新");
	 topic = message.destinationName;
	 payload = message.payloadString;
	 console.log(payload);
	 var strs= new Array(); //定义一数组 
    strs=payload.split(","); //字符分割 
    
    createTime=strs[0];//当前时间
    machineName=strs[1]; //机床名称
    machineIp= strs[2];  //机床IP
    machineSystem=strs[3]; //机床数控系统
    spindleName=strs[21]; //主轴名称
    spindleNum=strs[22];  //主轴数量
   
    //相对坐标
    relativeX=strs[5];
	 relativeZ=strs[6] ;
	 relativeC=strs[7] ;
	 relativeV=strs[8] ;
	 
	 //绝对坐标
   absoluteX=strs[9];
   absoluteZ=strs[10] ;
	absoluteC=strs[11]  ;
   absoluteV=strs[12]  ;
	 
	            //机械坐标
	           machineX=strs[13] ;
	           machineZ=strs[14];
	           machineC=strs[15] ;
	           machineV=strs[16];	  
	           
	           	//剩余移动距离坐标      
	           resMovDistanceX=strs[17];
	           resMovDistanceZ=strs[18];
	           resMovDistanceC=strs[19] ;
	           resMovDistanceV=strs[20];
	           
	           
	           
	           /*仪表盘数据  */
	           spindleSpeed=strs[24];
	           spindleLoad=strs[23];
	           factFeedSpeed=strs[38];
	          
	           /* 负载对比数据 */
	           if(strs[25]!=""&&strs[25]!=null&&strs[25]!='undefined'){
	        	   servoAsisLoad1=strs[25];
	               servoAsisLoad2=strs[26];
	               servoAsisLoad3=strs[27];
	               servoAsisLoad4=strs[28];
	            
	           }
             
	           
           if(strs[0]!="close"){
 	           document.getElementById('createTime').value=createTime;
	           document.getElementById('machineName').value=machineName; 
	           document.getElementById('machineIp').value=machineIp;   
	           document.getElementById('machineSystem').value=machineSystem; 
           }
	           
	           //document.getElementById('spindleName').value=spindleName;     //* 这个目前娶不到，不知道怎么回事 */
	        /*    document.getElementById('spindleNum').value=spindleNum;   */
	          /*  mini.get("spindleLoad").setValue(msg.spindleLoad); */
	          /*  mini.get("spindleSpeed").setValue(msg.spindleSpeed); */
	          
	                     /* mini.get("servoAsisLoad1").setValue(msg.servoAsisLoad1);
	           mini.get("servoAsisLoad2").setValue(msg.servoAsisLoad2);
	           mini.get("servoAsisLoad3").setValue(msg.servoAsisLoad3);
	           mini.get("servoAsisLoad4").setValue(msg.servoAsisLoad4); */
	          
	          
	          runCondition=strs[29]; //机床运行状态
	          runMode = strs[30]; //机床运行模式
	          runProgramNum = strs[31] //正在运行的程序编号
	          mainProgramNum = strs[32]; //主程序的程序号
	          runNcProgramNum = strs[33] //正在运行的NC程序的程序号
	          runCutterGroupNum = strs[34] //正在运行的刀片组号
	          runCutterNum = strs[35]; //正在运行的刀片号
	          controledServoAsisNum = strs[36] //被控制的伺服轴数
	          CNCversion = strs[37] //CNC版本号
	          factFeedSpeed = strs[38]; //实际进给速度
	          isAlarm = strs[39]; //机床有无报警
	          alarmNum = strs[40]; //报警数量
	          alarmClass = strs[41]; //报警类型
	          alarmInfo = strs[42];  //报警信息
	          runTime = strs[43];  //运行时间
	          circleTime = strs[44]; //循环时间
	          cutTime = strs[45]; //切削时间
	          isOn = strs[46]; //机床开关机状态
	          
	          if(strs[0]!="close"){          
	           document.getElementById('runCondition').value=runCondition; 
	           document.getElementById('runMode').value=runMode; 
	           document.getElementById('runProgramNum').value=runProgramNum;  
	          /*  document.getElementById('mainProgramNum').value=mainProgramNum;   */
	           document.getElementById('runNcProgramNum').value=runNcProgramNum;  
	           document.getElementById('runCutterGroupNum').value=runCutterGroupNum;  
	          /*  document.getElementById('runCutterNum').value=runCutterNum;   */ 
	         /*   document.getElementById('controledServoAsisNum').value=controledServoAsisNum;   */
	         /*   document.getElementById('CNCversion').value=CNCversion;   */
	           /* mini.get("factFeedSpeed").setValue(msg.factFeedSpeed); */
		      	  document.getElementById('isAlarm').value=isAlarm;   
		      	  document.getElementById('alarmNum').value=alarmNum;   	      	
		      	  document.getElementById('alarmClass').value=alarmClass;  
		      	  document.getElementById('alarmInfo').value=alarmInfo;  
		      	  document.getElementById('runTime').value=runTime;  
		       	  /* document.getElementById('circleTime').value=circleTime;  */
		      /* 	  document.getElementById('cutTime').value=cutTime; 
		      	  document.getElementById('isOn').value=isOn;   */
	          
/* 		  		var sta="关机";
		  		if(isOn=="已开机"){sta="开机"}
		  		
		  		var html='<span class="border row1"></span><span class="border row2"></span><span class="border col1"></span><span class="border col2"></span>';
		  		document.getElementById("cha").innerHTML=html+sta; */
	          }
}
function draw(){
	$.ajax({
		type:"POST",
 		url:"/SSM/gantetufanuc.action",
 		dataType:"json",
 		success:function(data){
 			var html='';
 			for(var i=0;i<data.total;i++){
 				var shuju=(Math.round(data.data[i].count/840*67000))/100; 				
 				if(data.data[i].status=="开机"){ 
 			html+='<span style="display:inline-block;background-color:green;float:left;height:100%;width:'+shuju+'px"></span>'
}else{
		html+='<span style="display:inline-block;background-color:red;float:left;height:100%;width:'+shuju+'px"></span>'

}
 				
 			}
 			document.getElementById("cha").innerHTML=html;
 			
 		}
	}
	)
}
 draw();
setInterval(draw,60000); 

	
	
	
	
	


/* ………………………………………………………………………………………………………………………………………………………………左上角的仪表盘的展示……………………………………………………………………………………………………………………………………………………………………………… */
option1 = {
     	 textStyle:{
   	        //文字颜色
   	        color:'#FFFFFF',
   	       fontSize:10
   	  
   	    },
    tooltip : {
        formatter: "{a} <br/>{c} {b}"
    },
    toolbox: {
        show: false,
        feature: {
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    series : [
        {
            name: '进给速度',
            type: 'gauge',
            z: 3,
            min: 0,
            max: 220,
            splitNumber: 11,
			  center: ['47%', '60%'], 
            radius: '70%',
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    width: 3
                }
            },
            axisTick: {            // 坐标轴小标记
                length: 10,        // 属性length控制线长
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: 'auto'
                }
            },
            splitLine: {           // 分隔线
                length: 20,         // 属性length控制线长
                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                    color: 'auto'
                }
            },
            axisLabel: {
                backgroundColor: 'auto',
                borderRadius: 2,
                color: '#eee',
                padding: 3,
                textShadowBlur: 2,
                textShadowOffsetX: 1,
                textShadowOffsetY: 1,
                textShadowColor: '#222'
            },
            title : {
                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 10,
                fontStyle: 'italic'
            },
            detail : {
                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
            /*     formatter: function (value) {
                    value = (value + '').split('.');
                    value.length < 2 && (value.push('00'));
                    return ('00' + value[0]).slice(-2)
                        + '.' + (value[1] + '00').slice(0, 2);
                }, */
                fontWeight: 'bolder',
                fontSize:10,
                borderRadius: 3,
                backgroundColor: '#444',
                borderColor: '#aaa',
                shadowBlur: 5,
                shadowColor: '#333',
                shadowOffsetX: 0,
                shadowOffsetY: 3,
                borderWidth: 2,
                textBorderColor: '#000',
                textBorderWidth: 2,
                textShadowBlur: 2,
                textShadowColor: '#fff',
                textShadowOffsetX: 0,
                textShadowOffsetY: 0,
                fontFamily: 'Arial',
                width: 50,
                color: '#eee',
                rich: {}
            },
            data:[{value: 40, name: '进给速度m/s'}]
        },
        {
            name: '主轴转速',
            type: 'gauge',
            center: ['15%', '70%'],    // 默认全局居中
            radius: '45%',
            min:0,
            max:7,
           
            endAngle:45,
            splitNumber:7,
            axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    width: 3
                }
            },
            axisTick: {            // 坐标轴小标记
                length:12,        // 属性length控制线长
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: 'auto'
                }
            },
            splitLine: {           // 分隔线
                length:20,         // 属性length控制线长
                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                    color: 'auto'
                }
            },
            pointer: {
                width:3
            },
            title: {
                offsetCenter: [0, '-30%'],       // x, y，单位px
				 // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 3,
                fontStyle: 'italic'
            },
            detail: {
                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize:10,
            },
            data:[{value: 1.5, name: 'x1000 r/min'}]
        },
		  {
            name:'主轴负载',
            type:'gauge',
			 center: ['85%', '70%'], 
			
            title : {
                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize: 3,
                fontStyle: 'italic'
            } ,
			 radius: '47%',
			    axisLine: {            // 坐标轴线
                lineStyle: {       // 属性lineStyle控制线条样式
                    width: 5
                }
            },
            axisTick: {            // 坐标轴小标记
                length:8,        // 属性length控制线长
                lineStyle: {       // 属性lineStyle控制线条样式
                    color: 'auto'
                }
            },
            splitLine: {           // 分隔线
                length:10,         // 属性length控制线长
                lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                    color: 'auto'
                }
            },
            pointer: {
                width:5
            },
            
            detail: {
                // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                fontWeight: 'bolder',
                fontSize:10,
            },
            detail : {formatter:'{value}%',
            	   fontSize:10},
            data:[{value: 50, name: '主轴负载'}]
        }
    ]
};



		var dom1 = document.getElementById("panelPostion");

		
		var myChart1 = echarts.init(dom1);
	setInterval(function (){
		    option1.series[0].data[0].value =factFeedSpeed ;
		    option1.series[1].data[0].value =spindleSpeed ;
		    option1.series[2].data[0].value =spindleLoad ;
		 
		    myChart1.setOption(option1,true);
		},500); 


        /* …………………………………………………………………………………………………………………………………………………………右上角负载的对比展示…………………………………………………………………………………………………………………………………………………………………………………… */    

        

   option2 = {
    color: ['#FF0000'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['X轴负载','Z轴负载','C轴负载','V轴负载'],
            axisLine:{
                lineStyle:{color:'#FFFFFF'}    // x轴坐标轴颜色
                },
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
            splitLine: {
                show: true, 
                //  改变轴线颜色
                lineStyle: {
                    // 使用深浅的间隔色
                    color: ['white']
                }                            
        },    axisLine:{
            lineStyle:{color:'#FFFFFF'}    // x轴坐标轴颜色
            },
        }
    ],
    series : [
        {
            name:'直接访问',
            type:'bar',
            barWidth: '60%',
            data:[1,2,3,4]
        }
    ]
};


      
       
        
        var dom2 = document.getElementById("innerbox");

        		
        		var myChart2 = echarts.init(dom2);
        		
      		setInterval(function (){
        		    option2.series[0].data =[servoAsisLoad1,servoAsisLoad2,servoAsisLoad3,servoAsisLoad4];

        		 
        		    myChart2.setOption(option2,true);
        		},2000);  
      		
/* ……………………………………………………………………………………………………………………………………坐标对比图的展示……………………………………………………………………………………………………………………………… */
 
 
 
 
 
var weatherIcons = {
		/* 可以定义图片标题 */
/*     'Sunny': './data/asset/img/weather/sunny_128.png',
    'Cloudy': './data/asset/img/weather/cloudy_128.png',
    'Showers': './data/asset/img/weather/showers_128.png' */
};

var seriesLabel = {
    normal: {
        show: true,
        textBorderColor: '#333',
        textBorderWidth: 1
    }
}
option3 = {
    title: {
        text: '坐标值对比图',
        textStyle:{
            //文字颜色
            color:'#FFFFFF'
      
        }
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    legend: {
        data: ['相对坐标', '绝对坐标', '剩余移动距离'],
        textStyle:{
            //文字颜色
            color:'#FFFFFF'
      
        }
    },
    grid: {
        left: 100
    },
    toolbox: {
        show: false,
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'value',
        name: 'Days',
        axisLine:{
            lineStyle:{color:'#FFFFFF'}    // x轴坐标轴颜色
            },
            splitLine: {
                show: true, 
                //  改变轴线颜色
                lineStyle: {
                    // 使用深浅的间隔色
                    color: ['white']
                }                            
        },
        axisLabel: {
            formatter: '{value}',
            textStyle:{
                //文字颜色
                color:'#FFFFFF'
          
            }
        }
    },
    yAxis: {
        type: 'category',
        inverse: true,
        data: ['X', 'Z','C','V'],
        axisLine:{
            lineStyle:{color:'#FFFFFF'}    // x轴坐标轴颜色
            },
        axisLabel: {
       	 textStyle:{
 	        //文字颜色
 	        color:'#FFFFFF'
 	  
 	    },
            formatter: function (value) {
                return '{' + value + '| }\n{value|' + value + '}';
            },
            margin: 20,
            rich: {
                value: {
                    lineHeight: 30,
                    align: 'center'
                },
                X: {
                    height: 40,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Sunny
                    }
                },
                Z: {
                    height: 40,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Showers
                    }
                },
                C: {
                    height: 40,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Showers
                    }
                },
                V: {
                    height: 40,
                    align: 'center',
                    backgroundColor: {
                        image: weatherIcons.Showers
                    }
                }
            }
        }
    },
    series: [
        {
            name: '相对坐标',
            type: 'bar',
            data: [165, 170,200,200],
            label: seriesLabel,
            markPoint: {
                symbolSize: 1,
                symbolOffset: [0, '50%'],
                label: {
                   normal: {
                        formatter: '{a|{a}\n}{b|{b} }{c|{c}}',
                        backgroundColor: 'rgb(242,242,242)',
                        borderColor: '#aaa',
                        borderWidth: 1,
                        borderRadius: 4,
                        padding: [4, 10],
                        lineHeight: 26,
                        // shadowBlur: 5,
                        // shadowColor: '#000',
                        // shadowOffsetX: 0,
                        // shadowOffsetY: 1,
                        position: 'right',
                        distance: 20,
                        rich: {
                            a: {
                                align: 'center',
                                color: '#fff',
                                fontSize: 18,
                                textShadowBlur: 2,
                                textShadowColor: '#000',
                                textShadowOffsetX: 0,
                                textShadowOffsetY: 1,
                                textBorderColor: '#333',
                                textBorderWidth: 2
                            },
                            b: {
                                 color: '#333'
                            },
                            c: {
                                color: '#ff8811',
                                textBorderColor: '#000',
                                textBorderWidth: 1,
                                fontSize: 22
                            }
                        }
                   }
                }
            }
        },
        {
            name: '绝对坐标',
            type: 'bar',
            label: seriesLabel,
            data: [-150, 110,100,200]
        },
 /*        {
            name: '机器坐标',
            type: 'bar',
            label: seriesLabel,
            data: [-220, 82,200,200]
        }, */
        {
            name: '剩余移动距离',
            type: 'bar',
            label: seriesLabel,
            data: [-220,63,300,100]
        }
    ]
};


var dom3 = document.getElementById("totalTable");

		
		var myChart3 = echarts.init(dom3);
	 	setInterval(function (){
		    option3.series[0].data=[relativeX,relativeZ,relativeC,relativeV] ;
		    option3.series[1].data=[absoluteX,absoluteZ,absoluteC,absoluteV] ;
		 /*    option3.series[2].data=[machineX,machineZ,machineC,machineV]; */
		    option3.series[2].data= [resMovDistanceX,resMovDistanceZ,resMovDistanceC,resMovDistanceV] ; 
		  
		    
/* 		     option.series[1].data[1].value =servoAsisLoad2 ;
		   
		    
		    option.series[2].data[2].value =servoAsisLoad3 ;
		    
		    
		    option.series[3].data[3].value =servoAsisLoad4 ;  */
		 
		    myChart3.setOption(option3,true);
		},3000);  





/* ………………………………………………………………………………………………………………………………………………………… */

	  
   </script>

 
</body>
</html>

