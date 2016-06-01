package cn.ac.bcc.http;

import cn.ac.bcc.service.business.device.DeviceAuthenService;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;
import java.util.TimerTask;

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
        Timer timer = new Timer();
        timer.schedule(new DccTask(springContext, sc, timer), 3000);
    }

    class DccTask extends TimerTask {
        WebApplicationContext springContext;
        ServletContext sc;
        Timer timer;

        public DccTask(WebApplicationContext springContext, ServletContext sc, Timer timer) {
            this.springContext = springContext;
            this.sc = sc;
            this.timer = timer;
        }

        public void run() {
            try {
                // 得到Service的实例对象
                httpServer = new HttpServer(springContext);
                try {
                    httpServer.start(8000);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

