package cn.ac.bcc.controller.ws;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ServerListener  implements ServletContextListener {
	private UDPServer udpServer;
	private List<Object> list = null;

	public void contextDestroyed(ServletContextEvent arg0) {
		if(udpServer != null){
			udpServer.unbind();
			udpServer = null;
		}
	}

	public void contextInitialized(ServletContextEvent event) {
		try {
			ServletContext sc = event.getServletContext();
			list = (List<Object>)sc.getAttribute("MessageList");
	    	if (list == null) {
	    		list = new LinkedList<Object>();
	    		sc.setAttribute("MessageList", list);
	    	}
			Timer timer = new Timer();
			timer.schedule(new NettyTask(sc, timer), 3000, 3000);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	class NettyTask extends TimerTask {
		Logger log = Logger.getLogger(NettyTask.class);
		ServletContext sc;
		Timer timer;

		public NettyTask(ServletContext sc, Timer timer) {
			this.sc = sc;
			this.timer = timer;
		}

		public void run() {
			int port = 3333;
			log.debug("心跳服务启动………………");
			try {
				udpServer = new UDPServer(list);
				udpServer.run(port);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if(udpServer != null){
				udpServer.unbind();
				udpServer = null;
			}
		}
	}
}
