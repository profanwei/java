package com.wl.testaction.machineManage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wl.tools.StringUtil;
import com.wl.forms.MachineRepair;
import com.wl.tools.Sqlhelper;

public class MachineRepairListServlet extends HttpServlet {

	private static final long serialVersionUID = 6768627425357375823L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		int pageNo=0;
	    int countPerPage=10;
	    int totalCount = 0;
	    String orderStr = "createtime";
	    orderStr = StringUtil.isNullOrEmpty(request.getParameter("sortField"))?orderStr:request.getParameter("sortField");
	    pageNo = Integer.parseInt(request.getParameter("pageIndex"))+1;
	    countPerPage = Integer.parseInt(request.getParameter("pageSize"));
	    String machineName=StringUtil.isNullOrEmpty(request.getParameter("machineName"))?"":request.getParameter("machineName");
	    String start=StringUtil.isNullOrEmpty(request.getParameter("start"))?"0000-01-01":request.getParameter("start");
	    String end=StringUtil.isNullOrEmpty(request.getParameter("end"))?"9999-12-30":request.getParameter("end");
	    System.out.println(start);
	    String totalCountSql = "select count(*) from machineRepair where   machineid like '%"+machineName+"%'and (startDate between  '"+ start +"' and '"+end+"' or endDate between  '"+start+"'  and  '"+end+"' )";
		try {
			totalCount = Sqlhelper.exeQueryCountNum(totalCountSql, null);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
	    String CustomerSql= "";
	    CustomerSql = 
	    	"select B.*,E.staff_name staffName,F.machineName " +
	    	"from (select A.*,ROWNUM row_num from (select EM.* from machineRepair EM where   machineid like '%"+machineName+"%' and (startDate between  '"+ start +"' and '"+end+"' or endDate between  '"+start+"'  and  '"+end+"' or ( startDate < '"+start+"' and endDate >'"+end+"' ))   order by "+orderStr+" desc) A where ROWNUM<="+(countPerPage*pageNo)+"  order by "+orderStr+" desc) B " +
	    	"left join employee_info E ON E.staff_code=B.principal " +
	    	"left join machinfo F ON F.machineID=B.machineID " +
	    	"where row_num>="+((pageNo-1)*countPerPage+1)+" order by "+orderStr+" desc";
	    
	    List<MachineRepair> customerList = new ArrayList<MachineRepair>();
	    
	    try {
			customerList = Sqlhelper.exeQueryList(CustomerSql, null, MachineRepair.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    for(Object machinerepair:customerList) {
	    	MachineRepair mr=(MachineRepair)machinerepair;
	    	if(mr.getRepairState().equals("是")) {
	    		mr.setRepairState("故障中");
	    	}else {
	    		mr.setRepairState("已修好");
	    	}
	   
	    	if(mr.getEndDate().equals("9999-12-30")) {
	    		mr.setEndDate("");
	    	}
	    	 
	    }
	    
	    String json = PluSoft.Utils.JSON.Encode(customerList);
	    
		json = "{\"total\":"+totalCount+",\"data\":"+json+"}";
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(json).flush();
		System.out.println(json);
		
	    
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}













