package com.wl.testaction;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.wl.forms.Employee;
import com.wl.tools.Sqlhelper;
import com.wl.tools.StringUtil;


public class EditEmployeeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 4697195515623837591L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	    
	    String staffCode = request.getParameter("staffCode");
	
		String	EmployeeSql = 
		    	"select STAFF_CODE staffCode,STAFF_NAME staffName,SECTION_CODE sectionCode,GENDER,SCHOOL_FROM schoolFrom,ADDRESS,TECHNICAL_GRADE technicalGrade,BIRTHDAY," +
		    	"EDUCATION_LEVEL educationLevel,SPECIALITY,WORK_TYPE workType,OFFICE_PHNE officePhne,MOBILE_PHONE mobilePhone,HOME_PHONE homePhone," +
		    	"POSITION,WORKTIME,QQ,EMAIL,RFID_CODE RFIDCode,JOINTIME,FEE,LEAVETIME,IDCARD,B.deptname sectionname " +
		    	"from employee_info A " +
		    	"left join dept B on A.section_CODE=B.deptId "+
		    	"where staff_Code=? ";
		String[] params = {staffCode};
		Employee employee = new Employee();
		
		try {
			employee = Sqlhelper.exeQueryBean(EmployeeSql, params, Employee.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("employee", employee);
		

		String para = "";
		String toUrl ="employeeManage/editEmployee.jsp";
		try {
			para = StringUtil.isNullOrEmpty(request.getParameter("para"))?para:request.getParameter("para");
			if(para.equals("seeEmp")){
				toUrl="employeeManage/seeEmployee.jsp";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		request.getRequestDispatcher(toUrl).forward(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doGet(request,response);
	}
}













