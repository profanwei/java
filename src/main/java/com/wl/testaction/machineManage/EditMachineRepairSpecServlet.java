package com.wl.testaction.machineManage;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cfmes.util.sql_data;

import com.wl.tools.ChineseCode;
public class EditMachineRepairSpecServlet extends HttpServlet {

	private static final long serialVersionUID = 2677624107788216049L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		String machineId = request.getParameter("machineId").trim();
		String machineName = request.getParameter("machineName").trim();
		String machineSpec = request.getParameter("machineSpec").trim();

		String outCode = request.getParameter("outCode").trim();
		
		String outDate = request.getParameter("outDate").trim();
		String machNum = request.getParameter("machNum").trim();
		String workRange =request.getParameter("workRange").trim();
		String machType = request.getParameter("machType").trim();
		String machModel = request.getParameter("machModel").trim();
		
		String machStandard = request.getParameter("machStandard").trim();
		String machManufacture = request.getParameter("machManufacture").trim();
		String usedYears = request.getParameter("usedYears").trim();
		String machPrice = request.getParameter("machPrice").trim();
		System.out.println("设备价格是"+machPrice);
		String machOldRate = request.getParameter("machOldRate").trim();
		
		String isKeyMach = request.getParameter("isKeyMach").trim();
		String buyDate = request.getParameter("buyDate").trim();
		System.out.println(buyDate);
	
		String status = request.getParameter("status").trim();
		String power = request.getParameter("power").trim();
		String deptId = request.getParameter("deptId");
		
		String runDate = request.getParameter("runDate");
		String worker = request.getParameter("worker");
		String madeDate = request.getParameter("madeDate");
		String checkDate = request.getParameter("checkTime");
		String memo = request.getParameter("memo");
		String hourPercent =request.getParameter("hourPercent");
		String countPercent=request.getParameter("countPercent");
		String sql = "update machinfo set machineName='"+machineName+"',machineSpec='"+machineSpec+"',outCode='"+outCode+"'," +
				"outDate=to_date('"+outDate+"','yyyy-mm-dd'),machNum='"+machNum+"',workRange='"+workRange+"',machType='"+machType+"',machModel='"+machModel+"'," +
				"machStandard='"+machStandard+"',machManufacture='"+machManufacture+"',usedYears='"+usedYears+"',machPrice='"+machPrice+"',machOldRate='"+machOldRate+"'," +
				"is_KeyMach='"+isKeyMach+"',buyDate=to_date('"+buyDate+"','YYYY-MM-DD'),status='"+status+"',power='"+power+"',dept_Id='"+deptId+"'," +
				"runDate=to_date('"+runDate+"','yyyy-mm-dd'),worker='"+worker+"',madeDate=to_date('"+madeDate+"','YYYY-MM-DD'),checkTime=to_date('"+checkDate+"','yyyy-mm-dd'),memo='"+memo+"' ," +
				"hourPercent='"+hourPercent+"',countPercent='"+countPercent+"'"+
				"where machineId='"+machineId+"'";
		System.out.println(sql);
		sql_data sqlData = new sql_data();
		try {
			sqlData.exeUpdateThrowExcep(sql);
			String json = "{\"result\":\"操作成功!\"}";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(json).flush();
		} catch (SQLException e) {
			String json = "{\"result\":\"操作失败!\"}";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(json).flush();
			e.printStackTrace();
		}
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}













