package cn.ac.bcc.controller.ws;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioDatagramChannel;

public class UDPServer {
	private static Channel channel = null;
	private static Logger log = Logger.getLogger(UDPServer.class);
	private static List list = null;
	private static EventLoopGroup group = null;
	private static Bootstrap b = null;

	public static Channel getChannel() {
		return channel;
	}
	public UDPServer(List list) {
		this.list = list;
		// TODO Auto-generated constructor stub
	}


	public void run(int port) throws Exception {
//		try {
			group = new NioEventLoopGroup();
			b = new Bootstrap();
			b.group(group).channel(NioDatagramChannel.class).option(ChannelOption.SO_BROADCAST, true)
					.handler(new UDPServerHandler(list));
			channel = b.bind(port).sync().channel();
//			channel.closeFuture().await();
//		} finally {
//			group.shutdownGracefully();
//		}
	}
	public void unbind(){
		log.debug("心跳服务关闭………………");
		channel.close();
		group.shutdownGracefully();
	}

	public static void main(String[] args) throws Exception {
		int port = 3333;
		if (args.length > 0) {
			try {
				port = Integer.parseInt(args[0]);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}

		}
		
		//TODOLee 从数据库中加载配置参数等相关信息
		log.debug("服务启动………………");
		new UDPServer(new LinkedList()).run(port);
	}

}