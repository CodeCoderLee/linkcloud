package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import cn.ac.bcc.util.MemcachedUtils;
import net.sf.json.JSONArray;
import net.spy.memcached.MemcachedClient;
import org.apache.poi.ss.formula.ptg.MemErrPtg;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class OnOffLineMap {
    private static Map<String,Long> map = new HashMap<String, Long>();
    static int maxSpace = 1000*60*5;
    public static void online(String serialNumber, ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        client.add(serialNumber, 60 * 60 * 24 * 30, System.currentTimeMillis());
//        map.put(serialNumber,System.currentTimeMillis());
    }

    public static List<String> getKeys(ShiroMemcache shiroMemcache){
        List<String> keyList = new ArrayList<String>();
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        Object object = client.get(KeyPrefix.ALL_SERIALNUMBER);
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
        client.delete(key);
//        map.put(key,null);
//        map.remove(key);
    }



     public static boolean isOnline(String serialNumber,ShiroMemcache shiroMemcache){
        boolean online = true;
         try{
             MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
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
