package cn.ac.bcc.http;

import cn.ac.bcc.service.business.device.DeviceAuthenService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by lenovo on 2016-05-31.
 */
public class HttpServerListener implements ServletContextListener {

    HttpServer httpServer;
    public void contextDestroyed(ServletContextEvent arg0)
    {
        if(httpServer != null){
            httpServer.close();
        }
    }


    public void contextInitialized(ServletContextEvent event)
    {
        ServletContext sc = event.getServletContext();
        WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(sc);
        // 得到Service的实例对象
        httpServer = new HttpServer(springContext);
        try {
            httpServer.start(8000);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

