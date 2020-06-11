<%@ page errorPage="error.jsp" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <title>智能制造MES系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    	<script type="text/javascript" src="<%=path %>/scripts/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path %>/scripts/boot.js"></script> 
    <link href="staticResources\js\js1\login.css" rel="stylesheet" type="text/css" />
     
    
    
    <script language="javascript">
	    $ = function(eid) {
				return document.getElementById(eid);
			}
		function checkform() {
			if (document.form1.username.value == ""&& document.form1.passwd.value == "")
              {
				alert("用户名或密码为空！");
				return false;
			}
			return true;
		}
    </script> 
    <style type="text/css">

      </style>	

         <style type="text/css">
    	*{margin: 0;padding: 0;}

        body
        {
            font-family:Arial, Sans-Serif;
            font-size:2em;
			overflow-x:hidden;
			overflow-y:hidden;
          background-image: url("<%=path %>/staticResources/image/loginbg.jpg"); 
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
            font-size: 25px;
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
     	   font-size:15px;
			text-align:center;
            width:300px;
            padding:10px;
            position:relative;
            border:solid 1px #666;
            -moz-border-radius:5px;
            -webkit-border-radius:5px;
            margin-bottom:30px;
        }

        ul input.required 
        {
            border: solid 1px #f00;
        }
 
      fieldset{
    border: 0;
} 
 
   .test01 {
	position: absolute;
	height: 50%;
	width: 38%;
	left:31%;
	top:40%;
	border-radius: 15px;
	border-style: groove; 
	text-align:center;
}

   .test02 {
	position: absolute;
	height: 50%;
	width: 38%;
	left:10%;
	top:40%;
	border-radius: 15px;
	border-style: groove; 
	text-align:center;
}

.mini-button-inner{
   padding:18px;
   font-size:20px;
}
#logintext{
position: absolute;
width:30%;
height:20%;
right:8%;
bottom:30%;

}

.user{
 background: url("<%=path %>/staticResources/image//user.png") no-repeat scroll right center transparent;
 background-position: -20px 5px; 
 padding-left:20px;
 background-color:#FFF;
}
.key{
 background: url("<%=path %>/staticResources/image//key.png") no-repeat scroll right center transparent;
 background-position: -35px -4px; 
  padding-left:20px;
   background-color:#FFF;
}

       </style>
  </head>
  <body style="text-align:center;padding-top:0px;" ></br> <!-- bgcolor="#d9d9d9"  background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;-->
<div class="login_box">
<!--  <div class="login_l_img"><img src="staticResources\image\222.png" /></div>
  <div class="word"><font class="first">航空航天先进制造技术协同创新中心</font><br><font class="second">Collaborative Innovation Center of Advanced Manufacturing Technology in Aerospace</font><br><font class="third">江苏省精密与微细制造技术重点实验室</font></br><font class="forth">Jiangsu Key Laboratory of Precision and Micro-manufacturing Technology</font></div>
      <div class="login_l_img"><img src="staticResources\image\login-img.png" /></div>
      <div class="login">
          <div class="login_logo"><a href="#"><img src="staticResources\image\login_logo.png" /></a></div> 
          <div class="login_name">
               <p>实验室智能制造MES系统</p>
          </div> -->
          <div id="logintext">
       <form method="post">
              <input class="user" id="user" name="username" type="text"  placeholder="用户名">
              <input class="key" name="password" type="password" id="pwd" placeholder="密码">
              <input value="登录" " type="button" onclick="getForm()">
          </form> 
          </div>
      </div>
      </div>


    <script type="text/javascript">
       function  back(){
          winodw.location.href="modify.jsp";
       
       }
    
       
  		function getForm(){
  			var username=document.getElementById("user").value; 
  			var passwd=document.getElementById("pwd").value; 
  			window.location.href="LoginHandler?username="+username+"&passwd="+passwd;
   		
  		}
       
       
    </script>

  </body>
</html>

