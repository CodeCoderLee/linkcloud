package cn.ac.bcc.controller.ws;

import java.net.InetSocketAddress;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.socket.DatagramPacket;

public class UDPSender {
    public static void SendResetCmd() {
        try {
            Channel channel = UDPServer.getChannel();
            if (channel != null) {
                byte LEN = 0x02;
                byte FUNC = (byte) 0xf1;
                byte SUM = (byte) ((LEN + FUNC) & 0xFF);

                ByteBuf buffer = Unpooled.copiedBuffer(new byte[]{LEN, FUNC, SUM});
//                DatagramPacket msg = new DatagramPacket(buffer,new InetSocketAddress(Init.MOBILE_DEVICE_IP, Init.MOBILE_DEVICE_PORT));
//                channel.writeAndFlush(msg).sync();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}