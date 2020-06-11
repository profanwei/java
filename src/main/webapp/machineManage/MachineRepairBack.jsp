<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>客户信息</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/js.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pagecard.css">
	<style type="text/css">
	<!--
	table {
	    table-layout:fixed;
	    word-break: break-all;
	} R
	-->
	</style>
	<style type="text/css">
    	*{margin: 0;padding: 0;}
    </style>
	<script type='text/javascript' src="<%=basePath%>resources/js/tabcard.js"></script>
			
	<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery.min.js"></script>
	<jsp:include page="/commons/miniui_header.jsp" />
  </head>
  
  <body>
  <form id="form0">
	    <table >
	   		<tr><td>设备名称：</td>
	          <td><input id="machineName" name="machineName" class="mini-combobox" width="200" textName="" textField="text" valueField="id"  url="MachineNameServlet"
  				  allowInput="false" showNullItem="true" nullItemText="全部"  onvaluechanged="loadgrid"/>
	          </td>
	
	           </tr>
	           </table>
	           </form>
    <div id="grid1" class="mini-datagrid" style="width:100%;height:95%;"
         borderStyle="border:0;" multiSelect="true"  idField="id" showSummaryRow="true" allowAlternating="true" showPager="true"
         url="MachineRepairListServlet">
        <div property="columns">
            <div type="indexcolumn" headerAlign="center" align="center">序号</div>
            <div name="action" width="50" headerAlign="center" align="center" renderer="onOperatePower"cellStyle="padding:0;">故障撤销</div>
            <div field="machineId" width="100" headerAlign="center" align="center">设备编号</div>
            <div field="machineName" width="100" headerAlign="center" align="center">设备名称</div>
            
            <div field="startDate" width="100" headerAlign="center"  dateFormat="yyyy-MM-dd" align="center">故障开始时间</div>
            <div field="endDate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd" align="center">故障结束时间</div>
           
            <div field="staffName" width="100" headerAlign="center" align="center">报修人</div>
            <div field="repairState" width="100" headerAlign="center" align="center">维修状态</div>
           <!--  <div field="mainId" width="100" headerAlign="center" align="center">记录编号</div> -->
        </div>
    </div>
    
    <script type="text/javascript">
    	mini.parse();
	    var grid = mini.get("grid1");
	    grid.load();
	  
	    $(function(){
	
	    	if("${param.machineId}"!=""){
	    		mini.get('machineName').setValue("${param.machineId}");
	    		loadgrid();
	    	}	
	    	
	    	if("${param.pageIndex}"!=""&"${param.pageSize}"!=""){
	    		pageNo=parseInt('${param.pageIndex}');
	    		pageSize=parseInt('${param.pageSize}');
	    		grid.gotoPage(pageNo,pageSize);
	    	
	    		
	    	}
	    })
	   
  function loadgrid(){
	    	
	    	var form=new mini.Form("#form0");
	    	var data1 =form.getData();
	    
	    	grid.load(data1);
	    	

	    }
	    
	    function onOperatePower(e) {
	        var str = "";
	        str += "<span>";
	        str += "<a style='margin-right:2px;' title='编辑' href=javascript:ondEdit(\'" + e.row.mainId+"\') ><span class='icon-edit' style='width:30px;height:20px;display:inline-block'></span></a>";
/* 	        str += "<span>";
	        str += "<a style='margin-right:2px;' title='撤消' href=javascript:ondRemove(\'" + e.row.mainId+"\') ><span class='icon-remove' style='width:30px;height:20px;display:inline-block'></span></a>";
	        str += "</span>"; */
	        //alert(e.row.staffCode);
	        return str;
	    }
	    
	    
	    function ondEdit(mainId){
	        //window.open("EditCustomerDetailServlet?companyId=" + companyId+"&connector="+connector,
	        //        "editwindow","top=50,left=100,width=950px,height=400px,status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=yes");
			
	        
	        pageIndex=window.grid.getPageIndex();
	        pageSize=window.grid.getPageSize();
	        var machineId=mini.get('machineName').getValue();
	        window.location.href = "MachineRepairSpecServlet?mainId="+mainId+"&pageSize="+pageSize+"&pageIndex="+pageIndex+"&machineId="+machineId;
		}
	    function ondRemove(mainId){
		//	window.location.href = "MachineRepairSpecServlet?mainId="+mainId+"&flag=2";
		 var url = 'updateRepairServlet';	
		 $.ajax({
			 url:url,
			 type:'post',
			 dataType:'json',	
			 data:{mainId:mainId},
			 cache:false,
			 async:false,
			 success:function(data){
				mini.alert(data.result, "提示",function(){

					window.grid.reload();
					
				 })
		                 
			 }
			 
		 });
	    }
		 
		 
		 
		
	
	   
	    var Genders = [{ id: 'M', text: '男' }, { id: 'W', text: '女'}];
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }

        
    </script>
  </body>
</html>
