<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
   <base href="<%=basePath%>"><script type="text/javascript" src="<%=path %>/resources/scripts/boot.js"></script>
    <meta http-equiv="content-Type" content="text/html;charset=utf-8"/>
		<script type="text/javascript" src="<%=path %>/resources/scripts/jquery.min.js"></script>
		<link href="<%=path %>/scripts/miniui/themes/default/miniui.css" rel="stylesheet" type="txt/css"></link>
		<link href="<%=path %>/scripts/miniui/themes/icons.css" rel="stylesheet" type="txt/css"></link>
		
		<script src="<%=path %>/resource/timePlanJs/bootstrap.min.js?v=3.3.6"></script>
		<script src="<%=path %>/resource/timePlanJs/layer.js"></script>
		<script src="<%=path %>/resource/timePlanJs/template.js"></script>
		<script src="<%=path %>/resource/timePlanJs/moment-with-locales.js"></script>
		<script src="<%=path %>/resource/timePlanJs/laypage.js"></script>
		<script src="<%=path %>/resource/timePlanJs/jquery.qrcode.min.js"></script>
		<!--这个我自己写好的关于订单的状态的js  -->
		<script type='text/javascript' src="<%=basePath%>resources/myJs/bookStatusJs.js"></script>
		<!--jquery validate begin-->
		<script src="<%=path %>/resource/timePlanJs/jquery.validate.min.js"></script>
		<script src="<%=path %>/resource/timePlanJs/messages_zh.min.js"></script>
		<script src="<%=path %>/resource/timePlanJs/jquery.validate.extend.js"></script>
		<!--jquery validate end-->
		
		<script src="<%=path %>/resource/timePlanJs/utils.js"></script>
		
    
    <style type="text/css">
        .New_Button, .Edit_Button, .Delete_Button, .Update_Button, .Cancel_Button
        {
            font-size:11px;color:#1B3F91;font-family:Verdana;  
            margin-right:5px;          
        }
       
                
    </style>        
