package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
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
//    private static Map<String,LinkedBlockingQueue<JSONObject>> map = new HashMap<String,LinkedBlockingQueue<JSONObject>>();

    public static void addCommand(String serialNumber, JSONObject cmmdInfo, ShiroMemcache shiroMemcache) throws InterruptedException {
        LinkedBlockingQueue<JSONObject> queue = null;
        MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
        Object object = memcachedClient.get(KeyPrefix.COMMAND_PREFIX +serialNumber);
        if (object == null) {
            queue = new LinkedBlockingQueue<JSONObject>(MAX_SIZE);
            queue.put(cmmdInfo);
            memcachedClient.set(KeyPrefix.COMMAND_PREFIX +serialNumber, 60 * 60 * 24 * 30, queue);
        } else {
            queue = (LinkedBlockingQueue<JSONObject>) object;
            queue.put(cmmdInfo);
            memcachedClient.set(KeyPrefix.COMMAND_PREFIX +serialNumber, 60 * 60 * 24 * 30, queue);
        }
//        if(!map.containsKey(serialNumber)){
//            queue = new LinkedBlockingQueue<JSONObject>(MAX_SIZE);
//            map.put(serialNumber,queue);
//        }else{
//            queue = map.get(serialNumber);
//        }
    }

    public static JSONObject getCommand(String serialNumber, ShiroMemcache shiroMemcache){
        MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
        Object object = memcachedClient.get(KeyPrefix.COMMAND_PREFIX +serialNumber);
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
