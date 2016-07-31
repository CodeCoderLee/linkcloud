package cn.ac.bcc.shiro.cache;

import me.util.MemcachedTest;
import net.spy.memcached.AddrUtil;
import net.spy.memcached.BinaryConnectionFactory;
import net.spy.memcached.ConnectionFactoryBuilder;
import net.spy.memcached.MemcachedClient;
import net.spy.memcached.auth.AuthDescriptor;
import net.spy.memcached.auth.PlainCallbackHandler;
import net.spy.memcached.internal.OperationFuture;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

/**
 * Created by lifm on 16/7/31.
 */
public class ShiroMemCache {
    final static String host = "192.168.126.4";//控制台上的“内网地址”
    final static String port = "11211"; //默认端口 11211，不用改
    final static String username = "67f525201b064506";//控制台上的“访问账号“
    final static String password = "Bjlinkway2016BJ";//邮件或短信中提供的“密码”

    private static MemcachedClient client;

    private ShiroMemCache(){

    }


    public static synchronized MemcachedClient getClientInstance() {
        if (client == null) {
            try {
                client = new MemcachedClient(new BinaryConnectionFactory(), AddrUtil.getAddresses(host + ":" + port));

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return client;
    }

    public static void main(String[] args){
        MemcachedTest.needUserPwd();
    }
}