</head>
<body>
    
	<!-- <div class="mini-toolbar" style="padding:2px;border:0;">
		<a class="mini-button" iconCls="icon-find" plain="false" onclick="pass('13')">审核通过</a>
		<span class="separator"></span>
		<a class="mini-button" iconCls="icon-find" plain="false" onclick="pass('14')">审核不通过</a>	
		<span class="separator"></span>
		
  			<a class="mini-button" iconCls="icon-find" plain="false"  onclick="bookModify()">修改用户预约</a>  
    </div> -->
    
    
      	<form id="form0">
	    <table >
	   		<tr>
	         <!--  <td>开始时间：</td>
	          <td><input id="bday" class="mini-datepicker" width="100"  allowinput="false"  format="yyyy-MM-dd" required="false"/>
	          </td>
	          <td>结束时间：</td>
	          <td><input id="eday" class="mini-datepicker"   width="100" allowinput="false"  format="yyyy-MM-dd" required="false"/>
	          </td> -->
	   <!--        <td width="60px" align="right">接收人：</td>
	          <td><input id="creater" name="creater" class="mini-buttonedit" width="100" showClose="true" oncloseclick="onCloseClick('creater')"
            		onbuttonclick="onButtonEdit" textName="worker" required="false" value="" text="" onvaluechanged="loadgrid"  allowInput="false"/>
	          </td> -->
	          
	       </tr>
	       <tr>
	          <td>订单状态：</td>
	          <td><input id="bookStatus" name="bookStatus" class="mini-combobox" width="200" textName="" textField="text" valueField="id"
  				url="data/bookStatus.txt"  allowInput="false" showNullItem="true" nullItemText="全部订单"  value="12" onvaluechanged="loadgrid"/>
	          </td>
	   		<!--   <td align="right">客户：</td>
	          <td colspan="2"><input id="companyName" name="companyId" class="mini-buttonedit" width="100%" showClose="true" oncloseclick="onCloseClick('customer')"
            		onbuttonclick="onButtonEdit2" textName="companyName" required="false" value="" text="" onvaluechanged="loadgrid"  allowInput="false"/>
	          </td>
	          <td><input value="查找" type="button" onclick="loadgrid()" style="width:50px;"/></td> -->
	   		</tr>
	   	</table>
	   </form>
    
    
    
    <div id="bookOrder" class="mini-datagrid" style="width:100%;height:350px;" url="mybookOrder.action"  idField="id" onselectionchanged="onSelectionChanged"  selectOnLoad="true">
        <div property="columns">            
           <!--  <div name="action" width="50" headerAlign="center" align="center" renderer="onOperatePower"
                 cellStyle="padding:0;">预约设备
            </div> -->
            <div field="orderId" width="30" headerAlign="center" allowSort="true" align="center">订单编号
            </div>
            <div field="orderName" width="60" headerAlign="center" align="center">订单名称
            </div>
                        <div field="bookStatus" width="40" headerAlign="center" align="center" renderer="onGenderRenderer">订单状态
            </div>
            <div field="companyName" width="40" headerAlign="center" align="center">客户名称
            </div>
            <div field="connector" width="40" headerAlign="center" align="center">联系人
            </div>
            <div field="connectorTel" width="60" headerAlign="center" align="center" >联系人电话
            
            </div>
                         <div field="productNum" width="30" headerAlign="center" align="center" >数量
             </div>
                <div field="material" width="30" headerAlign="center" align="center" >材料
             </div>
            <div field="createTime" width="30" headerAlign="center" align="center"  dateFormat="yyyy-MM-dd HH:mm:ss" >创建时间
            </div>
             

             <!-- <div field="checkAdvice" width="50" headerAlign="center" align="center" >审核意见
            </div> -->
            <div field="option" width="60" headerAlign="center" align="center" renderer="onOperatePower1">操作
            
            </div>
           
        </div>
    </div> 
  
    <br />
    <div id="bookMachine" class="mini-datagrid" style="width:100%;height:430px;" url="myBookOrderMachine.action" onload="onLoad" pagesize="100">
        <div property="columns">            
       		<div field="unid" width="120" headerAlign="center" allowSort="true"  allowSort="true" align="center" headerAlign="center">预约编号</div> 
       
            <div name="machineName" field="machineName" width="120" headerAlign="center"  align="center" headerAlign="center">设备名称</div> 
            <div field="timeYmd" width="100" allowSort="true" align="center"  headerAlign="center" align="center">日期</div>               
            <div field="startTimeInfo" width="100"   align="center" headerAlign="center">开始时间</div>            
            <div field="endTimeInfo" width="100"  align="center" headerAlign="center">结束时间</div>
            <div field="totalTime" width="100"  align="center" headerAlign="center">设备预约时间/h</div>
              <div field="totalTime1" width="100"  align="center" headerAlign="center">预约总时间/h</div>
          
             <div field="isPass" width="120" headerAlign="center"  align="center" headerAlign="center" >预约审核是否通过</div>
             <div field="isPassAdvice" width="120" headerAlign="center"  align="center" headerAlign="center" >预约审核意见</div>
             <div field="staffName" width="120" headerAlign="center"  align="center" headerAlign="center" >审核人</div>
            <div field="option" width="100" headerAlign="center"  align="center" renderer="onOperatePower" >操作</div>                
        
    </div>      
     </div>  
   
    

    <script type="text/javascript">
        var Genders =[
			{id: "0", text: "已删除订单"},	
			{id: "11", text: "待预约"},
			{id: "12", text: "预约待审核"},
			{id: "12.5", text: "预约审核中"},
			{id: "13", text: "待上报"},
			{id: "14", text: "预约不通过"},
			{id: "15", text: "上报待审核"},
			{id: "17", text: "订单失效"},
			{id: "16", text: "订单完结"}
]
		var orderId="";
        $(function(){
        	

        	if("${param.status}"!=""){
        		mini.get('bookStatus').setValue("${param.status}");
        		loadgrid(); 	
        	}	

        	if("${param.pageIndex}"!=""&"${param.pageSize}"!=""){
        		var grid = mini.get("bookOrder");
        		pageNo=parseInt('${param.pageIndex}');
        		pageSize=parseInt('${param.pageSize}');
        		grid.gotoPage(pageNo,pageSize);   	
        	}	
        })
        mini.parse();

        var bookOrder = mini.get("bookOrder");
        var bookMachine = mini.get("bookMachine");
        
        bookOrder.load({bookStatus:"12"});
      

	    function onLoad(e) {
        var grid = e.sender;
        var len = grid.data.length;
        var i=0,num=1;
        //定义数组
        var marges=[];
        marges.push(
                {rowIndex: 0, columnIndex:6, rowSpan:len, colSpan: 0});

        for(i;i<len;i++){
                if(i==len-1 ){
               var k=i+1-num;
               //动态添加合并的参数，rowIndex开始行数(0开始)，columnIndex列数(0开始)，rowSpan合并的行数，colSpan合并的列数
              marges.push({rowIndex: k, columnIndex:1, rowSpan: num, colSpan: 0},
                          {rowIndex: k, columnIndex:5, rowSpan: num, colSpan: 0});

              num=1;
              grid.mergeCells(marges);
        continue;
        }
        //如果两个数的编号相等
        if(grid.data[i].machineName == grid.data[i+1].machineName){
        num++;  //作为计数的参数
        }
        //编号不相等的时候进行合并
        if( grid.data[i].machineName != grid.data[i+1].machineName){
        //取出要合并的行数，i从0开始
        var k=i+1-num; 
        //动态添加合并的参数
        marges.push({rowIndex: k, columnIndex:1, rowSpan: num, colSpan: 0},
                    {rowIndex: k, columnIndex:5, rowSpan: num, colSpan: 0});
        //清空num值
        num=1;
        }
        grid.mergeCells(marges);
    }

} 

        /* $(function(){         被抛弃的失效功能
        	$.ajax({
                type:"GET",
                data:null,
                url:"orderpanduan",
                
            });
        	
        	
        	
        }) */
        
        
        
