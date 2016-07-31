package cn.ac.bcc.util.helper;

import cn.ac.bcc.util.MemcachedUtils;
import net.sf.json.JSONObject;
import net.spy.memcached.MemcachedClient;

import javax.json.Json;
import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class HeartBeatMap {
    private static Map<String,String> map = new HashMap<String, String>();

    public static boolean add(String key,String heartBeanData){
        //检测频率和locked是否发生变化
        boolean ret = false;
        try{
            JSONObject object = JSONObject.fromObject(heartBeanData);
            String newFrq = object.getString("frq");
            String newLocked = object.getString("locked");
            String oldFrq = getFrq(key);
            String oldLocked = getLocked(key);
            if(!newFrq.equals(oldFrq) || !newLocked.equals(oldLocked)){
                ret = true;
            }
        }catch (Exception e){

        }
//        map.put(key,heartBeanData);
        MemcachedUtils.getClientInstance().add(KeyPrefix.HEARTBEAT_PREFIX + key, 60 * 60 * 24 * 30, heartBeanData);
        return ret;
    }


//    public static List<String> getKeys(){
//        Set<String> set = map.keySet();
//        Iterator<String> ite = set.iterator();
//        List<String > keyList = new ArrayList<String>();
//        while (ite.hasNext()){
//            keyList.add(ite.next());
//        }
//        return keyList;
//    }

    public static long getTimestamp(String key){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(KeyPrefix.HEARTBEAT_PREFIX + key);
        if (object != null) {
            JSONObject json = JSONObject.fromObject(object.toString());
            return json.getLong("time");
        }else{
            return 0;
        }
//        if(map.containsKey(key)){
//            String jsonStr = map.get(key);
//            JSONObject json = JSONObject.fromObject(jsonStr);
//            return json.getLong("time");
//        }else{
//            return 0;
//        }
    }

    public static String getSeq(String key){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(KeyPrefix.HEARTBEAT_PREFIX + key);
        if (object != null) {
            JSONObject json = JSONObject.fromObject(object.toString());
            return json.getString("seq");
        }else{
            return "-1";
        }
//        if(map.containsKey(key)){
//            String jsonStr = map.get(key);
//            JSONObject json = JSONObject.fromObject(jsonStr);
//            return json.getString("seq");
//        }else{
//            return "-1";
//        }
    }

    public static String getFrq(String key){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(KeyPrefix.HEARTBEAT_PREFIX + key);
        if (object != null) {
            JSONObject json = JSONObject.fromObject(object.toString());
            return json.getString("frq");
        }else{
            return "-1";
        }
//        if(map.containsKey(key)){
//            String jsonStr = map.get(key);
//            JSONObject json = JSONObject.fromObject(jsonStr);
//            return json.getString("frq");
//        }else{
//            return "-1";
//        }
    }

    public static String getLocked(String key){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(KeyPrefix.HEARTBEAT_PREFIX + key);
        if (object != null) {
            JSONObject json = JSONObject.fromObject(object.toString());
            return json.getString("locked");
        }else{
            return "-1";
        }
//        if(map.containsKey(key)){
//            String jsonStr = map.get(key);
//            JSONObject json = JSONObject.fromObject(jsonStr);
//            return json.getString("locked");
//        }else{
//            return "-1";
//        }
    }

    public static String get(String key){
        MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
        Object object = memcachedClient.get(KeyPrefix.HEARTBEAT_PREFIX + key);
        if (object != null) {
            return object.toString();
        }else{
            return null;
        }
//        if(map.containsKey(key)){
//            return map.get(key);
//        }else{
//            return null;
//        }
    }

    public static void clear(String key){
        MemcachedUtils.getClientInstance().delete(KeyPrefix.HEARTBEAT_PREFIX + key);
//        map.put(key,null);
//        map.remove(key);
    }

}
