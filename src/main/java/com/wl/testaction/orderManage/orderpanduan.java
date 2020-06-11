package com.wl.testaction.orderManage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wl.tools.JdbcUtilsC3P0;
import com.wl.tools.Sqlhelper;
import com.wl.tools.UUIDHexGenerator;
import com.wl.forms.User;

/**
 * Servlet implementation class orderpanduan
 */
@WebServlet("/orderpanduan")
public class orderpanduan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet res;
	
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		String createtime = df.format(new Date());// new Date()为获取当前系统时间
		HttpSession session = request.getSession();
		String staffCode=((User)session.getAttribute("user")).getStaffCode();
         System.out.println("staffcode是"+staffCode);	
		String sqll = "select b.orderid,max(to_date(b.time_ymd,'yyyy-MM-dd')) tt from orders o left join bookinginfo b on (o.order_id=b.orderid) where o.book_status in(12,12.5) and createperson='"+staffCode+"'group by b.orderid ";
		
		try {
			conn = JdbcUtilsC3P0.getConnection();
			ps = conn.prepareStatement(sqll);
			res = ps.executeQuery();

			try {
				Date now = df.parse(createtime);
				while (res.next()) {
			String	orderid=	res.getString("orderid");
		
			Date date=res.getDate("tt");
					if (date.before(now) ) {
					String sql2="update orders set book_status='17' where  order_id='"+orderid+"'";
					
					System.out.println(sql2);
					String []params=null;
					try {
						Sqlhelper.executeUpdate_noclose(sql2,params);
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
					
					}
					
				}

			} catch (ParseException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Sqlhelper.close(conn, ps, res);
		}

    return;
	

	}

		
		
		
		
		
		
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
