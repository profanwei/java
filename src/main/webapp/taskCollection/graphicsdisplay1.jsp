<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
  <title>任务统计</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- miniui.js -->
      <script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
<script type="text/javascript" src="staticResources/js/echarts.js"></script>
<script type="text/javascript" src="staticResources/js/echarts.min.js"></script>
   		 <script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
</head>
<style type="text/css">

        body
        {
		background-image: url("staticResources/image/bgimage.jpg");  
	
        } 
        </style>
<body>
	<div id="main" style="width:100%;height:500px;"></div>
<script type="text/javascript">
	var myChart;
	init();
  	function init(){
  		$.ajax({
  			type:"POST",
  			url:"Getdata1servlet",
  			dataType:"json",
  			success:function(result){
  			if(result!=null){
  				var machinename=[];
  				for(var i=0;i<result.length;i++){
  					machinename[i]=result[i].machineName;
  				}
  				var machinetime1=[];
  				for(var i=0;i<result.length;i++){
  					machinetime1[i]=result[i].sumYuyueTime;
  				}
  				var machinetime2=[];
  				for(var i=0;i<result.length;i++){
  					machinetime2[i]=result[i].sumcompletedtime;
  				}
  				 myChart = echarts.init(document.getElementById('main'));
  				 
  			        // 指定图表的配置项和数据
  			        var option = {
  			        		 textStyle: {
  					             color:'#FFFFFF'
  					            },
  			            title: {
  			                text: '机床使用情况',
  			              textStyle: {
					             color:'#FFFFFF'
					            },
  			            },
  			            tooltip: {},
  			          grid:{
  			            x:90,
  			            y:40,
  			            x2:120,
  			            y2:100,
  			            },  
  			            legend: {
  			            	data:['累计预约时间','累计实际使用时间'],
  			            	textStyle: {
 					             color:'#FFFFFF'
 					            },
  			            },
  			          xAxis:[ {
  		            	min: 0,
  		            	axisLabel:{
  		            		fontSize:14,
  		            		interval: 0,
          	        		formatter: function (value) {
          	        			var length=Math.floor(value.length/5);
          	        			var leave=value.length%5;
          	        			var signal=5-leave;
          	        			var str = value.split("");
          	        			var str1="";
          	        			if(length>=2){
          	        					for(var i=0;i<leave;i++){
          	        					str1=str1+str[i]+str[i+5]+str[i+10]+"\n";
          	        				}
          	        					for(var i=0;i<signal;i++){
          	        					str1=str1+str[leave]+str[leave+5]+"    "+"\n";
          	        					leave++;
          	        					}
          	        			}else if(length>=1 && length<2){
          	        				for(var i=0;i<leave;i++){
          	        					str1=str1+str[i]+str[i+5]+"\n"; 
          	        				}
          	        				for(var i=0;i<signal;i++){
          	        					str1=str1+str[leave]+"    "+"\n"; 
          	        					leave++;
          	        				}
          	        			}else{
          	        				for(var i=0;i<leave;i++){
          	        					str1=str1+str[i]+"\n"; 
          	        				}
          	        			}
          	        			return str1;
          	        		}
  		            		},
  		            	type: 'category',
  		                data: machinename
  		            }],
  			            yAxis: {
  					        axisLabel: {
  			            	min:0,
  			            	type: 'value',
  			            	formatter:'{value} 小时'
  					        }
  			            },
  			            series : [
  			            	{
  			            		name: '累计预约时间',
  			            		barGap: '0%',
  			                    type: 'bar',
  			                    data: machinetime1
  			            	},
  			            	{
  			            		name: '累计实际使用时间',
  			                    type: 'bar',
  			                    data: machinetime2
  			            	}
  			            ]
  			        };
  					  
  			        // 使用刚指定的配置项和数据显示图表。
  			        
  			        myChart.setOption(option);

  				
  			}else{
  				alert("显示错误");
  			}
  				
  			}
  			});
	}
  	
  	setInterval(init,3600000); 

    </script>
</body>
</html>