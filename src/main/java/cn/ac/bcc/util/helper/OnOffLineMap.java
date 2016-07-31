package cn.ac.bcc.util.helper;

import cn.ac.bcc.util.MemcachedUtils;
import net.spy.memcached.MemcachedClient;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class OnOffLineMap {
    private static Map<String,Long> map = new HashMap<String, Long>();
    static int maxSpace = 1000*60*5;
    public static void online(String serialNumber){
        MemcachedUtils.getClientInstance().add(serialNumber, 60 * 60 * 24 * 30, System.currentTimeMillis());
//        map.put(serialNumber,System.currentTimeMillis());
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



    public static void clear(String key){
        MemcachedUtils.getClientInstance().delete(key);
//        map.put(key,null);
//        map.remove(key);
    }



     public static boolean isOnline(String serialNumber){
        boolean online = true;
         try{
             MemcachedClient memcachedClient = MemcachedUtils.getClientInstance();
             Long oldTime = (Long)memcachedClient.get(serialNumber);
//             Long oldTime  = map.get(serialNumber);
             long current = System.currentTimeMillis();
             long interval = current - oldTime;
             if (interval > maxSpace){
                 online = false;
             }
         }catch (Exception e){
             online = false;
         }
         return online;
    }

}
