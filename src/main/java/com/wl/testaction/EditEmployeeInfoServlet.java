package com.wl.testaction;


import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.wl.tools.StringUtil;

import com.wl.forms.Employee;

import com.wl.tools.Sqlhelper;


public class EditEmployeeInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		int pageNo=0;
	    int countPerPage=10;
	    int totalCount = 0;
	    String orderStr = "STAFF_CODE";
	    orderStr = StringUtil.isNullOrEmpty(request.getParameter("sortField"))?orderStr:request.getParameter("sortField");
	    pageNo = Integer.parseInt(request.getParameter("pageIndex"))+1;
	    countPerPage = Integer.parseInt(request.getParameter("pageSize"));
	    
	    String section = "";
	    String workName = "";
	    String leave = "";
	    section = StringUtil.isNullOrEmpty(request.getParameter("section"))?section :request.getParameter("section");
	    workName = StringUtil.isNullOrEmpty(request.getParameter("workName"))?workName :request.getParameter("workName");
	   leave = StringUtil.isNullOrEmpty(request.getParameter("leave"))?leave :request.getParameter("leave");
	    String totalCountSql = "select count(*) from employee_info where staff_name like '%"+leave+"%'";
	    try {
			totalCount = Sqlhelper.exeQueryCountNum(totalCountSql, null);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	    String EmployeeSql= null;
	    HttpSession httpSession = ((HttpServletRequest)request).getSession(true);
	    EmployeeSql = 
	    	"select STAFF_CODE staffCode,STAFF_NAME staffName,SECTION_CODE sectionCode,GENDER,SCHOOL_FROM schoolFrom,ADDRESS,TECHNICAL_GRADE technicalGrade,BIRTHDAY," +
	    	"EDUCATION_LEVEL educationLevel,SPECIALITY,WORK_TYPE workType,OFFICE_PHNE officePhne,MOBILE_PHONE mobilePhone," +
	    	"HOME_PHONE homePhone,POSITION,WORKTIME,QQ,EMAIL,RFID_CODE RFIDCode,JOINTIME,FEE,LEAVETIME,IDCARD,C.DeptName sectionName " +
	    	"from (select A.*,ROWNUM row_num from (select EM.* from employee_info EM where staff_Name like '%"+workName+"%' and section_code like '%"+ section+"%'"+
	    	" order by STAFF_CODE asc) A where ROWNUM<="+(countPerPage*pageNo) +
	    			"order by STAFF_CODE) B " +
	    	"left join dept C on B.Section_Code=C.DeptId where row_num>="+((pageNo-1)*countPerPage+1)+" order by STAFF_CODE";
	    List<Employee> employeeList = new ArrayList<Employee>();
	    try {
			employeeList = Sqlhelper.exeQueryList(EmployeeSql, null, Employee.class);   
		} catch (Exception e) {
			e.printStackTrace();
		}
	    
	    String json = PluSoft.Utils.JSON.Encode(employeeList);
		json = "{\"total\":"+totalCount+",\"data\":"+json+"}";
		response.setCharacterEncoding("UTF-8");
		response.getWriter().append(json).flush();
		System.out.println(json);

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}













