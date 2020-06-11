package mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fw.tools.MachineGante;
import com.wl.forms.Customer;
import com.wl.forms.Dept;
import com.wl.forms.Machine;
import com.wl.forms.Order;
import com.wl.forms.OrdersMachinesAudits;

import javaBean.BookOrderMachine;
import javaBean.machBookDatelines;

public interface BookOrderMapper {
	
	public List<Order> selectBookOrderList(@Param("orderId") String orderId,@Param("staffCode") String staffCode,@Param("bookStatus")  String bookStatus,@Param("companyId")  String companyId,@Param("companyName")  String companyName) ;
	
	public List<Order> selectBookOrderList11(@Param("orderId") String orderId,@Param("staffCode") String staffCode,@Param("bookStatus")  String bookStatus,@Param("companyId")  String companyId,@Param("companyName")  String companyName) ;
	public Machine selectMaxOrder(@Param("begin") String begin,@Param("end") String end) ;
	public Machine selectMaxDept(@Param("begin") String begin,@Param("end") String end) ;
	public MachineGante returnGante(@Param("date") String date,@Param("dt") String dt) ;
	public MachineGante returnGanteFanuc(@Param("date") String date,@Param("dt") String dt) ;

	/**
	 * @param staffCode
	 * @param bookStatus
	 * @return
	 * 这个是针对设备管理员审核的查询！
	 */
	public List<Order> selectBookOrderList1(@Param("staffCode") String staffCode, @Param("bookStatus") String bookStatus);
	
	
	public List<Order> selectBookOrderListToo(@Param("orderId") String orderId,@Param("staffCode") String staffCode,@Param("bookStatus")  String bookStatus,@Param("companyId")  String companyId,@Param("companyName")  String companyName) ;
	public int selectBookOrderCount(@Param("staffCode") String staffCode);

	public List<BookOrderMachine> selectBookOrderMachineListByOrderId(@Param("orderId") String orderId);
	public List<BookOrderMachine> selectBookOrderMachineListByOrderId3(@Param("orderId") String orderId);
	public List<BookOrderMachine> selectBookOrderMachineListByOrderId2(@Param("orderId") String orderId);

