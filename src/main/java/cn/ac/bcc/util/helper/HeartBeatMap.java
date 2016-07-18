package cn.ac.bcc.util.helper;

import net.sf.json.JSONObject;

import javax.json.Json;
import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class HeartBeatMap {
    private static Map<String,String> map = new HashMap<String, String>();

    public static boolean add(String key,String heartBeanData){
        //检测频率和locked是否发生变化
        boolean ret = false;
        try{
            JSONObject object = JSONObject.fromObject(heartBeanData);
            String newFrq = object.getString("frq");
            String newLocked = object.getString("locked");
            String oldFrq = getFrq(key);
            String oldLocked = getLocked(key);
            if(!newFrq.equals(oldFrq) || !newLocked.equals(oldLocked)){
                ret = true;
            }
        }catch (Exception e){

        }
        map.put(key,heartBeanData);
        return ret;
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

    public static String getFrq(String key){
        if(map.containsKey(key)){
            String jsonStr = map.get(key);
            JSONObject json = JSONObject.fromObject(jsonStr);
            return json.getString("frq");
        }else{
            return "-1";
        }
    }

    public static String getLocked(String key){
        if(map.containsKey(key)){
            String jsonStr = map.get(key);
            JSONObject json = JSONObject.fromObject(jsonStr);
            return json.getString("locked");
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
