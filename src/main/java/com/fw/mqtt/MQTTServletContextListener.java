package com.fw.mqtt;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MQTTServletContextListener implements ServletContextListener {
	
	   @Override
	   public void contextInitialized(ServletContextEvent servletContextEvent) {
	      System.out.println("--------------------------初始化成功-------------------------------");
	      /**
	       * 开启8个主题的MQTT线程
	       *
	       * @throws ServletException
	       */
		
	
		
		  Client3.openThread(); Client2.openThread(); Client1.openThread();
		  Client.openThread();
		 
		 
		
	   }

	   @Override
	   public void contextDestroyed(ServletContextEvent servletContextEvent) {
	      System.out.println("--------------------------------MQTTServlet.destroy()-------------------------");
		
		 Client3.stop1(); Client2.stop1(); Client1.stop1(); Client.stop1(); 
		 
	   }
	}
