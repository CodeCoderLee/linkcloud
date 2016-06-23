package cn.ac.bcc.util.helper;

import net.sf.json.JSONObject;

import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by lenovo on 2016-06-06.
 */
public class CommandMap {
    private static int MAX_SIZE = 50;
    private static Map<String,BlockingQueue<JSONObject>> map = new HashMap<String,BlockingQueue<JSONObject>>();

    public static void addCommand(String serialNumber,JSONObject cmmdInfo) throws InterruptedException {
        BlockingQueue<JSONObject> queue = null;
        if(!map.containsKey(serialNumber)){
            queue = new LinkedBlockingQueue<JSONObject>(MAX_SIZE);
            map.put(serialNumber,queue);
        }else{
            queue = map.get(serialNumber);
        }
        queue.put(cmmdInfo);
    }

    public static JSONObject getCommand(String serialNumber){
        if(map != null && map.containsKey(serialNumber)){
            BlockingQueue<JSONObject> queue = map.get(serialNumber);
            JSONObject object = queue.poll();
            return object;
        }else{
            return null;
        }
    }

//    public static String get(Map<String,String> map,String key){
//        if(map != null && map.containsKey(key)){
//            return map.get(key);
//        }else{
//            return null;
//        }
//    }
}
