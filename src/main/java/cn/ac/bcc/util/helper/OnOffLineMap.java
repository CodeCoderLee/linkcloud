package cn.ac.bcc.util.helper;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class OnOffLineMap {
    private static Map<String,Long> map = new HashMap<String, Long>();
    static int maxSpace = 1000*60*5;
    public static void online(String serialNumber){
        map.put(serialNumber,System.currentTimeMillis());
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



    public static void clear(String key){
        map.put(key,null);
        map.remove(key);
    }



     public static boolean isOnline(String serialNumber){
        boolean online = true;
         try{
             Long oldTime  = map.get(serialNumber);
             long current = System.currentTimeMillis();
             long interval = current - oldTime;
             if (interval > maxSpace){
                 online = false;
             }
         }catch (Exception e){
             online = false;
         }
         return online;
    }

}
