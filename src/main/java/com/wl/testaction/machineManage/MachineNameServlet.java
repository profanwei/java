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

import com.wl.forms.Machine;
import com.wl.tools.Sqlhelper;

/**
 * Servlet implementation class MachineNameServlet
 */
@WebServlet("/MachineNameServlet")
public class MachineNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		// TODO Auto-generated method stub
		List<Machine> list=new ArrayList();
	String sql="select machineid id,machinename text from machinfo";		
		 try {
			list=Sqlhelper.returnMachine(sql);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		  String json = PluSoft.Utils.JSON.Encode(list);
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
