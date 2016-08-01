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
public class ShiroMemcache {
    private String host = "192.168.126.40";//控制台上的“内网地址”
    private String port = "11211"; //默认端口 11211，不用改
    private String username = "67f525201b064506";//控制台上的“访问账号“
    private String password = "Bjlinkway2016BJ";//邮件或短信中提供的“密码”

    private static MemcachedClient client;

    public ShiroMemcache(String host, String port, String username, String password, boolean isAuthen) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        getClientInstance(isAuthen);
    }

    public MemcachedClient getMemcachedClient(){
        return  client;
    }

    private void getClientInstance(boolean isAuthen) {
        if (client == null) {
            if (isAuthen) {
                try {
                    AuthDescriptor ad = new AuthDescriptor(new String[]{"PLAIN"}, new PlainCallbackHandler(username, password));
                    client = new MemcachedClient(
                            new ConnectionFactoryBuilder().setProtocol(ConnectionFactoryBuilder.Protocol.BINARY)
                                    .setAuthDescriptor(ad)
                                    .build(),
                            AddrUtil.getAddresses(host + ":" + port));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                try {
                    client = new MemcachedClient(new BinaryConnectionFactory(), AddrUtil.getAddresses(host + ":" + port));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    public void close() {
        if (client != null) {
            client.shutdown();
        }
    }

}
