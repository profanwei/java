package com.wl.testaction.taskCollection;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wl.forms.Machine;
import com.wl.tools.Sqlhelper;
import com.wl.tools.StringUtil;

/**
 * Servlet implementation class Xiangxi1servlet
 */
@WebServlet("/Xiangxi1servlet")
public class Xiangxi1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xiangxi1servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageNo=0;
	    int countPerPage=10;
	    String orderStr = "MACHINEID";
	    orderStr = StringUtil.isNullOrEmpty(request.getParameter("sortField"))?orderStr:request.getParameter("sortField");
	    String page="";
	    String pagesize="";
	    page = StringUtil.isNullOrEmpty(request.getParameter("pageIndex"))?"0":request.getParameter("pageIndex");
	    pageNo = Integer.parseInt(page)+1;
	    pagesize = StringUtil.isNullOrEmpty(request.getParameter("pageSize"))?"10":request.getParameter("pageSize");
	    countPerPage = Integer.parseInt(pagesize);
		String workname2="";
		int totalCount=0;
		String workname=StringUtil.isNullOrEmpty(request.getParameter("workname"))?"":request.getParameter("workname");
		 String totalCountSql = "select count(*) from tempd where NVL(workname,0) like '%"+workname+"%' ";
			try {
				totalCount = Sqlhelper.exeQueryCountNum(totalCountSql, null);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		List<Machine> customerList = new ArrayList<Machine>();
		workname2="select * from (select A.*,ROWNUM row_num from TEMPD A where ROWNUM<="+(countPerPage*pageNo)+") "
				+ "where NVL(workname,0) like '%"+workname+"%' and row_num>="+((pageNo-1)*countPerPage+1)+"";
		try {
			customerList=Sqlhelper.exeQueryList(workname2, null,Machine.class);
		}catch(Exception e) {
			e.printStackTrace();
		}	
			String json = PluSoft.Utils.JSON.Encode(customerList);
			json = "{\"total\":"+totalCount+",\"data\":"+json+"}";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().append(json).flush();
			System.out.println(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
