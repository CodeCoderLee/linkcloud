package cn.ac.bcc.http;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpRequestDecoder;
import io.netty.handler.codec.http.HttpResponseEncoder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;

/**
 * Created by lenovo on 2016-05-31.
 */
public class HttpServer {
    private static Log log = LogFactory.getLog(HttpServer.class);
    private ApplicationContext applicationContext;
    private ChannelFuture f;
    public HttpServer(ApplicationContext applicationContext){
        this.applicationContext =  applicationContext;
    }

    public HttpServer(){

    }

    public void close(){
        if(f != null){
            log.info("Http Server Close....");
            f.channel().close();
        }
    }

    public void start(int port) throws Exception {
        log.info("Http Server listening on " + port + " ...");
        EventLoopGroup bossGroup = new NioEventLoopGroup();
        EventLoopGroup workerGroup = new NioEventLoopGroup();
        try {
            ServerBootstrap b = new ServerBootstrap();
            b.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class)
                    .childHandler(new ChannelInitializer<SocketChannel>() {
                        public void initChannel(SocketChannel ch) throws Exception {
                            // server端接收到的是httpRequest，所以要使用HttpRequestDecoder进行解码
                            ch.pipeline().addLast("decoder",new HttpRequestDecoder());
                            ch.pipeline().addLast("aggregator", new HttpObjectAggregator(1048576));
                            // server端发送的是httpResponse，所以要使用HttpResponseEncoder进行编码
                            ch.pipeline().addLast("encoder",new HttpResponseEncoder());

                            ch.pipeline().addLast("handler",new HttpRequestHandler(applicationContext));
                        }
                    }).option(ChannelOption.SO_BACKLOG, 128)
                    .childOption(ChannelOption.SO_KEEPALIVE, true);
            f = b.bind(port).sync();
            f.channel().closeFuture().sync();
        } finally {
            workerGroup.shutdownGracefully();
            bossGroup.shutdownGracefully();
        }
    }

    public static void main(String[] args) throws Exception {
        HttpServer server = new HttpServer();
        log.info("Http Server listening on 8844 ...");
        server.start(8844);
    }
}