	public int updateAuditingBookStatus(@Param("bookStatus") String bookStatus,@Param("auditingStaffCode") String staffCode,@Param("checkAdvice") String checkAdvice,@Param("orderId") String orderId);
	/**
	 * @param unid
	 * @return
	 */
	public int deleteAuditingBookOrderMapper(@Param("unid") String unid,@Param("orderId") String orderId);
	/**
	 * @param orderId
	 * @return
	 * 这个两个表示，当删除订单的时候，就会把相应的预约信息一块删除！应该使用事务回滚，但是我没有使用，还不会
	 */
	public int deleteAuditingOrderMapper(@Param("orderId") String orderId);
	/**
	 * @param orderId
	 * @return
	 * 这个两个表示，当删除订单的时候，就会把相应的预约信息一块删除！应该使用事务回滚，但是我没有使用，还不会
	 */
	public int deleteOrder(@Param("orderId") String orderId);
	/**
	 * @param unid
	 * @return
	 */
	public String selectTime(@Param("orderId") String orderId);
	/**
	 * @param unid
	 * @return
	 */
	public int selectNum(@Param("orderId") String orderId);
	public int deleteAuditingOrderbookingInfoMapper(@Param("orderId") String orderId);
	public List<Machine> getMach();
	/**
	 * @param orderId
	 * @return
	 */
	public Order AuditingBookUpdateStatusMapper(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public List<OrdersMachinesAudits> AuditingBookUpdateStatusMapper1(String orderId);
	/**
	 * @param orderId
	 * @param customer
	 * @param connector
	 * @param connectorTel
	 * @param productName
	 * @param productNum
	 * @param material
	 * @return
	 */
	public int insertAddShiYanOrder(@Param("orderId") String orderId, @Param("customer") String customer,@Param("connector")  String connector,@Param("connectorTel")  String connectorTel,
			@Param("orderName") String orderName, @Param("productNum") String productNum,@Param("material")  String material,@Param("createTime") String createTime,@Param("staffCode") String staffCode,@Param("bookOrderStatus") String bookOrderStatus);
	/**
	 * @param staffCode
	 * @return
	 */
	public Customer loadDefaultShiYanOrder(String staffCode);
	/**
	 * @param machineId
	 * @param deptId
	 * @return
	 */
	public ArrayList<machBookDatelines> loadListByOrderMachineInfoMapper(@Param("machineId") String machineId,@Param("deptId") String deptId);
	/**
	 * @param orderId
	 * @return
	 */
	public int noPassDeleteAuditingBookOrderMapper(String orderId);
	public int noPassDeleteAuditingBookOrderMapper13(@Param("orderId") String orderId,@Param("machineId") String machineId);
	/**
	 * @param unid
	 * @return
	 */
	public void deleteSelectedBookingInfoByAudit(String unid);
	/**
	 * @param unid
	 * @return
	 */
	public int deleteSelectedBookingInfo(String unid);
	/**
	 * @param orderId
	 * @return
	 */
	public List<BookOrderMachine> completedBookMapper(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public List<BookOrderMachine> completedBookMapper11(String orderId);
	/**
	 * @param hashMap
	 */
	public void saveCompletedBookingInfoMapper(HashMap<String, String> hashMap);
	/**
	 * @param hashMap
	 */
	public void updatebookinginfo(HashMap<String, String> hashMap);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo1(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo2(String orderId);
	/**
	 * @param hashMap
	 */
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo3(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo4(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo5(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo6(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo7(String orderId);
	/**
	 * @param orderId
	 * @return
	 */
	public void updatebookinginfo8(String orderId);
	
	public void saveCompletedBookingInfoMapper1(HashMap<String, String> hashMap);
	/**
	 * @param hashMap
	 */
	public void saveCompletedBookingInfo(HashMap<String, String> hashMap);
	/**
	 * @param hashMap
	 */
	public void saveCompletedBookingInfo2(HashMap<String, String> hashMap);
	/**
	 * @param orderId
	 */
	public void deleteCompletedBookingInfoMapper(String orderId);
	/**
	 * @param orderId
	 * @Description 这个是针对的更新orders的状态值
	 */
	public void updateCompletedOrderInfoMapper(@Param("bookStatus") String bookStatus,@Param("orderId") String orderId);
	/**
	 * @param staffCode
	 * @param orderId
	 * 用来对应#{}
	 *  用于插入完工审核人的信息
	 */
	public void insertCompletedAuditerInfoMapper(@Param("staffCode") String staffCode,@Param("orderId") String orderId,@Param("completedAdvice") String completedAdvice);
	

	
	/**
	 * @param orderId
	 * @param completedAdvice
	 * @param bookStatus
	 * 这个是更新最终的确认的信息的！
	 * @param staffCode 
	 */
	public void completedOrderAuditMapper(@Param("orderId") String orderId,@Param("completedAdvice") String completedAdvice,@Param("bookStatus") String bookStatus,@Param("staffCode") String staffCode);
	/**
	 * @param orderId
	 * @param completedAdvice
	 * @param bookStatus
	 * 这个是更新审核过一部分
	 * @param staffCode 
	 */
	public void completedOrderAuditMapper1(@Param("orderId") String orderId,@Param("completedAdvice") String completedAdvice,@Param("bookStatus") String bookStatus,@Param("staffCode") String staffCode);
	
	/**
	 * @param systemTime
	 * @param staffCode
	 * @return
	 */
	public int isCanBookMapper(@Param("systemTime") String systemTime, @Param("staffCode") String staffCode);
	
	public int selectpanduan(HashMap<String, String> hashMap);
	

	/**
	 * @param orderId
	 * @param staffCode
	 * @return
	 */
	public List<BookOrderMachine> selectBookOrderMachineListByOrderId1(@Param("orderId") String orderId,@Param("staffCode") String staffCode);
 

	/**
	 * @param orderId
	 * @param staffCode
	 * @return
	 */
	public List<Machine> updateAuditsMapper(@Param("orderId") String orderId,@Param("staffCode")  String staffCode);
	/**
	 * @param deptId
	 * @return
	 */
	public List<Machine> returnmachinfo(@Param("deptId") String deptId);
	/**
	 * @return
	 */
	public List<Dept> returndept();
	/**
	 * @param machineId
	 * @return
	 */
	public Dept getdept(@Param("machineId") String machineId);

	/**
	 * @param orderId
	 * @param a
	 */
	public void deleteAuditingBookingAll13(@Param("orderId") String orderId, @Param("machineId") String machineId);


	/**
	 * @param orderId
	 * @param staffCode
	 * @param a
	 * @param isPass
	 * @param checkAdvice
	 */
	public void updateAuditingBookingAll13(@Param("orderId") String orderId,@Param("staffCode") String staffCode,@Param("machineId") String a,@Param("isPass") String isPass,
			@Param("checkAdvice") String checkAdvice);


	/**
	 * @param hashMap
	 */
	public void saveAuditAdviceServiceUpdateMapper(HashMap<String, String> hashMap);
	
	/**
	 * @param hashMap
	 */
	public void saveAuditAdviceServiceUpdateMapper1(HashMap<String, String> hashMap);


	/**
	 * @param orderId
	 */
	public int selectBookOrderInfoIsPassCount(String orderId);
	public int selectBookOrderInfoIsPassCount1(String orderId);
	public int selectBookOrderInfoIsPassCount2(String orderId);
	public int selectBookOrderInfoIsPassCount3(HashMap<String, String> hashMap);

	/**
	 * @param orderId
	 * @param string
	 */
	public void updateOrderStatus(@Param("orderId") String orderId,@Param("bookStatus") String string);


	/**
	 * @param bookStatus
	 * @return
	 */
	public List<Order> selectCompletedBookOrderList(String bookStatus);

		
}
