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
 * Servlet implementation class Getdata1servlet
 */
@WebServlet("/Getdata1servlet")
public class Getdata1servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getdata1servlet() {
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
	    String totalCountSql = "select count(*) from machinfo ";
		try {
			totalCount = Sqlhelper.exeQueryCountNum(totalCountSql, null);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String drop1="";
		drop1="truncate table tempe";
		try {
			Sqlhelper.executeUpdate_noclose(drop1, null);
		}catch(Exception e){
			e.printStackTrace();
		}
	    String research="";
	    research="select machineid from machinfo where dept_id=0560 or dept_id=0561";
	    String[] machineid=new String[200];
	    try {
	    	machineid = Sqlhelper.exeQueryStrings(research, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    String CustomerSql= "";
	    CustomerSql = 
	    	"insert into tempe(select machineid,machinename,sumyuyuetime,sumcompletedtime from machinfo where dept_id=0560 or dept_id=0561)";
	    try {
			Sqlhelper.insert1(CustomerSql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int cout1=0;
		int cout2=0;
	    String cout1sql="";
		String cout2sql="";
		String updatesql1="";
	    int a=0;
	    while(machineid[a]!=null)
	    {
		cout1sql="select count(*) from bookinginfo where  passstate=3  and machineid='"+machineid[a]+"'";
		cout2sql="select count(*) from bookinginfo where  passstate>0 and passstate<4  and machineid='"+machineid[a]+"'";
		try {
			cout1=Sqlhelper.exeQueryCountNum(cout1sql,null);
			cout2=Sqlhelper.exeQueryCountNum(cout2sql,null);
		}catch(Exception e){
			e.printStackTrace();
		}    
		updatesql1="update tempe set sumyuyuetime='"+cout2+"',sumcompletedtime='"+cout1+"' where machineid='"+machineid[a]+"'";
		try {
			Sqlhelper.executeUpdate_noclose(updatesql1, null);
		}catch(Exception e){
			e.printStackTrace();
		}
			a++;
	    }
	    List<Machine> machinelist = new ArrayList<Machine>();
	    String manager="";
		manager="select  machinename,sumyuyuetime,sumcompletedtime from tempe ";
		try {
			machinelist=Sqlhelper.exeQueryList(manager, null,Machine.class);
		}catch(Exception e) {
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
