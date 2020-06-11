<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
<head>
    <base href="<%=basePath%>">
    <title>完工比例查询</title>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta content="always" name="referrer">

<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta name="keywords" content="NUAA">
<meta name="description" content="NUAA设备预约系统">

<script>
    var $ctx = "/gym";
    var $ctxStatic = "/gym/static";
    
    window.console = window.console || (function () {
            var c = {};
            c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile
                = c.clear = c.exception = c.trace = c.assert = function () {
            };
            return c;
        })();
</script>
<!--添加浏览器icon图标-->
<link type="image/x-icon" rel="icon" href="<%=path %>/resource/images/favicon.ico">
<!--style start-->

<script type="text/javascript" src="<%=path %>/resources/scripts/boot.js"></script>

<!-- 字体图标 -->
<!--style end-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/html5.min.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/json2.js"></script>
<![endif]-->

<!--[if (gte IE 9)|(!IE)]> -->
<script src="<%=path %>/resource/timePlanJs/jquery.min.js"></script>
<!-- <![endif]-->

<!--[if lt IE 9]>
<script src="/gym/static/plugins/jquery/jquery-1.12.4.min.js"></script>
<![endif]-->

<script src="<%=path %>/resource/timePlanJs/bootstrap.min.js?v=3.3.6"></script>
<script src="<%=path %>/resource/timePlanJs/layer.js"></script>
<script src="<%=path %>/resource/timePlanJs/template.js"></script>
<script src="<%=path %>/resource/timePlanJs/moment-with-locales.js"></script>
<script src="<%=path %>/resource/timePlanJs/laypage.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.qrcode.min.js"></script>


<!--jquery validate begin-->
<script src="<%=path %>/resource/timePlanJs/jquery.validate.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/messages_zh.min.js"></script>
<script src="<%=path %>/resource/timePlanJs/jquery.validate.extend.js"></script>
<!--jquery validate end-->


<script src="<%=path %>/resource/timePlanJs/utils.js"></script>

    <!--style start-->
    <link href="<%=path %>/resource/timePlanJs/common.css" rel="stylesheet">  <!--my公共样式-->
    <link href="<%=path %>/resource/timePlanJs/venue_reservation.css" rel="stylesheet">
    <link href="<%=path %>/resource/timePlanJs/session.css" rel="stylesheet"/>
    <!--style end-->
     <style type="text/css">
/*     	
/* 	.article_2 {
	width:850px;
	/*height:272px;*/
	/*background-color:gray;*/
	margin-top: 60px;
	margin-left: 17px;
}
		 */	
/* 		.tabs-container {
				width: 1100px;
    			border: 1px solid #ebebeb;
			}
			 */
/* 			.box-scroll {
			    width: 1300px;
			    /* max-height: 460px; */
			    overflow-y: auto;
			    overflow-x: auto;
			}	 */
/* 		.spanTextClass {
		font-size: small;
		line-height:20px;
			} */ */
    </style>

    
    
    
</head>
<body>
	<form id="form0" >
	    <table style="font-size:13px">
	   		<tr>
	          <td>开始时间：</td>
	          <td><input id="bday" class="mini-datepicker" width="100"  allowinput="false"  format="yyyy-MM-dd" required="false"/>	
	          </td>
	          <td>结束时间：</td>
	          <td><input id="eday" class="mini-datepicker"  width="100" allowinput="false"  format="yyyy-MM-dd" required="false"/>
	          </td>
	          <td>设备管理员: </td>
	          <td><input id="managername"  class="mini-textbox" style="" textField="text" valueField="id" 
   				value=""   allowInput="true" onvaluechanged="search()"/></td>
	          <td><span>&nbsp;</span></td>
	          <td><input value="查找" type="button" onclick="search()" style="width:50px;"/></td>
	          <td><span>&nbsp;</span></td>
	          <td><input value="图形显示" type="button" onclick="search1()" style="width:80px;"/></td>
	          <!-- <td><span>&nbsp;</span></td>
	          <td><input value="测试" type="button" onclick="search2()" style="width:80px;"/></td> -->
	       </tr>
	    </table>
	</form>   
	  <div id="grid11" class="mini-datagrid" style="width:100%;height:95%;"
         borderStyle="border:0;" multiSelect="true"  idField="id" showSummaryRow="true" allowAlternating="true" showPager="true"
         url="Yuyuewanjieservlet">
        <div property="columns">
            <div type="indexcolumn" headerAlign="center" align="center" >序号</div>
            <div name="action" width="20" headerAlign="center" align="center" renderer="onOperatePower"
                 cellStyle="padding:0;">查看</div>
            <div field="machinemanagers" width="100" headerAlign="center" align="center">管理员</div>     
            <div field="machineId" width="100" headerAlign="center" align="center">设备编号</div>
            <div field="machineName" width="100" headerAlign="center" align="center">设备名称</div>
            <div field="sumYuyueTime" width="100" headerAlign="center" align="center">累计预约时间（小时）</div>
            <div field="sumcompletedtime" width="100" headerAlign="center" align="center">累计实际使用时间（小时）</div>
        </div>
    </div>
   <script type="text/javascript">
    	mini.parse();
	    var grid = mini.get("grid11");
	    grid.load();
		function search(){
 			var bday = mini.get("bday").getFormValue();
			var eday = mini.get("eday").getFormValue();
			var managername = mini.get("managername").getFormValue();
			 $.ajax({
	             type: "POST",
	             url:"Yuyuewanjieservlet",
	             data: {
	            	bday: bday,
			 		eday: eday,
			 		managername:managername
	             },
	             dataType: "json",
	             success: function(data){	 
					if(data.result=true){
						grid.load({managername:managername});
	                 } else {
	                     U.msg("失败");
	                 }
	                      }
	         });
		}
		function search1(){
			var managername = mini.get("managername").getFormValue();
			window.open("taskCollection/graphicsdisplay.jsp?managername="+managername);	
		}
		/* function search2(){
			window.open("taskCollection/ceshi.jsp");	
		} */
		function onOperatePower(e) {
	        var str = "";
//	        str += "<span>";
//	        str += "<a style='margin-right:2px;' title='外协详情' href=javascript:ondStat(\'"+e.row.waiXieCom+"\') ><span class='mini-button-text mini-button-icon icon-edit'>&nbsp;</span></a>";
//          str += "</span>";
	        str += "<span>";
	        str += "<a style='margin-right:2px;' title='查看详情' href=javascript:ondMenu(\'"+e.row.machineId+"\') ><span class='icon-user' style='width:30px;height:20px;display:inline-block'></span></a>";
	        str += "</span>";
	        return str;
	    }
		function ondMenu(machineId){
			//var createTime=document.getElementById("createTime");
			var bday = mini.get("bday").getFormValue();
			var eday = mini.get("eday").getFormValue();
			var managername = mini.get("managername").getFormValue();
	    	window.location.href="Xiangxiservlet?bday="+bday+"&eday="+eday+"&machineId="+machineId;
		}
    </script>
  </body>
</html>
