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

import com.mchange.lang.ArrayUtils;
import com.mchange.v1.cachedstore.WritableCachedStore.Manager;
import com.mysql.jdbc.StringUtils;
import com.wl.forms.Machine;
import com.wl.forms.Order;
import com.wl.tools.Sqlhelper;
import com.wl.tools.StringUtil;
/**
 * Servlet implementation class Yuyuewanjieservlet
 */
@WebServlet("/Yuyuewanjieservlet")
public class Yuyuewanjieservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Yuyuewanjieservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	    String bday=StringUtil.isNullOrEmpty(request.getParameter("bday"))?"1000-00-00":request.getParameter("bday");
		String eday=StringUtil.isNullOrEmpty(request.getParameter("eday"))?"9999-99-99":request.getParameter("eday");
		int pageNo=0;
	    int countPerPage=10;
	    int totalCount = 0;
	    String orderStr = "MACHINEID";
	    orderStr = StringUtil.isNullOrEmpty(request.getParameter("sortField"))?orderStr:request.getParameter("sortField");
	    String page="";
	    String pagesize="";
	    page = StringUtil.isNullOrEmpty(request.getParameter("pageIndex"))?"0":request.getParameter("pageIndex");
	    pageNo = Integer.parseInt(page)+1;
	    pagesize = StringUtil.isNullOrEmpty(request.getParameter("pageSize"))?"10":request.getParameter("pageSize");
	    countPerPage = Integer.parseInt(pagesize);
		String manager="";
		String managername=StringUtil.isNullOrEmpty(request.getParameter("managername"))?"":request.getParameter("managername");
	    String research="";
	    research="select machineid from machinfo";
	    String[] machineid=new String[200];
	    try {
	    	machineid = Sqlhelper.exeQueryStrings(research, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String drop1="";
		String drop2="";
		drop1="delete from tempb";
		drop2="delete from tempa";
		try {
			Sqlhelper.executeUpdate_noclose(drop1, null);
			Sqlhelper.executeUpdate_noclose(drop2, null);
		}catch(Exception e){
			e.printStackTrace();
		}
	    String CustomerSql= "";
	    CustomerSql = 
	    	"insert into tempb (select machinemanagers,machineId,machineName,sumyuyuetime,sumcompletedtime from (select machinemanagers,machineId,machineName,sumyuyuetime,sumcompletedtime " +
	    	"from (select A.* from (select EM.* from machinfo EM order by "+orderStr+" asc) A  order by "+orderStr+") B " +
	    	    	"left join machineType MT on MT.machineType=B.machType " +
	    	    	" order by "+orderStr+"))";
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
	    String OrderSql="";
	    OrderSql="insert into tempa "
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
	    while(machineid[a]!=null)
	    {
	    CustomerSql="select distinct machine_manager from machinemanager where machine_id='"+machineid[a]+"'";
	    String machinemanager = "";
	    String[] str=new String[20];
	    try {
	    	str = Sqlhelper.exeQueryStrings(CustomerSql, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    int i=0;
	    while(str[i]!=null) {
	    	machinemanager+=str[i];
	    	if(str[i+1]!=null)
	    	{
	    		machinemanager+=",";
	    	}
	    	i++;
	    }
	    System.out.println(machinemanager);
	    CustomerSql="update tempb set machinemanagers='"+machinemanager+"' where machineid='"+machineid[a]+"' ";
	    try {
			Sqlhelper.executeUpdate_noclose(CustomerSql, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		cout1sql="select count(*) from tempa where (book_status=16 or passstate=3) and machineid='"+machineid[a]+"'";
		cout2sql="select count(*) from tempa where book_status>=13  and machineid='"+machineid[a]+"'";
		try {
			cout1=Sqlhelper.exeQueryCountNum(cout1sql,null);
			cout2=Sqlhelper.exeQueryCountNum(cout2sql,null);
		}catch(Exception e){
			e.printStackTrace();
		}
		updatesql1="update machinfo set sumyuyuetime='"+cout2+"',sumcompletedtime='"+cout1+"' where machineid='"+machineid[a]+"'";
		try {
			Sqlhelper.executeUpdate_noclose(updatesql1, null);
		}catch(Exception e){
			e.printStackTrace();
		}
			a++;
	    }
	    String totalCountSql = "select count(*) from tempb where NVL(machinemanagers,0) like '%"+managername+"%' ";
			try {
				totalCount = Sqlhelper.exeQueryCountNum(totalCountSql, null);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
	    List<Machine> customerList = new ArrayList<Machine>();
	    System.out.println(managername);
		manager="select * " +
	    	"from (select A.*,ROWNUM row_num from (select EM.* from tempb EM where NVL(machinemanagers,0) like '%"+managername+"%' order by "+orderStr+" asc) A where ROWNUM<="+(countPerPage*pageNo)+"  order by "+orderStr+")  " +
	    	"where row_num>="+((pageNo-1)*countPerPage+1)+" order by "+orderStr;
		try {
			customerList=Sqlhelper.exeQueryList(manager, null,Machine.class);
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
