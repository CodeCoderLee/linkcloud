package cn.ac.bcc.util;

import me.util.MemcachedTest;
import net.spy.memcached.AddrUtil;
import net.spy.memcached.ConnectionFactoryBuilder;
import net.spy.memcached.MemcachedClient;
import net.spy.memcached.auth.AuthDescriptor;
import net.spy.memcached.auth.PlainCallbackHandler;

/**
 * Created by Administrator on 2016/7/31.
 */
public class MemcachedUtils {
//    final static String host = "67f525201b064506.m.cnbjalicm12pub001.ocs.aliyuncs.com";//控制台上的“内网地址”
//    final static String port = "11211"; //默认端口 11211，不用改
//    final static String username = "67f525201b064506";//控制台上的“访问账号“
//    final static String password = "Bjlinkway2016BJ";//邮件或短信中提供的“密码”
//
//    private static MemcachedClient client ;
//    private MemcachedUtils(){
//
//    }
//
//    public static synchronized MemcachedClient getClientInstance(){
//        if(client == null) {
//            try {
//                AuthDescriptor ad = new AuthDescriptor(new String[]{"PLAIN"}, new PlainCallbackHandler(username, password));
//                client = new MemcachedClient(
//                        new ConnectionFactoryBuilder().setProtocol(ConnectionFactoryBuilder.Protocol.BINARY)
//                                .setAuthDescriptor(ad)
//                                .build(),
//                        AddrUtil.getAddresses(host + ":" + port));
//            } catch (Exception e) {
//
//            }
//        }
//        return  client;
//    }
//
}
