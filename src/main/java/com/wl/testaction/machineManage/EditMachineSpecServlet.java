package com.wl.testaction.machineManage;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cfmes.util.sql_data;

import com.wl.tools.ChineseCode;
import com.wl.tools.Sqlhelper;
public class EditMachineSpecServlet extends HttpServlet {

	private static final long serialVersionUID = 2677624107788216049L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		String machineId = ChineseCode.toUTF8(request.getParameter("machineId").trim());
//		String repairPart = ChineseCode.toUTF8(request.getParameter("repairPart").trim());
		//String repairFactory = "";
		String startDate = ChineseCode.toUTF8(request.getParameter("startDate").trim()).substring(0,10);;
		String endDate = ChineseCode.toUTF8(request.getParameter("endDate").trim()).substring(0,10);;
		//String repairPrice = ChineseCode.toUTF8(request.getParameter("repairPrice").trim());
		String principal = ChineseCode.toUTF8(request.getParameter("principal").trim());
		String repairDetail = request.getParameter("repairDetail");
		String memo = request.getParameter("memo");
		String mainId = request.getParameter("mainId");
		String	updateSql = "update MACHINEREPAIR t set t.repairState='否' where t.mainId='"+mainId+"'";
		String json = "{\"result\":\"操作成功!\"}";
		try {
			Sqlhelper.executeUpdate(updateSql, null);
		} catch (Exception e) {
			e.printStackTrace();
			
			 json = "{\"result\":\"操作失败!\"}";
			
		}
		
		String sql = "update machineRepair set " +
				
				"startDate='"+startDate+"',endDate='"+endDate+"'," +
				"principal='"+principal+"',repairDetail='"+repairDetail+"',memo='"+memo+"' " +
				"where mainId='"+mainId+"'";
		System.out.println(sql);
		
		sql_data sqlData = new sql_data();
		try {
			sqlData.exeUpdateThrowExcep(sql);
			if(json!="{\"result\":\"操作失败!\"}") {
			 json = "{\"result\":\"操作成功!\"}";
					 }else {
						 json = "{\"result\":\"操作失败!\"}";
					 }
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(json).flush();
			
		} catch (SQLException e) {
			 json = "{\"result\":\"操作失败!\"}";
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













