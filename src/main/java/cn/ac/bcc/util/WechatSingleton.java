package cn.ac.bcc.util;

import net.sf.json.JSONObject;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Lisy on 2016-07-28.
 */
public class WechatSingleton {
    //缓存accessToken 的Map  ,map中包含 一个accessToken 和 缓存的时间戳
    //当然也可以分开成两个属性咯
    private Map<String, String> map = new HashMap<String, String>();

    private WechatSingleton() {
    }

    private static WechatSingleton single = null;

    // 静态工厂方法
    public static WechatSingleton getInstance() {
        if (single == null) {
            single = new WechatSingleton();
        }
        return single;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

    public static WechatSingleton getSingle() {
        return single;
    }

    public static void setSingle(WechatSingleton single) {
        WechatSingleton.single = single;
    }


    public static String getAccessToken() {
        String result = "";
        WechatSingleton singleton = WechatSingleton.getInstance();
        Map<String, String> map = singleton.getMap();
        String time = map.get("access_token_time");
        String accessToken = map.get("access_token");
        Long nowDate = new Date().getTime();
        //这里设置过期时间 3600*1000就好了
        if (accessToken != null && time != null && nowDate - Long.parseLong(time) < 3600 * 1000) {
            result = accessToken;
        } else {
            String access_token= WechatUtil.getAccessToken();
            map.put("access_token_time", nowDate + "");
            map.put("access_token", access_token);
            result = access_token;
        }
        return result;
    }

    public static String getJsapiTicket() {
        String result = "";
        WechatSingleton singleton = WechatSingleton.getInstance();
        Map<String, String> map = singleton.getMap();
        String time = map.get("jsapi_ticket_time");
        String jsapiTicket = map.get("jsapi_ticket");
        Long nowDate = new Date().getTime();
        //这里设置过期时间 3600*1000就好了
        if (jsapiTicket != null && time != null && nowDate - Long.parseLong(time) < 3600 * 1000) {
            result = jsapiTicket;
        } else {
            String access_token = getAccessToken();
            String ticket = WechatUtil.getJsapiTicket(access_token);
            map.put("jsapi_ticket_time", nowDate + "");
            map.put("jsapi_ticket", ticket);
            result = ticket;
        }
        return result;
    }
}
