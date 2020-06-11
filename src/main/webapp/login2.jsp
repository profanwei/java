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
            * { margin: 0; padding: 0; }
        html { height: 100%; }
        body { height: 100%; background: #fff url(images/backgroud.png) 50% 50% no-repeat; background-size: cover;}
        .dowebok { position: absolute; left: 50%; top: 50%; width: 430px; height: 550px; margin: -300px 0 0 -215px; border: 1px solid #fff; border-radius: 20px; overflow: hidden;}
        .logo { width: 104px; height: 104px; margin: 50px auto 80px; background: url(images/login.png) 0 0 no-repeat; }
        .form-item { position: relative; width: 360px; margin: 0 auto; padding-bottom: 30px;}
        .form-item input { width: 288px; height: 48px; padding-left: 70px; border: 1px solid #fff; border-radius: 25px; font-size: 18px; color: #fff; background-color: transparent; outline: none;}
        .form-item button { width: 360px; height: 50px; border: 0; border-radius: 25px; font-size: 18px; color: #1f6f4a; outline: none; cursor: pointer; background-color: #fff; }
        #username { background: url(images/emil.png) 20px 14px no-repeat; }
        #password { background: url(images/password.png) 23px 11px no-repeat; }
        .tip { display: none; position: absolute; left: 20px; top: 52px; font-size: 14px; color: #f50; }
        .reg-bar { width: 360px; margin: 20px auto 0; font-size: 14px; overflow: hidden;}
        .reg-bar a { color: #fff; text-decoration: none; }
        .reg-bar a:hover { text-decoration: underline; }
        .reg-bar .reg { float: left; }
        .reg-bar .forget { float: right; }
        .dowebok ::-webkit-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok ::-moz-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}
        .dowebok :-ms-input-placeholder { font-size: 18px; line-height: 1.4; color: #fff;}

        @media screen and (max-width: 500px) {
            * { box-sizing: border-box; }
            .dowebok { position: static; width: auto; height: auto; margin: 0 30px; border: 0; border-radius: 0; }
            .logo { margin: 50px auto; }
            .form-item { width: auto; }
            .form-item input, .form-item button, .reg-bar { width: 100%; }
        }
    
      /*  div{
           font-size:20pt;
           color:#FFFFFF;
           
            }  
         input[id=user]{
           font-size:15pt;
           width:300px;
           height:45px;
         
          }
          input[id=pwd]{
           font-size:15pt;
           width:300px;
           height:45px;
          }
         input[id=log]{ 
           width:100px;
           height:30px; 
           font-size:15pt;
           border:1px solid #FFFFFF;
           background-color:#FFFFFF;
           color:#0000E3;
          }
          input[id=modify]{
           width:100px;
           height:30px;   
           font-size:15pt;
           border:1px solid #FFFFFF;
           background-color:#FFFFFF;
           color:#0000E3;
           }
            span>input:hover{
           background-color:#66B3FF;
           color:#FFFFFF; */
           }  
      </style>	
      
      
         <style type="text/css">
    	*{margin: 0;padding: 0;}
 
    
    
    

        body
        {
            font-family:Arial, Sans-Serif;
            font-size:2em;
			overflow-x:hidden;
			overflow-y:hidden;
	
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
   
       </style>
  </head>
  <body style="text-align:center;padding-top:0px;" background="staticResources/image/bj.jpg"  bgcolor="#d9d9d9"></br>
 
<!--   <form style="text-align:center" name="form1" method="post" action="LoginHandler">
      <div id="denglu" >
     	L&nbsp;A&nbsp;B&nbsp;_&nbsp;M&nbsp;E&nbsp;S&nbsp;系&nbsp;统
       &nbsp;&nbsp;&nbsp;生&nbsp;&nbsp;产&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;与&nbsp;&nbsp;制&nbsp;&nbsp;造&nbsp;&nbsp;执&nbsp;&nbsp;行&nbsp;&nbsp;系&nbsp;&nbsp;统 
      </div></br></br></br>
      <div>用户名<input id="user" type="text" name="username"  maxlength="20" 
			   autocomplete=on value=""  onblur="javascript:return(checkform());">
	 </div></br>
      <div>密&nbsp;码<input id="pwd" type="password" name="passwd" maxlength="20"
			onblur="javascript:return(checkform());" value="">
	  </div></br></br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span>
		<input type="submit" name="Submit" value="确认登陆"  id="log"> -->


	<fieldset class="test01"  align="center" >

		<legend align="center">
			智能制造MES系统
		</legend>
		<br />
		<br />
		
     <div class="box" id="box3"  >
		<ul>
		
		<li>
		<h3>用户名</h3>
		<p><input id="user" name="username" type="text" width="100%"  style="BACKGROUND-COLOR: transparent;"/></p>
		</li>
		
		<li>
		<h3>密码</h3>
		<p><input id="pwd" type="password" name="passwd" width="100%"   style="BACKGROUND-COLOR: transparent;"/></p>
		</li>
		

		
		</ul>
</div>

	<div>
  	 <a class="mini-button mini-button-primary"  plain="false"  onclick="getForm()">登陆</a>
  		<!-- <input type="submit" name="Submit"  value="确认登陆"  id="log"> -->
  	</div>
       
      </fieldset>  

    <div class="dowebok">
        <div class="logo"></div>
        <div class="form-item">
            <input id="username" type="text" autocomplete="off" placeholder="用户名">
            
        </div>
        <div class="form-item">
            <input id="password" type="password" autocomplete="off" placeholder="密码">
            
        </div>
        <div class="form-item"><button id="submit"  onclick="getForm()">登 录</button></div>
        <div class="reg-bar">
         
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

