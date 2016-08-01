package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import cn.ac.bcc.util.MemcachedUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.spy.memcached.MemcachedClient;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class TokenNumMap {
    private static Map<String,String> map = new HashMap<String, String>();


    public static void add(String token, String serialNumber, ShiroMemcache shiroMemcache){
//        map.put(token,serialNumber);
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        client.set(token, 60 * 60 * 24 * 30, serialNumber);
        Object object = client.get(KeyPrefix.ALL_SERIALNUMBER);
        if (object == null) {
            JSONArray array = new JSONArray();
            array.add(serialNumber);
            client.set(KeyPrefix.ALL_SERIALNUMBER, 60 * 60 * 24 * 30, array);
        } else {
            JSONArray array = (JSONArray)object;
            if (!array.contains(serialNumber)) {
                array.add(serialNumber);
                client.set(KeyPrefix.ALL_SERIALNUMBER, 60 * 60 * 24 * 30, array);
            }
        }
    }

    public static  void clear(ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        client.delete(KeyPrefix.ALL_SERIALNUMBER);
    }

     public static String get(String token, ShiroMemcache shiroMemcache){
         MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
         Object object = memcachedClient.get(token);
         if (object != null) {
             return object.toString();
         } else {
             return null;
         }
//        if(map.containsKey(token)){
//            return map.get(token);
//        }else{
//            return null;
//        }
    }

}
