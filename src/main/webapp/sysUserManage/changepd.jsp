<%@ page language="java" import="java.util.*,com.wl.forms.Employee" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"><script type="text/javascript" src="<%=path %>/scripts/boot.js"></script>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/miniui/miniui.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
   
    <title>客户详细信息</title>
    <style type="text/css">
    	*{margin: 0;padding: 0;}
    	
    	#userdiv{
    	height:400px;
    	margin-top:10px;
    	
    	}
    	table{
    	margin:0 auto;
    	boder:0px;
    	border-collapse:collapse;
    	width:70%;
  /*   	height:400px; */
    	font-size:18px;
    	font-weight:bold;
    	}
    	
    	td{
    	text-align:left;
    	}
        input{
        height:40px;
        width:300px;
        margin-top:10px;
        margin-bottom:10px;
        font-size:16px;
        }
        #confirm{
        width:120px;
        height:40px;
        background-color: #66B3FF;
            font-size:16px;
          border: none;
        }
        #clear{
        width:120px;
          height:40px;
          background-color: #66B3FF;
          font-size:16px;
          border: none;
            
        }#confirm1{
        margin-top:110px;
        margin-left:30px;
        
        }
        #clear1{
         margin-top:-60px;
         margin-left:209px;
        }

        
/*         .mini-window-drag .mini-panel-header
{
    height:45px !important;
}
.mini-panel .mini-panel-title {
font-size:18px !important;
padding-top:6px !important;
} */
    </style>
  </head>
  
  <body>
<!--   	<div class="mini-toolbar">
  		<a class="mini-button" iconCls="icon-save" plain="false"  onclick="getForm()">保存</a>
  		<span class="separator"></span>
  		<a class="mini-button" plain="false" iconCls="icon-undo" onclick="javascript:window.history.back(-1);">返回</a>
  	</div> -->
	
   	<div id= "userdiv">
   		<table  >
   		<tr>
   			<td><label for="userId$text">用户号(登陆账户)</label></td>

        </tr>
        
        <tr>
                    <td><input id="userId"  name="userId" type="text"    required="required"  disabled="disabled" /></td>
        
        </tr>
         <tr>
            			<td><label for="staffCode$text">员工号</label></td>
         
        </tr>
         <tr>
                     <td><input id="staffCode" name="staffCode" type="text"    required="required"  disabled="disabled" />
        </tr>
       	<tr>
   			<td><label for="userName$text">员工姓名</label></td>
       	</tr>
       	<tr>
       	            <td><input id="userName" name="userName" type="text"   required="required" disabled="disabled" /></td>
       	</tr>
       		<tr>       		<td><label for="password$text">密码</label></td>
       		</tr>
       			<tr>
       			            <td><input id="password" name="password" type="password" /></td>
       			</tr>
       	<tr>
       		<td><label for="newpassword$text">新密码</label></td>
        </tr>
        <tr>
                    <td><input id="newpassword" name="newpassword" type="password" /></td>
        </tr>
         <tr>
                		<td><label for="Confirmpassword$text">密码确认</label></td>
         </tr>
          <tr>
                      <td><input id="Confirmpassword" name="Confirmpassword" type="password" /></td>
          </tr>
         
         
   	</table>
   </div>
   
           <div id="confirm1"> <input id="confirm" value="确认"type="button" onclick="getForm()"/></div>
         <div id="clear1"> <input id="clear" value="重置"type="button" onclick="clearForm()"/>
         </div>

   <script>
   		mini.parse();
   		function getForm(){
   			var newpassword = document.getElementById("newpassword").value;
   			var Confirmpassword =document.getElementById("Confirmpassword").value;
   			var userId =document.getElementById("userId").value;
   			var staffCode =document.getElementById("staffCode").value;
   			var userName =document.getElementById("userName").value;
   			var password =document.getElementById("password").value;
   			if(newpassword==null||Confirmpassword==null||newpassword==''||Confirmpassword==''){
   	   			
   				mini.alert("密码为空");
   				return;
   			}
   			if(newpassword==Confirmpassword){
   			}else{
   				mini.alert("密码不匹配，请确认新密码！");
   				return;
   			}
   			var form = new mini.Form("#userdiv");//?????
   		                 
   			
        
            	var data = form.getData();
                var params = eval("("+mini.encode(data)+")");
                console.log(params);
                var url = 'DoEditSysUsersServlet?newpassword='+newpassword+'&Confirmpassword='+Confirmpassword+'&userId='+userId+'&staffCode='+staffCode+'&userName='+userName+'&password='+password;
	//参数1 表示重置密码
   		        $.post(url, params, function(data){
   		        	if(data.result=='操作成功!'){
   		        		mini.alert(data.result,'提示',function(){
   		        			window.CloseOwnerWindow("ok");
   		        			/* window.location.href = "ToLogOut"; */
   		        		})
   		        		
   		        	}else{
   		        		mini.alert(data.result,'提示',function(){
   		        			window.location.href = window.location.href;
   		        	})
   		        	}
   	   		  		
   	   		    },'json');	
            
   		}
$(function(){

	$.ajax({
 		type:"POST",
 		url:"EditSysUsersServlet?para=0",
 		dataType:"json",		
 		success:function(result){
 			console.log(result.userId);
 			
 			document.getElementById("userId").value=result.userId;
 			document.getElementById("staffCode").value=result.staffCode;
 			document.getElementById("userName").value=result.userName;
 			
 		},
 		
	
	
})
})
function clearForm(){

	 document.getElementById("newpassword").value='';
			document.getElementById("Confirmpassword").value='';
   		document.getElementById("password").value='';
	
}
        

   </script>
  </body>
</html>