/* 
        var menu = new ColumnsMenu(bookOrder);
        var menu2 = new ColumnsMenu(bookMachine); */
        ///////////////////////////////////////////////////////       
        /*
        
        bookOrder.load(data1,function(e){
		    if(e.data.length==0){
		         bookMachine.load()   传空参数，后台判断，如果没参数，那么就返回空数据
		    }
		})
        
        */
         
	    function loadgrid(){
	    	
	    	var form=new mini.Form("#form0");
	    	var data1 =form.getData();
	    	//alert(data1);
	    	/*  var bookStatus = mini.get("bookStatus").getValue();
	    	 var companyName = mini.get("companyName").getValue(); */
	    //	var data=mini.encode(data1);
	    	
	    	bookOrder.load(data1);
	    	/* $.ajax({
	    		url:"AuditingBookingOrder.action",
	    		type:"post",
	    		data:data,
	    		success:function(text){
	    			
	    			
	    		}
	    	}); */
	    }
         
	    function onOperatePower(e) {
	        var str = "";
	        str += "<span>";
	        str = "<a class='mini-button' iconCls=' icon-remove' style='margin-right:2px;' title='取消' href=javascript:bookDelete(\'" + e.row.unid+"\',\'"+e.row.bookStatus+ "\')>取消</a>";
	        str += "</span>";
	        //alert(e.row.staffCode);
	        return str;
	    }
        function onOperatePower1(e) {
        	/*  var grid = e.sender;
             var record = e.record;
             var uid = record._uid;
             var rowIndex = e.rowIndex; */
           
 	        
 	        
	        var str = "";
	        str += "<span>";
	        str += "<a class='mini-button' iconCls=' icon-remove' style='margin-right:2px;' title='取消订单' href=javascript:orderDelete(\'" + e.row._uid+"\',\'"+e.row.orderId+ "\',\'"+e.row.bookStatus+ "\')>删除</a>";
	        str += "</span>";
	        
	        str += "&nbsp;&nbsp;";
 	        str += "<span>";
 	        str += "<a class='mini-button' iconCls=' icon-remove' style='margin-right:2px;' title='图形界面查看预约信息' href=javascript:seeBooking(\'" + e.row._uid+"\',\'"+e.row.orderId+ "\',\'"+e.row.bookStatus+ "\')>查看</a>";
 	        str += "</span>";
	        
	        str += "&nbsp;&nbsp;";
	        str += "<span>";
	        str += "<a class='mini-button' iconCls=' icon-remove' style='margin-right:2px;' title='打印时刻表' href=javascript:orderPrint(\'" + e.row._uid+"\',\'"+e.row.orderId+ "\')>打印</a>";
	        str += "</span>";
	        
	        str += "&nbsp;&nbsp;";
	        str += "<span>";
	        str += "<a class='mini-button' iconCls=' icon-remove' style='margin-right:2px;' title='修改预约时段' href=javascript:modifyBooking(\'" + e.row._uid+"\',\'"+e.row.orderId+ "\',\'"+e.row.bookStatus+ "\',\'"+e.row.connector+ "\')>修改</a>";
	        str += "</span>";
	        //alert(e.row.staffCode);
	        return str;
	    }
        /* 查看预约信息 */
        function seeBooking(unid,orderId,bookStatus){
        	var grid=mini.get("bookOrder");
            pageIndex=grid.getPageIndex();
	        pageSize=grid.getPageSize();
	        var status=mini.get('bookStatus').getValue();
           
        	window.location="orderManage/seeOrderBooking.jsp?orderId="+orderId+"&pageSize="+pageSize+"&pageIndex="+pageIndex+"&status="+status;
    	   }
        
        
        function modifyBooking(unid,orderId,bookStatus,connector){
            /* alert(connector);  */
        	if(bookStatus==12.5){
        		U.msg("审核中，请联系管理员进行操作！");
         		return;
         	}
            if(bookStatus==13){
            	U.msg("审核已通过，请联系管理员进行操作！");
           		return;
           		
           	}
           	if(bookStatus==14){
           		U.msg("该订单已无效，请联系管理员进行操作！");
        		return;
           		
           	}
        	if(bookStatus>14){
              	 U.msg("该订单目前无法操作，请联系管理员进行操作！");
           		return;
              	}
        	$.ajax({
                type:"POST",
                url:"isCanBook.action",
                data: {},
                dataType: "json",
                success:function(data){
              	  if(data.result=="true"){
              			window.location="OrderSpecServlet?orderId=" + orderId+"&connector="+connector+"&isModify="+"3";
              		  }else{
              			U.msg("目前有订单逾期未上报，暂停预约修改功能！");
              			return;
              		  }
                } 
            });
        	
    	   }
    
        
        function orderPrint(unid,orderId){
     		
        	var row = bookOrder.getRowByUID(unid);
        	//alert(mini.encode(row));
        	/* var partsplanid = mini.get("partsPlanId").getValue(); */
			window.open("ResearchTask/printBarcodeBookOrder.jsp?orderId=" + row.orderId+"&companyName=" + row.companyName+"&connector=" + row.connector+"&connectorTel=" +row.connectorTel+"&createTime=" +row.createTime+"&bookStatus=" +row.bookStatus,
	                "editwindow","top=50,left=100,width=950px,height=400px,status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=yes");
			/*
			$.ajax({
        	type: "post",
            url: "PartsplanBarcode?partsplanid=" + partsplanid,
            cache: false,
            success: function (text) {
            	window.confirm(text);
            }
       });
       */
		}

        
        function orderDelete(unid,orderId,bookStatus){
           	/* alert(bookStatus); */
        	if(bookStatus==12.5){
         		 U.msg("审核中，请联系管理员进行操作！");
         		return;
         	}
           	if(bookStatus==13){
           		 U.msg("审核已通过，请联系管理员进行操作！");
           		return;
           		
           	}
           	if(bookStatus==14){
           	 U.msg("该订单已无效，请联系管理员进行操作！");
        		return;
           		
           	}
        	if(bookStatus>14){
              	 U.msg("该订单目前无法操作，请联系管理员进行操作！");
           		return;
              	}
        	var str;
        	if(bookStatus==0){
        		str="注意：订单删除不可恢复！您确定要删除订单吗？"
        	}else{
        		str="注意：订单删除的同时，预约信息也会一起删除！您确定要删除订单吗？"
        	}
        	layer.confirm(str, {
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                	$.ajax({
                        type:"POST",
                        url:"AuditingOrderDelete.action",
                       
                        
                        data: {orderId:orderId,bookStatus:bookStatus},
                        dataType: "json",
                        success:function(data){
                      	 // alert(data.result);
                      	  U.msg(data.result);
                      	//onSelectionChanged();
                      	  bookOrder.reload();
                      	 bookMachine.reload();
   			        // bookMachine.load({ orderId:orderId});
                      	
                        } ,
                        error:function(data){
                         U.msg(data.result);
                        } 
                    });}
               	,
                btn2: function (index, layero) {
                    layer.close(index);
                }
            })
    	   }
        
        function bookDelete(unid,bookStatus){
        	/* alert(bookStatus); */
        	
        	if(bookStatus==12.5){
          		 U.msg("审核中，请联系管理员进行操作！");
          		return;
          	}
        	if(bookStatus==13){
          		 U.msg("审核已通过，请联系管理员进行操作！");
          		return;
          	}
          	if(bookStatus==14){
          	 U.msg("该订单已无效，请联系管理员进行操作！");
       		return;
          		
          	}
       		if(bookStatus>14){
             	 U.msg("该订单目前无法操作，请联系管理员进行操作！");
          		return;
             	}
        	layer.confirm('您确定要删除预定吗？', {
                btn: ['确定', '取消'],
                yes: function (index, layero) {
                	$.ajax({
                        type:"POST",
                        url:"AuditingBookOrderDelete.action",
                       
                        
                        data: {unid:unid,orderId:orderId},
                        dataType: "json",
                        success:function(data){
                      	 // alert(data.result);
                      	  U.msg(data.result);
                      	//onSelectionChanged();
   			        	 
                      	 bookMachine.reload();
                        } ,
                        error:function(data){
                         U.msg(data.result);
                        } 
                    });}
               	,
                btn2: function (index, layero) {
                    layer.close(index);
                }
            })
    	   }
        
               function onGenderRenderer(e) {
            for (var i = 0, l = Genders.length; i < l; i++) {
                var g = Genders[i];
                if (g.id == e.value) return g.text;
            }
            return "";
        }
      


        function onSelectionChanged(e) {
        
            var grid = e.sender;
            var record = grid.getSelected();
            orderId=record.orderId;
            if (record) {
                bookMachine.load({ orderId: record.orderId,bookStatus:record.bookStatus,sign:"yuyue"});
            }
        }

        
    </script>



</body>
</html>

