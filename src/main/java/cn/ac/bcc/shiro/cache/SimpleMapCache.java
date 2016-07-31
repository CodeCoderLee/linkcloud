package cn.ac.bcc.shiro.cache;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.util.CollectionUtils;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;

/**
 * Created by lifm on 16/7/31.
 */

public class SimpleMapCache implements Cache<Object, Object>, Serializable {

    private final Map<Object, Object> attributes;

    private final String name;

    public SimpleMapCache(String name, Map<Object, Object> attributes) {
        if (name == null)
            throw new IllegalArgumentException("Cache name cannot be null.");
        if (attributes == null) {
            throw new IllegalArgumentException("Backing map cannot be null.");
        } else {
            this.name = name;
            this.attributes = attributes;
        }
    }

    public Object get(Object key) throws CacheException {
        return attributes.get(key);
    }

    public Object put(Object key, Object value) throws CacheException {
        return attributes.put(key,value);
    }

    public Object remove(Object key) throws CacheException {
        return attributes.remove(key);
    }

    public void clear() throws CacheException {
        attributes.clear();
    }

    public int size() {
        return attributes.size();
    }

    public Set<Object> keys() {
        Set<Object> keys = attributes.keySet();
        if (!keys.isEmpty()) {
            return Collections.unmodifiableSet(keys);
        } else {
            return Collections.emptySet();
        }
    }

    public Collection<Object> values() {
        if (attributes == null) {
            return Collections.emptySet();
        }
        Collection<Object> values = attributes.values();
        if (!CollectionUtils.isEmpty(values))
            return Collections.unmodifiableCollection(values);
        else
            return Collections.emptySet();
    }

    public String toString() {
        return (new StringBuilder("SimpleMapCache '")).append(name).append("' (").append(attributes.size()).append(
                " entries)").toString();
    }
}
