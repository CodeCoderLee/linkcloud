package cn.ac.bcc.http;

import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.util.HelperUtils;
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

        try {
            DeviceAuthenService deviceAuthenService = springContext.getBean(DeviceAuthenService.class);
            DeviceService deviceService = springContext.getBean(DeviceService.class);
            deviceService.updateOnOffLineAll(HelperUtils.OFF_LINE);
            deviceAuthenService.updateOnOffLineAll(HelperUtils.OFF_LINE);
        }catch (Exception e){

        }

        Timer timer = new Timer();
        timer.schedule(new MyTask(springContext, sc, timer), 3000);
    }

    class MyTask extends TimerTask {
        WebApplicationContext springContext;
        ServletContext sc;
        Timer timer;

        public MyTask(WebApplicationContext springContext, ServletContext sc, Timer timer) {
            this.springContext = springContext;
            this.sc = sc;
            this.timer = timer;
        }

        public void run() {
            try {
                // 得到Service的实例对象
                httpServer = new HttpServer(springContext);
                try {
                    httpServer.start(8080);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

