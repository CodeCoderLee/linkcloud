package cn.ac.bcc.shiro.cache;

import net.spy.memcached.MemcachedClient;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;

import java.util.HashMap;

/**
 * Created by lifm on 16/7/31.
 */
public class SimpleCacheManagerImpl implements SimpleCacheManager {

    private MemcachedClient memcachedClient;

//    private MemcachedUtils memcachedUtils;

    public SimpleCacheManagerImpl(ShiroMemcache shiroMemcache) {
        this.memcachedClient = shiroMemcache.getMemcachedClient();

//        this.memcachedClient = MemcachedUtils.getClientInstance();
    }

    public void createCache(String name, Cache<Object, Object> cache) throws CacheException {
        try {
            memcachedClient.set(name, 0, cache);
        } catch (Exception e) {
            throw new CacheException(e);
        }
    }

    public Cache<Object, Object> createCache(String name) throws CacheException {
        Cache<Object,Object> cache = new SimpleMapCache(name,new HashMap<Object, Object>());
        memcachedClient.set(name, 0, cache);
        return cache;
    }

    public Cache<Object, Object> getCache(String name) throws CacheException {
        try {
            if (memcachedClient.get(name) == null) {
                return createCache(name);
            }
            return (Cache<Object, Object>) memcachedClient.get(name);
        } catch (Exception e) {
            throw new CacheException(e);
        }

    }

    public void removeCache(String name) throws CacheException {
        try {
            memcachedClient.delete(name);
        } catch (Exception e) {
            throw new CacheException(e);
        }
    }

    public void updateCache(String name, Cache<Object, Object> cache) throws CacheException {
        try {
            memcachedClient.replace(name, 0, cache);
        } catch (Exception e) {
            throw new CacheException(e);
        }
    }

    public void destroy() throws CacheException {
        try {
            memcachedClient.shutdown();
        } catch (Exception e) {
            throw new CacheException(e);
        }
    }
}
