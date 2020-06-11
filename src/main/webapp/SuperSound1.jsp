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
.border {
	position: absolute;
	padding: 5px;
	border-style: solid;
	border-color: #F75000;
}

.row1 {
	border-width: 5px 0 0 5px;
	top: -5px;
	left: -5px;
}

.row2 {
	border-width: 5px 5px 0 0;
	top: -5px;
	right: -5px;
}

.col1 {
	border-width: 0 0 5px 5px;
	bottom: -5px;
	left: -5px;
}

.col2 {
	border-width: 0 5px 5px 0;
	bottom: -5px;
	right: -5px;
}

#status {
	position: relative;
	height: 50px;
	width: 340;
	text-align: center;
	left: 310px;
	border: 1px solid #D2E9FF;
	top: 50px;
	font-size: 20px;
	font-weight: bold;
}

#box1 {
	position: relative;
	/* border-style: groove; */
	width:290px;
	height:220px;
	top:-79px;
	text-align: center;
	border: 1px solid #D2E9FF;
}

#box6 {
	position: absolute;
	/* border-style: groove; */
	border-radius: 15px;
	width: 630px;
	height: 510px;
	top: -110px;
	right: 0px;
}

#box2 {
	position: relative;
	width:290px;
	height:230px;
	top:-53px;
	border: 1px solid #D2E9FF;
}

#innerbox {
	position: relative;
	width: 100%;
	height:230px;
}

#box8 {
	position: relative;
	border: 1px solid #D2E9FF;
	width:250px;
	height:160px;
	top:-533px;
	right:-676px;
	text-align: center
}
#box81 {
	position: relative;
	border: 1px solid #D2E9FF;
	width:250px;
	height:80px;
	top:-523px;
	right:-676px;
	text-align: center
}
#box82 {
	position: relative;
	border: 1px solid #D2E9FF;
	width:250px;
	height:110px;
	top:-513px;
	right:-676px;
	text-align: center
}
#box83 {
	position: relative;
	border: 1px solid #D2E9FF;
	width:250px;
	height:90px;
	top:-503px;
	right:-676px;
	text-align: center
}

.box {
	position: absolute;
	border-radius: 15px;
	width: 530px;
	height: 565px;
	text-align: center;
}

#box10 {
	position: relative;
	left: 310px;
	top: -845px;
	height: 220px;
	width: 340px;
	border: 1px solid #D2E9FF;
}
#box11 {
	position: relative;
	left: 310px;
	top: -825px;
	height: 100px;
	width: 340px;
	border: 1px solid #D2E9FF;
		text-align: center
}

#totalTable {
	position: absolute;
	height: 220px;
	width: 100%;
	bottom:30px;
}

.macinheInfoFiedldset {
	border-radius: 15px;
}

#machineInfo {
	position: absolute;
	left: 50%;
	transform: translate(-50%, 0);
	top: 95px;
	height: 150px;
	width: 800px;
}

#TopTitle {
	left: 310px;
	position: relative;
	top: 35px;
	height: 40px;
	width: 340px;
	text-align: center;
	border: 1px solid #D2E9FF;
	padding-bottom: 20px;
}


#panelName {
	position: relative;
	height: 20px;
	width: auto;
	top: 160px;
	FONT-SIZE:10PX;

	/* border-style: groove; */
}

#panelPostion {
	position: relative;
	width: 100%;
	top: 10%;
	height: 220px;
	left: 40%;
	transform: translate(-50%, 0);
}

#test02 {
	text-align: center;
}

