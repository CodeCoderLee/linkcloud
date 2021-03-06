package cn.ac.bcc.shiro.cache;

import org.apache.shiro.cache.AbstractCacheManager;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Destroyable;

/**
 * Created by lifm on 16/7/31.
 */
public class ShiroCacheManager  implements CacheManager, Destroyable {
    private SimpleCacheManager simpleCacheManager;
    public Cache<Object, Object> getCache(String name) throws CacheException {
        return simpleCacheManager.getCache(name);
    }

    public void createCache(String name) throws CacheException {
        simpleCacheManager.createCache(name);
    }

//    public Cache createCache(String name) throws CacheException {
//        return simpleCacheManager.createCache(name);
//    }

    public void destroy() throws Exception {
        simpleCacheManager.destroy();
    }

    public SimpleCacheManager getSimpleCacheManager() {
        return simpleCacheManager;
    }

    public void setSimpleCacheManager(SimpleCacheManager simpleCacheManager) {
        this.simpleCacheManager = simpleCacheManager;
    }
}
