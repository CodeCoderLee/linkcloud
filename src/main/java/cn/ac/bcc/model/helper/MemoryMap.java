package cn.ac.bcc.model.helper;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lenovo on 2016-06-06.
 */
public class MemoryMap {
    private static Map<String,ScanFreqInfos> map = new HashMap<String, ScanFreqInfos>();

    public static void add(String key,ScanFreqInfos scanFreqInfos){
        map.put(key,scanFreqInfos);
    }

    /**
     *
     * @param key 设备序列号，返回扫频指令信息
     * @return
     */
    public static ScanFreqInfos get(String key){
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
