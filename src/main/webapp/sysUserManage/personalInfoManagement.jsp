<%@ page language="java" import="java.util.*,com.wl.forms.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户信息</title>
    <!-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->
       <script src="<%=path %>/resource/timePlanJs/jquery.min.js"></script>

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
		    
    
		<script type='text/javascript' src="<%=basePath%>resources/js/tabcard.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/jquery/jquery.min.js"></script>
		<jsp:include page="/commons/miniui_header.jsp" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/js.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/pagecard.css">
		
	<!-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->

		<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#form1 {
	margin-top: 10%;
	margin-left: 20%;
}

td {
	font-size: 20px;
	padding-left: 50px;
}

input {
	height: 30px;
	background: #fff;
	border: 1px solid;
	padding-left:5px;
}

#edit {
 width:120px;
          height:40px;
          background-color: #66B3FF;
          font-size:16px;
          border: none;
}
body{
  background-image: url("<%=path %>/staticResources/image/inbg.jpg"); 
  background-size: 100% 100%;
}
</style>
	
    	
	    	
  </head>
  <!-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->
  
  <body>
  
 

		

   		<div id="form1" >
   		<table  rules=none tableframe=void width="100%" style="	font-size:20px;border-collapse:separate; border-spacing:0px 10px;">
   		    <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >  <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
   		<tr >
   			<td width="10%" align="right"><label for="staffCode$text" >用户编号</label></td>
            <td width="25%" padding-left="50px"><input id="staffCode"  name="staffCode" type="text"  width="40%"  disabled="disabled"/></td>
           
        </tr>
                <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
        <tr>
         <td width="10%" align="right"><label for="staffName$text">用户姓名</label></td>
            <td width="25%" padding-left="50px"><input id="staffName" name="staffName" type="text" width="40%"  disabled="disabled"/>
   			
        </tr>
        <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
        <tr>
        	<td width="10%" align="right"><label for="sectionCode$text">所属部门</label></td>
            <td width="20%" padding-left="50px"><input id="sectionCode"  name="sectionCode" type="text"  width="40%"  disabled="disabled" />  
            </td>
  
   			         <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
          <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
   			 <tr>
   			 <td width="10%" align="right"><label for="connectorTel$text">联系电话</label></td>
            <td width="20%" padding-left="50px"> <input id="mobilePhone"  name="mobilePhone" type="text"  width="40%"  disabled="disabled" />  
           
   			 </tr>
              <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >  <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
                 <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >  <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >         <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >  <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >         <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >  <tr >
        <td width="10%"></td>
        <td width="25%"></td>
        </tr >
 

   		
   	</table>
  	 	</div>
			<div class="mini-toolbar" style="margin-left:730px;border:0;margin-top;-80px;width:100px;">
		<input id="edit"type="button" value="修改" onclick="onEdit()"/>


   		 </div>
  <!-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->
  
    <script type="text/javascript">
    
    	mini.parse();
	    //var grid = mini.get("bookMachine");
	    var staffCode="<%=((User)request.getSession().getAttribute("user")).getStaffCode()%>";
	  	// grid.load(); 
	    
	    function onEdit(){
//	        window.open("EditEmployeeDetailServlet?staffCode=" + staffCode,
//	                "editwindow","top=50,left=100,width=950px,height=400px,status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=yes");
	         window.location.href="EditEmployeeDetailServlet?staffCode="+staffCode;
		}
	    
	    function addCustomer(){
//	        window.open("EditEmployeeDetailServlet?staffCode=" + staffCode,
//	                "editwindow","top=50,left=100,width=950px,height=400px,status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=yes");
	         window.location.href="customerManage/addCustomer.jsp";
		}
	    
	    load();
   		function load () {
		   			
   				jQuery.ajax({
		  				type: "POST",
		  				url: "LoadDefaultEmployeeInfo.action?staffCode="+staffCode,
		  				dataType: "json", 
		  				cache: false,
		  				success: function (data) {
		  					console.log(data);
		  					document.getElementById("staffCode").value=data.staffCode;
		  		 			document.getElementById("staffName").value=data.staffName;
		  		 			document.getElementById("sectionCode").value=data.sectionCode;
		  		 			document.getElementById("mobilePhone").value=data.mobilePhone;
		  				
		  					
		  				 
		  				}
					});
                         
                }
        
    </script>
  </body>
</html>
