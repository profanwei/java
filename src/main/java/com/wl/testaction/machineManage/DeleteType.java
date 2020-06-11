package com.wl.testaction.machineManage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wl.tools.Sqlhelper;
import com.wl.tools.StringUtil;

/**
 * Servlet implementation class deleteType
 */
@WebServlet("/DeleteType")
public class DeleteType extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String machineType= request.getParameter("machineType");
        String sql="delete from machineType where machineType = '"+ machineType+"'";
		
		
		
      	String result= "操作成功";
    	try {
			Sqlhelper.executeUpdate(sql, null);
			System.out.println("ok  "+sql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result= "操作失败";
		}
		
		
		String json = "{\"result\":\""+result+"\"}";
		System.out.println(json);
		response.setCharacterEncoding("utf-8");
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
