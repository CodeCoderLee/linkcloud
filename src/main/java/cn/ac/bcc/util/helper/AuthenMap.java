package cn.ac.bcc.util.helper;

import cn.ac.bcc.shiro.cache.ShiroMemcache;
import net.spy.memcached.MemcachedClient;

/**
 * Created by Lisy on 2016-08-01.
 */
public class AuthenMap {

    public static void   put(String serialNumber, Boolean isAuthen, ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        client.set(KeyPrefix.AUTHEN_PREFIX + serialNumber, 60 * 60 * 24 * 30, isAuthen);
    }

    public static boolean get(String serialNumber,ShiroMemcache shiroMemcache){
        MemcachedClient client = shiroMemcache.getMemcachedClient();
        Boolean isAuthen = (Boolean)client.get(KeyPrefix.AUTHEN_PREFIX  + serialNumber);
        return  isAuthen;
    }
}
