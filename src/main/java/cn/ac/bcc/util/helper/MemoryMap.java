package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import cn.ac.bcc.util.MemcachedUtils;
import net.spy.memcached.MemcachedClient;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lenovo on 2016-06-06.
 */
public class MemoryMap {
    private static Map<String, ScanFreqInfos> map = new HashMap<String, ScanFreqInfos>();

    public static void add(String key, ScanFreqInfos scanFreqInfos,ShiroMemcache shiroMemcache) {
        MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
        memcachedClient.set(KeyPrefix.MEMORY_PREFIX + key, 60 * 60 * 24 * 30, scanFreqInfos);
//        map.put(key,scanFreqInfos);
    }

    /**
     * @param key 设备序列号，返回扫频指令信息
     * @return
     */
    public static ScanFreqInfos get(String key,ShiroMemcache shiroMemcache) {
        MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
        Object object = memcachedClient.get(KeyPrefix.MEMORY_PREFIX + key);
        if (object != null) {
            return (ScanFreqInfos) object;
        } else {
            return null;
        }
//        if(map.containsKey(key)){
//            return map.get(key);
//        }else{
//            return null;
//        }
    }

    public static void clear(String key,ShiroMemcache shiroMemcache) {
        MemcachedClient memcachedClient = shiroMemcache.getMemcachedClient();
        memcachedClient.delete(KeyPrefix.MEMORY_PREFIX + key);


//        map.put(key,null);
//        map.remove(key);
    }
}
