package com.wl.testaction.taskCollection;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * Servlet implementation class GetStateservlet
 */
@WebServlet("/GetStateservlet")
public class GetStateservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStateservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	    int totalCount = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=df.format(new Date());
		String research="";
	    research="select machineid from machinfo";
	    String[] machineid=new String[200];
	    try {
	    	machineid = Sqlhelper.exeQueryStrings(research, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String statesql="";
		int count=0;
	    int i=0;
	    while(machineid[i]!=null) {
		statesql="select count(*) from bookinginfo where (is_pass='是'  or is_pass is null) and machineid='"+machineid[i]+"' and time_ymd>='"+date+"'";
	    try {
	    	count=Sqlhelper.exeQueryCountNum(statesql, null);
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    String updatesql="";
	    if(count==0) {
	    updatesql="update machinfo set futurestate=0 where machineid='"+machineid[i]+"'";
	    }else {
	    updatesql="update machinfo set futurestate=1 where machineid='"+machineid[i]+"'";	
	    }
	    try {
	    	Sqlhelper.executeUpdate_noclose(updatesql, null);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    i++;
	    totalCount++;
	    }
	    List<Machine> customerList = new ArrayList<Machine>();
	    String statesql1="select machineid,futurestate from machinfo";
		try {
			customerList=Sqlhelper.exeQueryList(statesql1, null,Machine.class);
		}catch(Exception e) {
			e.printStackTrace();
		}	 
	    String json = PluSoft.Utils.JSON.Encode(customerList);
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
