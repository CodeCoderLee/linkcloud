package cn.ac.bcc.util.helper;

import cn.ac.bcc.util.MemcachedUtils;
import net.sf.json.JSONObject;
import net.spy.memcached.MemcachedClient;

import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by lenovo on 2016-06-06.
 */
public class CommandMap {
    private static int MAX_SIZE = 50;
    private static Map<String,LinkedBlockingQueue<JSONObject>> map = new HashMap<String,LinkedBlockingQueue<JSONObject>>();

    public static void addCommand(String serialNumber,JSONObject cmmdInfo) throws InterruptedException {
        LinkedBlockingQueue<JSONObject> queue = null;
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(serialNumber);
        if (object == null) {
            queue = new LinkedBlockingQueue<JSONObject>(MAX_SIZE);
            memcachedClient.add(serialNumber, 60 * 60 * 24 * 30, queue);
        } else {
            queue = (LinkedBlockingQueue<JSONObject>) object;
        }
//        if(!map.containsKey(serialNumber)){
//            queue = new LinkedBlockingQueue<JSONObject>(MAX_SIZE);
//            map.put(serialNumber,queue);
//        }else{
//            queue = map.get(serialNumber);
//        }
        queue.put(cmmdInfo);
    }

    public static JSONObject getCommand(String serialNumber){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(serialNumber);
        if (object != null) {
            LinkedBlockingQueue<JSONObject> queue = (LinkedBlockingQueue<JSONObject>) object;
            JSONObject jsonObject = queue.poll();
            return jsonObject;
        } else {
            return null;
        }
//        if(map != null && map.containsKey(serialNumber)){
//            BlockingQueue<JSONObject> queue = map.get(serialNumber);
//            JSONObject object = queue.poll();
//            return object;
//        }else{
//            return null;
//        }
    }

//    public static String get(Map<String,String> map,String key){
//        if(map != null && map.containsKey(key)){
//            return map.get(key);
//        }else{
//            return null;
//        }
//    }
}
