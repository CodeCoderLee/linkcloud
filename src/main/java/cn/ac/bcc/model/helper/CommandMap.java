package cn.ac.bcc.model.helper;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lenovo on 2016-06-06.
 */
public class CommandMap {
    private static Map<String,Map<String,String>> map = new HashMap<String, Map<String,String>>();

    public static void addCommand(String serialNumber,Map<String,String> cmmdInfo){
        map.put(serialNumber,cmmdInfo);
    }

    public static Map<String,String> getCommand(String serialNumber){
        if(map != null && map.containsKey(serialNumber)){
            Map<String,String> retMap = map.remove(serialNumber);
            return retMap;
        }else{
            return null;
        }
    }

    public static String get(Map<String,String> map,String key){
        if(map != null && map.containsKey(key)){
            return map.get(key);
        }else{
            return null;
        }
    }
}
