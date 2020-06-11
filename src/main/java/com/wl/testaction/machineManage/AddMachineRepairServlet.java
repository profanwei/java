package com.wl.testaction.machineManage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cfmes.util.sql_data;

import com.wl.tools.ChineseCode;
import com.wl.tools.JdbcUtilsC3P0;
import com.wl.tools.Sqlhelper;
import com.wl.tools.UUIDHexGenerator;

public class AddMachineRepairServlet extends HttpServlet {

	private static final long serialVersionUID = 4262585196632425947L;
	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet res;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String machineId = request.getParameter("machineId").trim();
//		String repairPart = ChineseCode.toUTF8(request.getParameter("repairPart").trim());

		String startDate = request.getParameter("startDate").trim().substring(0, 10);
		String endDate = request.getParameter("endDate").trim().substring(0, 10);
//		String repairPrice = request.getParameter("repairPrice").trim();
		String principal = request.getParameter("principal").trim();
		String repairDetail = request.getParameter("repairDetail");
		String memo = request.getParameter("memo");
		System.out.println(startDate);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String createTime = df.format(new Date());// new Date()为获取当前系统时间

		String sqll = "select to_date(startDate,'yyyy-mm-dd') S,to_date(endDate,'yyyy-mm-dd') E" + " from machineRepair"
				+ " where machineid='" + machineId + "'AND repairState='" + "是'";

		try {
			conn = JdbcUtilsC3P0.getConnection();
			ps = conn.prepareStatement(sqll);
			res = ps.executeQuery();

			try {
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date start = formatter.parse(startDate);
				System.out.println(start);
				Date end = formatter.parse(endDate);
				while (res.next()) {
					Date St = res.getDate("S");
					Date En = res.getDate("E");
					if (start.before(En) || start.equals(En)) {
						String json = "{\"result\":\"该时间段已报修!\"}";
						response.setCharacterEncoding("UTF-8");
						response.getWriter().append(json).flush();
						Sqlhelper.close(conn, ps, null);
						return;
					}

				}

			} catch (ParseException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Sqlhelper.close(conn, ps, res);
		}

		/*
		 * try { startDate = df.format(df.parse(startDate)); endDate
		 * =df.format(df.parse(endDate)); } catch (ParseException e1) { // TODO
		 * Auto-generated catch block e1.printStackTrace(); }
		 */

		String UUID = UUIDHexGenerator.getInstance().generate();
		String sql = "insert into machineRepair "
				+ "(mainId,machineId,startDate,endDate,createtime,repairDetail,principal,memo,repairState)" + "values('"
				+ UUID + "','" + machineId + "','" + startDate + "','" + endDate + "'" + ",'" + createTime + "','"
				+ repairDetail + "','" + principal + "','" + memo + "','" + "是" + "') ";
		System.out.println("sql==" + sql);
		try {
			Sqlhelper.executeUpdate(sql, null);
		} catch (SQLException e) {
			e.printStackTrace();
			String json = "{\"result\":\"操作失败!\"}";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(json).flush();
		}
		String json = "{\"result\":\"操作成功!\"}";
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(json).flush();
		System.out.println(json);

		/*
		 * String updatesql = "insert into machineRepair " +
		 * "(mainId,machineId,repairFactory,errorDate,repairDate,repairPrice,principal,repairDetail,memo)"
		 * +
		 * "values('"+UUID+"','"+machineId+"','"+repairFactory+"',to_date('"+errorDate+
		 * "','yyyy-mm-dd,hh24:mi:ss'),to_date('"+repairDate+
		 * "','yyyy-mm-dd,hh24:mi:ss')," +
		 * "'"+repairPrice+"','"+principal+"','"+repairDetail+"','"+memo+"') ";
		 */

	}

}
