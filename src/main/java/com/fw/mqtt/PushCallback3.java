package com.fw.mqtt;
 
 


import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttCallbackExtended;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;

import com.wl.tools.Sqlhelper;  
  
/**  
 * 发布消息的回调类  
 *   
 * 必须实现MqttCallback的接口并实现对应的相关接口方法CallBack 类将实现 MqttCallBack。  
 * 每个客户机标识都需要一个回调实例。在此示例中，构造函数传递客户机标识以另存为实例数据。
 * 在回调中，将它用来标识已经启动了该回调的哪个实例。  
 * 必须在回调类中实现三个方法：  
 *  public void messageArrived(MqttTopic topic, MqttMessage message)接收已经预订的发布。  
 *  public void connectionLost(Throwable cause)在断开连接时调用。  
 *  public void deliveryComplete(MqttDeliveryToken token))  
 *  接收到已经发布的 QoS 1 或 QoS 2 消息的传递令牌时调用。  
 *  由 MqttClient.connect 激活此回调。  
 */    
public class PushCallback3 implements MqttCallback,MqttCallbackExtended {
	public static int count=0;
  
    public void connectionLost(Throwable cause) {  
        // 连接丢失后，一般在这里面进行重连  
        System.out.println("连接断开，可以做重连");     
      
    }
    public void deliveryComplete(IMqttDeliveryToken token) {
        System.out.println("deliveryComplete---------" + token.isComplete());  
    }
 
    public void messageArrived(String topic, MqttMessage message) throws Exception {
		 count++; 
		 if(count%10==0) {

			/*
			 * System.out.println("接收消息主题 : " + topic); System.out.println("接收消息Qos : " +
			 * message.getQos()); System.out.println("接收消息内容 : " + new
			 * String(message.getPayload(),"UTF-8"));
			 */
         
       String payload = new String(message.getPayload(),"UTF-8"); 	 
       String []strs=payload.split(",",-1); //字符分割 
       if(!strs[0].equals("close")) {
    	   String sql="insert into MACHINE_5506 values ('";
    	
    	   for(int i=0;i<strs.length;i++) {
    		   if(i!=strs.length-1) {
    			   sql+=strs[i]+"','";
    			   }else{
    		   sql+=strs[i]+"')";
    			   } 
   	   }
   		try {
			Sqlhelper.insert(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
   		
       }            
    }
	 } 

	@Override
	public void connectComplete(boolean reconnect, String serverURI) {
		// TODO 自动生成的方法存根
		System.out.println("数控高速磨床连接成功");
		 try {
			Client3.getClient().subscribe("DataCollect/Grinder/Machine_5513", 1);
		} catch (MqttException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
	}
}
