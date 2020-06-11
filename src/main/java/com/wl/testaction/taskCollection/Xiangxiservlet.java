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
 * Servlet implementation class Xiangxiservlet
 */
@WebServlet("/Xiangxiservlet")
public class Xiangxiservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Xiangxiservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int pageNo=0;
		String page="";
		 page = StringUtil.isNullOrEmpty(request.getParameter("pageIndex"))?"0":request.getParameter("pageIndex");
		pageNo = Integer.parseInt(page)+1;
		System.out.println(pageNo);
		String eday=StringUtil.isNullOrEmpty(request.getParameter("eday"))?"0":request.getParameter("eday");
		String bday=StringUtil.isNullOrEmpty(request.getParameter("bday"))?"0":request.getParameter("bday");
		String managername=StringUtil.isNullOrEmpty(request.getParameter("managername"))?"":request.getParameter("managername");
		String machineid=request.getParameter("machineId");
		System.out.println(bday);
		System.out.println(eday);
		String drop1="";
		String drop2="";
		drop2="delete from tempd";
	    drop1="delete from tempc";
		try {
			Sqlhelper.executeUpdate_noclose(drop1, null);
			Sqlhelper.executeUpdate_noclose(drop2, null);
		}catch(Exception e){
			e.printStackTrace();
		}
	    String DetailSql1="";
	    DetailSql1="insert into tempd (select distinct bookingusername,yujishiyong,shijishiyong "
	    		+ "from bookinginfo where machineid='"+machineid+"')";
	    try {
			Sqlhelper.insert1(DetailSql1);
		} catch (Exception e) {
			e.printStackTrace();
		}	    
	    String research="";
	    research="select distinct bookingusername from bookinginfo where machineid='"+machineid+"'";
	    String[] workname1=new String[1000];
	    try {
	    	workname1 = Sqlhelper.exeQueryStrings(research, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    String OrderSql="";
	    OrderSql="insert into tempc "
	    		+ "(select orderid,B.machineid,machinename,B.createtime,book_status,bookingusername,yujishiyong,shijishiyong,passstate "
	    		+ "from (select orderid,A.machineid,machinename,createtime,bookingusername,yujishiyong,shijishiyong,passstate "
	    		+ "from bookinginfo A left join machinfo on machinfo.machineid=A.machineid) B "
	    		+ "left join orders on B.orderid=orders.order_id "
	    		+ "where B.createtime>='"+bday+"' and B.createtime<='"+eday+"')" ;
	    try {
			Sqlhelper.insert1(OrderSql);
		}catch(Exception e){
			e.printStackTrace();
		}
	    int a=0;
	    String cout1sql="";
	    String cout2sql="";
	    int cout1=0;
	    int cout2=0;
	    while(workname1[a]!=null)
	    {
	    	if(eday==null || bday==null) {
		    cout1sql="select count(*) from tempc "
		    		+ "where  machineid='"+machineid+"' and bookingusername='"+workname1[a]+"' and book_status>=13 ";
		    cout2sql="select count(*) from tempc "
		    		+ "where  machineid='"+machineid+"' and bookingusername='"+workname1[a]+"' and (book_status=16 or passstate=3) ";
		    try {
		    	cout1= Sqlhelper.exeQueryCountNum(cout1sql, null);
		    	cout2= Sqlhelper.exeQueryCountNum(cout2sql, null);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	}else {
	    	cout1sql="select count(*) from bookinginfo where bookingusername='"+workname1[a]+"' and machineid='"+machineid+"' and is_pass='是' ";
			cout2sql="select count(*) from bookinginfo where bookingusername='"+workname1[a]+"' and machineid='"+machineid+"' and is_pass='是' and passstate=3";
			try {
				cout1=Sqlhelper.exeQueryCountNum(cout1sql,null);
				cout2=Sqlhelper.exeQueryCountNum(cout2sql,null);
			}catch(Exception e){
				e.printStackTrace();
			}
				
			}	    
	    String update1="";
	    update1="update  tempd set yujishiyong='"+cout1+"',shijishiyong='"+cout2+"' where workname='"+workname1[a]+"'";
	    try {
	    	Sqlhelper.executeUpdate_noclose(update1, null);
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    a++;
	    }
		/*
		 * request.setAttribute("bday", bday); request.setAttribute("eday", eday);
		 * request.setAttribute("managername", managername);
		 * request.setAttribute("pageNo", pageNo);
		 */
	    request.getRequestDispatcher("taskCollection/detail.jsp").forward(request, response);
		}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
