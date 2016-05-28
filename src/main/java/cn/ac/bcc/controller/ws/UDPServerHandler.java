package cn.ac.bcc.controller.ws;

import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import com.alibaba.fastjson.JSON;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelPromise;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.socket.DatagramPacket;
import org.apache.shiro.config.Ini;

public class UDPServerHandler extends SimpleChannelInboundHandler<DatagramPacket> {

    private static Logger log = Logger.getLogger(UDPServerHandler.class);
    private static int responseTimes = 0;
    private static List list = null;

    public UDPServerHandler(List list) throws UnknownHostException {
        UDPServerHandler.list = list;
      }

    public static int getResponseTimes() {
        int back = responseTimes;
        if (responseTimes == 2) {
            responseTimes = 0;
        }
        return back;
    }

    @Override
    protected void messageReceived(ChannelHandlerContext ctx, DatagramPacket packet) throws Exception {
        byte[] bytes = new byte[0];
        try {
            int len = packet.content().copy().readableBytes();

            bytes = new byte[len];
            packet.content().readBytes(bytes);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        ctx.close();
        cause.printStackTrace();

    }

    @Override
    public void close(ChannelHandlerContext ctx, ChannelPromise promise) throws Exception {
        // TODO Auto-generated method stub
        super.close(ctx, promise);
    }
}
