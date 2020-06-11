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
	} 
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
      <div>
  	客户名称  <input id="companyname" name="companyname" class="mini-textbox" emptyText="请输入客户名称关键字" onenter="Search()"/>
  	<a class="mini-button" plain="fasle" onclick="Search()">查询</a>
  	 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否校内客户：</td>
	          <td><input id="inoutstatus" name="inoutstatus" class="mini-combobox" width="200" textName="" textField="text" valueField="id" value="2" 
  				url="data/inout.txt"  allowInput="false" showNullItem="true" nullItemText="全部"  onvaluechanged="Search()"/>
	          </td>
  	
  	</div>
    <div id="grid1" class="mini-datagrid" style="width:100%;height:95%;"
         borderStyle="border:0;" multiSelect="true"  idField="id" showSummaryRow="true" allowAlternating="true" showPager="true"
         url="ShowCustomerInfoServlet">
        <div property="columns">
            <div type="indexcolumn" headerAlign="center" align="center" >序号</div>
            
            <div name="action" width="40" headerAlign="center" align="center" renderer="onOperatePower"
                 cellStyle="padding:0;">操作
            </div>
            <div field="companyId" width="100" headerAlign="center" align="center" >客户编号
            </div>
            <div field="companyName" width="100" headerAlign="center" align="center" >客户名称
            </div>
          <!--   <div field="typeName" width="100" headerAlign="center" align="center" >企业类型
            </div>
            <div field="address" width="100" headerAlign="center" align="center" >详细地址
            </div> -->
            <div field="connector" width="100" headerAlign="center" align="center" >联系人
            </div>
            <div field="connectorTel" width="100" headerAlign="center" align="center" >联系人电话
            </div>
                        <div field="inout" width="100" headerAlign="center" align="center" renderer="onRenderer">是否内部客户
            </div>
        </div>
    </div> 
    
    <script type="text/javascript">
    	 mini.parse();
	    var grid = mini.get("grid1");
	    var a=mini.get("inoutstatus").getValue();
	    grid.load({"customname":"",inout:a}); //这是默认触发的语句
	    
	    //window.setInterval(function(){grid.load()},5000);
	    //alert("dddd");
		function Search(){
    	 var s=mini.get("companyname").getValue();
     	  /*  var s=document.getElementById("username").getValue; */
	 /* 		alert(s); */
	 var a=mini.get("inoutstatus").getValue();
	 		grid.load({customerName:s,inout:a});
	 }
        
  $("#username").bind("keydown", function (e) {
            if (e.keyCode == 13) {
                Search();
            }
        });
        
  
	    function onOperatePower(e) {
	        var str = "";
	        str += "<span>";
	        str += "<a style='margin-right:2px;' title='修改信息' href=javascript:onEdit(\'" + e.row.companyId+"\') ><span class='icon-edit' style='width:30px;height:20px;display:inline-block'></span></a>";

	        str += "<a style='margin-right:2px;' title='删除信息' href=javascript:onRemove(\'" + e.row.companyId+"\') ><span class='icon-remove' style='width:30px;height:20px;display:inline-block'></span></a>";
	        str += "</span>";
	        //alert(e.row.staffCode);
	        return str;
	    }
	    
	    
	    function onRemove(companyId){
	    	$.ajax({
                type:"POST",
                url:"showCustomerDelete.action",
               
                
                data: {companyId:companyId},
                dataType: "json",
                success:function(data){
                	 mini.alert("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.data, "提示",function(){

		  					window.grid.reload();
		  					
		  				 })
                	/*   alert(data.data);
              	grid.load(); */
                } ,
                error:function(data){
                	 mini.alert("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+data.data, "提示",function(){

		  					window.grid.reload();
		  					
		  				 })
                } 
            });
	    	}
	    	
	   
	    
	    function onEdit(companyId){
	        window.location.href ="EditCustomerDetailServlet?companyId=" + companyId;
			
		}
	    
	    var Genders = [{ id: 'M', text: '男' }, { id: 'W', text: '女'}];
        function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
       var Gender=[{id:'1',text:'是'},{id:'2',text:'否'}];
        function onRenderer(e) {
            for (var i = 0, l = Gender.length; i < l; i++) {
                var g = Gender[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }

        
    </script>

  </body>
</html>
