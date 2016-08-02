package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import cn.ac.bcc.util.MemcachedUtils;
import net.sf.json.JSONArray;
import net.spy.memcached.MemcachedClient;
import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.ptg.MemErrPtg;

import javax.json.Json;
import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class OnOffLineMap {
    static  Logger logger = Logger.getLogger(OnOffLineMap.class);
//    private static Map<String,Long> map = new HashMap<String, Long>();
    static int maxSpace = 1000*60*5;
    public static void online(String serialNumber, ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        long time =  System.currentTimeMillis();
        client.set(KeyPrefix.ON_OFF_LINE_PREFIX + serialNumber, 60 * 60 * 24 * 30,time);
//        logger.error("--online----serialNumber is " + serialNumber  + "  time is " +  time);
//        map.put(serialNumber,System.currentTimeMillis());

        //lisy 判断是否离线的部分需要单独的Map空间
        Object onLineObj = client.get(KeyPrefix.ALL_SERIALNUMBER_ON_LINE);
        if (onLineObj == null) {
            JSONArray array = new JSONArray();
            array.add(serialNumber);
            client.set(KeyPrefix.ALL_SERIALNUMBER_ON_LINE, 60 * 60 * 24 * 30, array);
        } else {
            JSONArray array = (JSONArray)onLineObj;
            if (!array.contains(serialNumber)) {
                array.add(serialNumber);
                client.set(KeyPrefix.ALL_SERIALNUMBER_ON_LINE, 60 * 60 * 24 * 30, array);
            }
        }
    }

    public static List<String> getKeys(ShiroMemcache shiroMemcache){
        List<String> keyList = new ArrayList<String>();
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        Object object = client.get(KeyPrefix.ALL_SERIALNUMBER_ON_LINE);
        if (object != null) {
            JSONArray jsonArray = (JSONArray)object;
            for (Object o : jsonArray.toArray()) {
                keyList.add(o.toString());
            }
        }
//        Set<String> set = map.keySet();
//        Iterator<String> ite = set.iterator();
//        List<String > keyList = new ArrayList<String>();
//        while (ite.hasNext()){
//            keyList.add(ite.next());
//        }
        return keyList;
    }



    public static void clear(String key,ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        client.delete(KeyPrefix.ON_OFF_LINE_PREFIX + key);
        Object obj = client.get(KeyPrefix.ALL_SERIALNUMBER);
        if (obj != null) {
            JSONArray jsonArray = (JSONArray) obj;
            if (jsonArray.contains(key)) {
                jsonArray.remove(key);
                client.set(KeyPrefix.ALL_SERIALNUMBER, 60 * 60 * 24 * 30, jsonArray);
            }

        }
//        map.put(key,null);
//        map.remove(key);
    }



     public static boolean isOnline(String serialNumber,ShiroMemcache shiroMemcache){
        boolean online = true;
         try{
             MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
             Object obj = memcachedClient.get(KeyPrefix.ON_OFF_LINE_PREFIX + serialNumber);
             //logger.error("--isOnline----obj is " + obj  + "   serialNumber is " + serialNumber);
             if(obj != null) {
                 Long oldTime = (Long)obj;
//             Long oldTime  = map.get(serialNumber);
                 long current = System.currentTimeMillis();
                 long interval = current - oldTime;
                 if (interval > maxSpace) {
                     online = false;
                 }
             }
         }catch (Exception e){
             online = false;
         }
         return online;
    }

}
