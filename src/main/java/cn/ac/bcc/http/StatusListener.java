package cn.ac.bcc.http;

import cn.ac.bcc.util.helper.HeartBeatMap;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.util.HelperUtils;
import cn.ac.bcc.util.helper.OnOffLineMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by lenovo on 2016-05-31.
 */
public class StatusListener implements ServletContextListener {
    boolean run = true;
    public void contextDestroyed(ServletContextEvent arg0)
    {
        run = false;
    }


    public void contextInitialized(ServletContextEvent event)
    {
        ServletContext sc = event.getServletContext();
        WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(sc);
        Timer timer = new Timer();
        timer.schedule(new MyTask(springContext, sc, timer), 3000);
    }

    class MyTask extends TimerTask {
        WebApplicationContext ctx;
        ServletContext sc;
        Timer timer;

        public MyTask(WebApplicationContext springContext, ServletContext sc, Timer timer) {
            this.ctx = springContext;
            this.sc = sc;
            this.timer = timer;
        }

        public void run() {
            int sleep = 500;
            while (run){
                try {
                    List<String> keyList = OnOffLineMap.getKeys();
                    for (String serialNumber : keyList) {
                        if (!OnOffLineMap.isOnline(serialNumber)) {
                            //超时判断为离线，更新状态
                            DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
                            DeviceService deviceService = ctx.getBean(DeviceService.class);
                            deviceService.updateOnOffLineByNum(serialNumber, HelperUtils.OFF_LINE);
                            deviceAuthenService.updateOnOffLineByNum(serialNumber, HelperUtils.OFF_LINE);
//                            HeartBeatMap.clear(serialNumber);
//                            OnOffLineMap.clear(serialNumber);
                            if(DeviceAPI.AUTHEN_MAP.containsKey(serialNumber)){
                                DeviceAPI.AUTHEN_MAP.put(serialNumber,false);
                            }
                            System.out.println("off-line");
                        }
                    }
                    Thread.sleep(sleep);
                }catch (Exception e) {
                    e.printStackTrace();
                    try {
                        Thread.sleep(sleep);
                    } catch (InterruptedException e1) {
                        e1.printStackTrace();
                    }
                }
            }
        }
    }
}