#cha {
	margin-top: 12px;
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
        h3{
        font-size:1px;
        margin-top:5px;
        margin-bottom:5px;
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
            font-size: 1px;
            font-weight: bold;
            margin: 1px 0 0 0;
            width: 200px;
            margin-left:-40px;
        }

        ul li
        {      
            padding: 5px 0;
            width:600px;
            overflow:hidden;
        }

        ul input[type="text"], ul input[type="password"]

        {
        align:center;
				text-align:center;
				margin-left:-290px;
            width:120px;
            padding:2px;
            position:relative;
            border:solid 1px #666;
            background-color: transparent;
            color:#FFFFFF; 
            height:17px;
            readonly:readonly;
            font-size:1;
   
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
<!--     <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<h2><strong id="mach">超声辅助高速加工中心</strong></h2>
</div>
<div class="title" id="status" >
<!--     <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
	<div id="cha"></div>

</div>

<div class="box1" id="box1">
<!--  <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<div class="panelPostion" id="panelPostion">   
</div>

</div> 

 <div id="box2">
<!--   <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
 <div id="innerbox">
</div>
</div>  


 <div  id="box8">
<!--   <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
	<h3>基本信息 </h3>
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
<h3>数控系统</h3>
<p>
<input type="text" value="" id="machineSystem" name="machineSystem" /></p>
</li>
<li>
<h3>当前时间</h3>
<p>
<input type="text" value="" id="createTime" name="createTime" /></p>
</li>
<li>
<h3>运行模式</h3>
<p>
<input type="text" value="" id="runMode" name="runMode" /></p>
</li>
</ul>

</div> 
<div  id="box81">
<!-- <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<h3>运行时间 </h3>
<ul>
<li>
<h3>开机时间</h3>
<p>
<input type="text" value="" id="runTime" name="runTime" /></p>
</li>
<li>
<h3>切削时间</h3>
<p>
<input type="text" value="" id="cuttime" name="cuttime" /></p>
</li>
</ul>	
	</div>
<div  id="box82">
<!-- <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<h3>程序信息 </h3>
<ul>
<li >
<h3>程序状态</h3>
<p>
<input type="text" value="" id="runCondition" name="runCondition" /></p>
</li>
<li>
<h3>程序名称</h3>
<p>
<input type="text" value="" id="runProgramName" name="runProgramName" /></p>
</li>
<li>
<h3>程序行号</h3>
<p>
<input type="text" value="" id="runProgramNum" name="runProgramNum" /></p>
</li>
</ul>	
</div>
<div  id="box83">
<!-- <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<h3>报警信息 </h3>
<ul>
<li>
<h3>报警编号</h3>
<p>
<input type="text" value="" id="alarmNum" name="alarmNum" /></p>
</li>
<li>
<h3>报警信息</h3>
<p>
<input type="text" value="" id="alarmInfo" name="alarmInfo" /></p>
</li>
</ul>
</div> 
<div id="box10">
<!-- <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<div id="totalTable" ></div> 
<div  id="panelName">
<h3 align="center">主轴转速 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 进给速度  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;主轴负载</h3>
</div>

</div>
<div id="box11">
<!-- <span class="border row1"></span>
	<span class="border row2"></span>
	<span class="border col1"></span>
	<span class="border col2"></span> -->
<h3>加工信息 </h3>
<ul>
<li >
<h3 style="margin-left:10px">主轴转速倍率</h3>
<p>
<input type="text" value="" id="spindleSpeedOvr" name="spindleSpeedOvr" /></p>
</li>
<li>
<h3 style="margin-left:10px">进给倍率</h3>
<p>
<input type="text" value="" id="feedRateOvr" name="feedRateOvr" /></p>
</li>
</ul>
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
var absoluteY=0 ;  
var absoluteZ=0 ;           
var absoluteC=0 ;   
var absoluteV =0; 
var runProgramName=0;
var machineX=0 ;    
var machineY=0 ; 
var machineZ=0;            
var machineC=0 ;            
var machineV=0 ;  

var resMovDistanceX=0 ;       
var resMovDistanceZ=0 ;     
var resMovDistanceC=0 ;     
var resMovDistanceV=0 ;   

var spindleName=0 ;         
var spindleNum=0 ;          
var spindleLoad=10 ;         
var spindleSpeed=0 ; 

var servoAsisLoad1=0 ;      
var servoAsisLoad2=0 ;      
var servoAsisLoad3=0 ;      
var servoAsisLoad4 =0;  

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
var isOn=0;
var aaloadX=0;
var aaloadY=0;
var aaloadZ=0;
var actFeedRateX=0;
var actFeedRateY=0;
var actFeedRateZ=0;
var clientid="fw"+Math.random();
client = new Paho.MQTT.Client("222.192.72.12",8083,clientid); //建立客户端实例
client.connect({
	onSuccess: onConnect,
	userName: "admin",
	password: "public"
}); //连接服务器并注册连接成功处理事件
client.onConnectionLost = onConnectionLost; //注册连接断开处理事件
client.onMessageArrived = onMessageArrived; //注册消息接收处理事件
function onConnect() {
	client.subscribe("DataCollect/DMG/Machine_5503"); //订阅主题
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
    
    createTime=strs[0];//当前时间	
    machineName=strs[1]; //机床名称
    machineIp= strs[3]; //机床IP
    machineSystem=strs[2]; //机床数控系统
    isOn=strs[5];//开机状态	
    runTime=strs[6];//开机时间	
    operatingTime=strs[7];//程序运行时间	
    runProgramName=strs[8];//程序名称	
    runCondition=strs[9];//程序运行状态	
    runProgramNum=strs[10];//程序行号	
    alarmNum=strs[11];//报警编号	
    alarmInfo=strs[12];//报警信息	
    runMode=strs[13];//运行模式	
    spindleSpeedOvr=strs[14];//主轴转速倍率	
    feedRateOvr=strs[15];//进给倍率	
    cuttime=strs[26];//切削时间	
    circletime=strs[27];//循环时间	
    alarmCount=strs[28];//报警数量	
	            //机械坐标
	         machineX=strs[16];
	           machineY=strs[17];
	           machineZ=strs[18]; 
	           //绝对坐标		
	           absoluteX=strs[19];
	           absoluteY=strs[20];
	           absoluteZ=strs[21];
	         
	           
	           //实际进给速度
	           actFeedRateX=strs[23];
	           actFeedRateY=strs[24];
	           actFeedRateZ=strs[25];
	           //主轴转速	
	           spindleSpeed=strs[22]; 
	           //主轴负载率
	          spindleLoad=strs[29]; 
	           //进给轴负载率
	         aaloadX=strs[30];
	           aaloadY=strs[31];
	           aaloadZ=strs[32];  
	         
	          
	           if(strs[0]!="close"){
               document.getElementById('createTime').value=createTime;
	           document.getElementById('machineName').value=machineName; 
	           document.getElementById('machineIp').value=machineIp;   
	           document.getElementById('machineSystem').value=machineSystem; 
	      	   document.getElementById('runTime').value=runTime;
	      	   document.getElementById('runProgramName').value=runProgramName;
	      	   document.getElementById('runCondition').value=runCondition;
	      	   document.getElementById('runProgramNum').value=runProgramNum;
	      	   document.getElementById('alarmNum').value=alarmNum;
	      	   document.getElementById('alarmInfo').value=alarmInfo;
	      	   document.getElementById('runMode').value=runMode;
	      	   document.getElementById('spindleSpeedOvr').value=spindleSpeedOvr;
	      	   document.getElementById('feedRateOvr').value=feedRateOvr;
	      	   document.getElementById('cuttime').value=cuttime; 
	      		var sta="关机";
		  		if(isOn=="已开机"){sta="开机"}
		  		
/* 		  		var html='<span class="border row1"></span><span class="border row2"></span><span class="border col1"></span><span class="border col2"></span>';
 */		  		document.getElementById("cha").innerHTML=sta;


	           }
   
}




/* ………………………………………………………………………………………………………………………………………………………………左上角的仪表盘的展示……………………………………………………………………………………………………………………………………………………………………………… */
option1 = {
     	 textStyle:{
   	        //文字颜色
   	        color:'#FFFFFF',
   	       fontSize:8
   	  
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
                padding:0.1,
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
                formatter: function (value) {
                    value = (value + '').split('.');
                    value.length < 2 && (value.push('00'));
                    return ('00' + value[0]).slice(-2)
                        + '.' + (value[1] + '00').slice(0, 2);
                },
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
                fontSize:10
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
				 fontSize:3
            },
            detail : {
            	formatter:'{value}%',
            	fontSize:10
            	},
            data:[{value: 50, name: '主轴负载'}]
        }
    ]
};



		var dom1 = document.getElementById("totalTable");

		
		var myChart1 = echarts.init(dom1);
	setInterval(function (){
		    option1.series[0].data[0].value =actFeedRateX ;
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
            data : ['X轴负载','Y轴负载','Z轴负载'],
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
            barWidth: '30%',
            data:[1,2,3]
        }
    ]
};


      
        var dom2 = document.getElementById("innerbox");

        		
        		var myChart2 = echarts.init(dom2);        		
      		setInterval(function (){
      			option2.series[0].data=[aaloadX,aaloadY,aaloadZ];
      		
        		 
        		    myChart2.setOption(option2,true);
        		},2000); 
