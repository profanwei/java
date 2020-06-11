package com.fw.mqtt;
 
 
/*import java.util.concurrent.ScheduledExecutorService;  */
import org.eclipse.paho.client.mqttv3.MqttClient;  
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;  
import org.eclipse.paho.client.mqttv3.MqttException;  
import org.eclipse.paho.client.mqttv3.MqttTopic;  
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
  
public class Client1 extends Thread {  
  
    public static final String HOST = "tcp://222.192.72.12:1883";  
    public static final String TOPIC = "DataCollect/Heidehain/Machine_5504";  
    private static final String clientid = "server"+Math.random();  
    private static MqttClient client;  
    private MqttConnectOptions options;  
    private String userName = "admin";
    private String passWord = "public";
  
	/* private ScheduledExecutorService scheduler; */
    @Override
    public void start() {  
        try {  
            // host为主机名，clientid即连接MQTT的客户端ID，一般以唯一标识符表示，MemoryPersistence设置clientid的保存形式，默认为以内存保存  
            client = new MqttClient(HOST, clientid, new MemoryPersistence());  
            // MQTT的连接设置  
            options = new MqttConnectOptions();  
            // 设置是否清空session,这里如果设置为false表示服务器会保留客户端的连接记录，这里设置为true表示每次连接到服务器都以新的身份连接  
            options.setCleanSession(true);  
            // 设置连接的用户名  
            options.setUserName(userName);  
            // 设置连接的密码  
            options.setPassword(passWord.toCharArray());  
            // 设置超时时间 单位为秒  
            options.setConnectionTimeout(10);  
            // 设置会话心跳时间 单位为秒 服务器会每隔1.5*20秒的时间向客户端发送个消息判断客户端是否在线，但这个方法并没有重连的机制  
            options.setKeepAliveInterval(20);  
            // 设置回调  
            client.setCallback(new PushCallback1());  
            MqttTopic topic = client.getTopic(TOPIC);  
            //setWill方法，如果项目中需要知道客户端是否掉线可以调用该方法。设置最终端口的通知消息    
            options.setWill(topic, "close".getBytes(), 2, true);  
            options.setAutomaticReconnect(true);
            client.connect(options);  
            //订阅消息  
            int[] Qos  = {1};  
            String[] topic1 = {TOPIC};  
            client.subscribe(topic1, Qos);  
            
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    public static void stop1() {
        try {
            // 断开连接
            client.disconnect();
            // 关闭客户端
            client.close();
        } catch (MqttException e) {
            e.printStackTrace();
        }
    }
    public static void openThread() {
    	System.out.println(clientid);
    	Client1 client = new Client1(); 
          
           client.start();
        }

	public static MqttClient getClient() {
		return client;
	}


	public static void setClient(MqttClient client) {
		Client1.client = client;
	}
     

}