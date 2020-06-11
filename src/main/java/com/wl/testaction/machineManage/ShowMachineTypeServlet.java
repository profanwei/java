package com.wl.testaction.machineManage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wl.forms.MachType;
import com.wl.tools.Sqlhelper;

/**
 * Servlet implementation class ShowMachineTypeServlet
 */

public class ShowMachineTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1111);
		int pageNo = 0;
		int countPerPage = 10;
		int totalCount = 0;
		pageNo = Integer.parseInt(request.getParameter("pageIndex")) + 1;
		countPerPage = Integer.parseInt(request.getParameter("pageSize"));
		String totalsql = "select count(*) from machineType";
		try {
			totalCount = Sqlhelper.exeQueryCountNum(totalsql, null);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql = "select  A.* from (select machineType,typeName,ROWNUM row_num from machineType  where ROWNUM<="+(countPerPage*pageNo)+") A where row_num>="+((pageNo-1)*countPerPage+1);
		List<MachType> resultList = new ArrayList<MachType>();

		try {
			resultList = Sqlhelper.exeQueryList(sql, null, MachType.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String json = PluSoft.Utils.JSON.Encode(resultList);
		json = "{\"total\":"+totalCount+",\"data\":"+json+"}";
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(json).flush();
		System.out.println(json);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
