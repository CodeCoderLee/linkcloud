package cn.ac.bcc.util.helper;

import net.sf.json.JSONObject;

import java.util.*;

/**
 * Created by lenovo on 2016-06-07.
 */
public class TokenNumMap {
    private static Map<String,String> map = new HashMap<String, String>();

    public static void add(String token,String serialNumber){
        map.put(token,serialNumber);
    }

     public static String get(String token){
        if(map.containsKey(token)){
            return map.get(token);
        }else{
            return null;
        }
    }

}
