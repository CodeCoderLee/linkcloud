package cn.ac.bcc.util.helper;

import net.sf.json.JSONObject;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class HeartBeatMap {
    private static Map<String,String> map = new HashMap<String, String>();

    public static void add(String key,String heartBeanData){
        map.put(key,heartBeanData);
    }

    public static List<String> getKeys(){
        Set<String> set = map.keySet();
        Iterator<String> ite = set.iterator();
        List<String > keyList = new ArrayList<String>();
        while (ite.hasNext()){
            keyList.add(ite.next());
        }
        return keyList;
    }

    public static long getTimestamp(String key){
        if(map.containsKey(key)){
            String jsonStr = map.get(key);
            JSONObject json = JSONObject.fromObject(jsonStr);
            return json.getLong("time");
        }else{
            return 0;
        }
    }

    public static String getSeq(String key){
        if(map.containsKey(key)){
            String jsonStr = map.get(key);
            JSONObject json = JSONObject.fromObject(jsonStr);
            return json.getString("seq");
        }else{
            return "-1";
        }
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
