package  cn.ac.bcc.http;

import static io.netty.handler.codec.http.HttpHeaders.Names.CONNECTION;
import static io.netty.handler.codec.http.HttpHeaders.Names.CONTENT_LENGTH;
import static io.netty.handler.codec.http.HttpHeaders.Names.CONTENT_TYPE;
import static io.netty.handler.codec.http.HttpResponseStatus.OK;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

import io.netty.channel.ChannelHandlerAdapter;
import io.netty.handler.codec.http.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.handler.codec.http.HttpHeaders.Values;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.List;

public class HttpServerInboundHandler extends ChannelHandlerAdapter {

    private static Log log = LogFactory.getLog(HttpServerInboundHandler.class);
    private ApplicationContext applicationContext;

    public HttpServerInboundHandler(){}

    public HttpServerInboundHandler(ApplicationContext applicationContext){
        this.applicationContext = applicationContext;
    }

    private ThreadLocal<DefaultHttpRequest> requestThreadLocal = new ThreadLocal<DefaultHttpRequest>();

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        if (msg instanceof HttpRequest) {
            DefaultHttpRequest request = (DefaultHttpRequest) msg;
            requestThreadLocal.set(request);
        }
        if (msg instanceof HttpContent) {
            DefaultHttpRequest request = requestThreadLocal.get();
            DeviceAPI deviceAPI = new DeviceAPI(applicationContext);

            HttpContent content = (HttpContent) msg;
            ByteBuf buf = content.content();
            String data = buf.toString(io.netty.util.CharsetUtil.UTF_8);
            buf.release();

            FullHttpResponse response = deviceAPI.dispatcher(request,data);

            response.headers().set(CONTENT_TYPE, "application/json");
            response.headers().set(CONTENT_LENGTH,response.content().readableBytes());
            if (HttpHeaders.isKeepAlive(request)) {
                response.headers().set(CONNECTION, Values.KEEP_ALIVE);
            }
            ctx.write(response);
            ctx.flush();
        }
    }

    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        ctx.flush();
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        log.error(cause.getMessage());
        ctx.close();
    }

    public static void main(String[] args){
        List list = new ArrayList();
        list.add("------------------------------------");
        System.out.println("list--" + list);
        HttpServerInboundHandler hih = new HttpServerInboundHandler();
        hih.test(list);
        System.out.println("lst--" + list);
        list.add("------------------------------------");
    }

    public void test(List lst){
        lst = new ArrayList();
        lst.add("[dkkjkkjkjkj]");
        System.out.println("lst in test --" + lst);
       // return lst;
    }

}
