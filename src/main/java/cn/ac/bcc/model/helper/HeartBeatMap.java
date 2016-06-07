package cn.ac.bcc.model.helper;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lenovo on 2016-06-07.
 */
public class HeartBeatMap {
    private static Map<String,String> map = new HashMap<String, String>();

    public static void add(String key,String heartBeanData){
        map.put(key,heartBeanData);
    }

    public static String get(String key){
        if(map.containsKey(key)){
            return map.get(key);
        }else{
            return null;
        }
    }

    public static void clear(String key){
        map.put(key,null);
        map.remove(key);
    }

}
