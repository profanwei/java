package com.wl.testaction.taskCollection;

import java.io.IOException;
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
 * Servlet implementation class Getdataservlet
 */
@WebServlet("/Getdataservlet")
public class Getdataservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getdataservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(1);
		String sql="";
		String managername=StringUtil.isNullOrEmpty(request.getParameter("managername"))?"":request.getParameter("managername");
		System.out.println(managername);
		sql="select  machinename,sumyuyuetime,sumcompletedtime from tempb where machinemanagers like '%"+managername+"%'";
		List<Machine> machinelist = new ArrayList<Machine>();
		try {
		    machinelist = Sqlhelper.exeQueryList(sql, null,Machine.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String json = PluSoft.Utils.JSON.Encode(machinelist);
		System.out.println(json);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(json).flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
