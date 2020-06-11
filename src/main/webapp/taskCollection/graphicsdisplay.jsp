<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
  <title>图形显示</title>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- miniui.js -->
      <script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
<script type="text/javascript" src="staticResources/js/echarts.js"></script>
<script type="text/javascript" src="staticResources/js/echarts.min.js"></script>
   		 <script type="text/javascript" src="<%=path %>/js/jquery-2.1.4.min.js"></script>
</head>
<style type="text/css">
		body{
	
		color:#FFFFFF;
		}
        </style>
<body>
  <!--   <a  class="mini-button" iconCls="icon-undo" plain="false"  onclick="back()">返回</a> -->
	<div id="main" style="width:100%;height:400px;"></div>
	<script type="text/javascript">
	var myChart;
/* 	function back(){
		window.history.back(-1);
	} */
	$(function(){
		var managername="${param.managername}";
		$.ajax({
		type:"POST",
		url:"Getdataservlet",
		data:{
			
			managername:managername
		},
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
			//统计
			/* var datasource=[];
			var n=100;		//数据量
			var subgroup=0;
			if(n>=25&&n<40){
			subgroup=6;
			}else if(n>=40&&n<60){
			subgroup=7;
			}else if(n>=60&&n<100){
			subgroup=8;
			}else if(n==100){
			subgroup=10;
			}else if(n>100&&n<160){
			subgroup=11;
			}else if(n>=160&&n<250){
			subgroup=12;
			}
			var tongji=[];
			for(int i=0;i<subgroup;i++){
				tongji[i]=0;
			}
			var max=Math.max.apply(null,tongji);
			var min=Math.min.apply(null,tongji);
			for(var i=0;i<n;i++){
				datasource[i]=i;
			}
			var gap=Math.ceil((max-min)/(subgroup-1));
			var range=[];
			for(var i=0;i<subgroup;i++){
				range[i]=(min+i*gap-gap/2)+'~'+(min+i*gap+gap/2);
			}
			for(var i=0;i<n;i++){
				for(var j=0;j<subgroup;j++){
				if(min+j*gap+gap/2>datasource[i]&&datasource[i]>=min+j*gap-gap/2){
					tongji[j]++;
				}
				}
			} */
			
			 myChart = echarts.init(document.getElementById('main'));
		        // 指定图表的配置项和数据
		        var option = {
		            title: {
		                text: '机床使用情况',
		            },
		            grid:{
		            x:90,
		            y:40,
		            x2:120,
		            y2:120,
		            button:40
		            },  
		            tooltip: {},
		            legend: {
		            	data:['累计预约时间','累计实际使用时间'],
		            	textStyle:{
		            		fontSize:15,
		            	},
		            },
		            xAxis:[ {
		            	min: 0,
		            	axisLabel:{
		            		fontSize:16,
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
		            yAxis: [{
				        axisLabel: {
				        fontSize:16,
		            	min:0,
		            	type: 'value',
		            	formatter:'{value} 小时'
				        }
		            }],
		            series : [
		            	{
		            		name: '累计预约时间',
		            		barWidth:30,
		            		barGap: '0%',
		                    type: 'bar',
		                    data: machinetime1
		            	},
		            	{
		            		name: '累计实际使用时间',
		            		barWidth:30,
		                    type: 'bar',
		                    data: machinetime2
		            	},
		            	 /* {	//标出平均值
		            		name:'平均值',
		            		type:'line',
		            		markLine: {
		            			silent:true,
		            			symbol:"none", 
		            			label:{
		                            position:"end",         
		                            formatter: '平均值为:'+avg,
		                            color:"red",
		                            fontSize:14
		                        },
		                        data : [{
		                            silent:true,            
		                            lineStyle:{          
		                                type:"dashed",
		                                color:"red"
		                            },
		                            name: '平均值',
		                            yAxis: avg
		                        }]
		            		}
		            	} */ 
		            ]
		        };
				  
		        // 使用刚指定的配置项和数据显示图表。
		        
		        myChart.setOption(option);
		        myChart.getDom().style.height = document.documentElement.clientHeight + "px";
				 myChart.resize(); 
			
		}else{
			alert("显示错误");
		}
			
		}
		});
		})
/* 		window.onresize=function(){  
		 console.log(document.documentElement.clientHeight);
		 myChart.getDom().style.height = document.documentElement.clientHeight + "px";
		 myChart.resize(); 
} 
 */    </script>
</body>
</html>