/* ……………………………………………………………………………………………………………………………………坐标对比图的展示……………………………………………………………………………………………………………………………… */
 
 
 
 
 


var seriesLabel = {
    normal: {
        show: true,
        textBorderColor:  '#FFFFFF',
        textBorderWidth: 1
    }
}

option3 = {
     	 textStyle:{
   	        //文字颜色
   	        color:'#FFFFFF',
   	       fontSize:8
   	  
   	    },
    title: {
        padding:[0,0,0,140],
        text: '坐标值对比图',
        textStyle:{
            //文字颜色
            color:'#FFFFFF',
            fontSize:10
      
        }
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    legend: {
    	 padding:[20,0,0,100],
        data: ['机械坐标', '绝对坐标'],
        textStyle:{
            //文字颜色
            color:'#FFFFFF'
      
        }
    },
    grid: {
        left: 100
    },
    toolbox: {
        show:false,
        feature: {
            saveAsImage: {}
        }
    },
    xAxis: {
        type: 'value',
        name: 'mm',
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
       	        color:'#FFFFFF',
       	       fontSize:8
       	  
       	    }
        }
    },
    yAxis: {
        type: 'category',
        inverse: true,
        data: ['X','Y','Z'],
        axisLine:{
            lineStyle:{color:'#FFFFFF'}    // x轴坐标轴颜色
            },
        axisLabel: {
        	 textStyle:{
        	        //文字颜色
        	        color:'#FFFFFF',
        	  fontSize:10
        	    },
/*             formatter: function (value) {
                return '{' + value + '| }\n{value|' + value + '}';
            }, */
            margin: 20,
            rich: {
                value: {
                    lineHeight: 30,
                    align: 'center'
                },
                X: {
                    height: 10,
                    align: 'center',
                    backgroundColor: {
                        
                    }
                },
                Y: {
                    height: 10,
                    align: 'center',
                    backgroundColor: {
                     
                    }
                },
                Z: {
                    height: 10,
                    align: 'center',
                    backgroundColor: {
                       
                    }
                },

            }
        }
    },
    series: [
        {
            name: '机械坐标',
            type: 'bar',
            data: [165, 170,200],
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
            data: [-150, 110,100]
        },


    ]
};


var dom3 = document.getElementById("panelPostion"); 

		
		var myChart3 = echarts.init(dom3);

	 	setInterval(function (){
		    option3.series[0].data=[machineX,machineY,machineZ];
		    option3.series[1].data=[absoluteX,absoluteY,absoluteZ] ;
		    myChart3.setOption(option3,true);
		},3000);  





/* ………………………………………………………………………………………………………………………………………………………… */

/* 		window.onload=function(){
			console.log(document.body.clientHeight*0.3);
		}
		$(function(){
			document.getElementById("panelPostion").style.height=document.body.clientHeight*0.3;
			myChart1.resize;

		}) */


	  
   </script>

 
</body>
</html>

