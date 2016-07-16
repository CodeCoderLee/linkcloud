package cn.ac.bcc.logAop;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.model.core.User;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.model.core.Log;
import cn.ac.bcc.service.system.log.LogService;
import cn.ac.bcc.util.Common;

/**
 * 切点类
 * 
 * @author LJN
 */
@Aspect
@Component
public class LogAopAction {
	// 本地异常日志记录对象
	private static final Logger logger = LoggerFactory.getLogger(LogAopAction.class);
	
	@Autowired
	private LogService logService;

	// Controller层切点
	@Pointcut("@annotation(cn.ac.bcc.annotation.SystemLog)")
	public void controllerAspect() {
		
	}

	/**
	 * 操作异常记录
	 * 
	 * @descript
	 * @param point
	 * @param e
	 * @author YYL
	 */
	@AfterThrowing(pointcut = "controllerAspect()", throwing = "e")
	public void doAfterThrowing(JoinPoint point, Throwable e) {
		Log logs = new Log();
		
		Map<String, String> map = null;
		String user = null;
		String ip = null;
		try {
			ip = SecurityUtils.getSubject().getSession().getHost();
		} catch (Exception ee) {
			ip = "无法获取登录用户Ip";
		}
		try {
			map = getControllerMethodDescription(point);
			// 登录名
			user = SecurityUtils.getSubject().getPrincipal().toString();
			if (Common.isEmpty(user)) {
				user = "无法获取登录用户信息！";
			}
		} catch (Exception ee) {
			user = "无法获取登录用户信息！";
		}

		logs.setAccountname(user);

		logs.setModule(map.get("module"));
		logs.setMethods("<font color=\"red\">执行方法异常:-->" + map.get("methods") + "</font>");
		logs.setDescription("<font color=\"red\">执行方法异常:-->" + e + "</font>");
		logs.setActiontime(0);
		logs.setUserip(ip);
		logs.setOpertime(new Date());

		try {
//			logService.insertLog(logs);
			logService.insertSelective(logs);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 *
	 * @param point
	 *            切点
	 */
	@Around("controllerAspect()")
	public Object doController(ProceedingJoinPoint point) {
		Object result = null;
		// 执行方法名
		String methodName = point.getSignature().getName();
		String className = point.getTarget().getClass().getSimpleName();
		Log logs = new Log();
		Object[] getArgs =point.getArgs();
		for (int i=0;i<getArgs.length;i++) {
			if (getArgs[i] instanceof Device) {
				Device device = (Device) getArgs[i];
				logs.setOperateObj(device.getSerialNumber());
			}
		}
		Map<String, String> map = null;
		String user = null;
		Long start = 0L;
		Long end = 0L;
		Long time = 0L;
		String ip = null;
		String nickName = "";
		try {
			ip = SecurityUtils.getSubject().getSession().getHost();
		} catch (Exception e) {
			ip = "无法获取登录用户Ip";
		}
		try {
			// 登录名
			user = SecurityUtils.getSubject().getPrincipal().toString();
			User user1 = (User)SecurityUtils.getSubject().getSession().getAttribute("user");
			if (Common.isEmpty(user)) {
				user = "无法获取登录用户信息！";
			}
			nickName = user1.getNickName();
		} catch (Exception e) {
			user = "无法获取登录用户信息！";
		}
		// 当前用户
		try {
			map = getControllerMethodDescription(point);
			// 执行方法所消耗的时间
			start = System.currentTimeMillis();
			result = point.proceed();
			end = System.currentTimeMillis();
			time = end - start;
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
		try {
			logs.setAccountname(user);
			logs.setModule(map.get("module"));
			logs.setMethods(map.get("methods"));
			logs.setDescription(map.get("description"));
			logs.setActiontime(Integer.parseInt(time.toString()));
			logs.setOpertime(new Date(start));
			logs.setUserip(ip);
			logs.setNickName(nickName);
			
			logService.insertSelective(logs);
			
			// *========控制台输出=========*//
			System.out.println("=====通知开始=====");
			System.out.println("请求方法:" + className + "." + methodName + "()");
			System.out.println("方法描述:" + map);
			System.out.println("请求IP:" + ip);
			System.out.println("=====通知结束=====");
		} catch (Exception e) {
			// 记录本地异常日志
			logger.error("====通知异常====");
			logger.error("异常信息:{}", e.getMessage());
		}
		return result;
	}

	/**
	 * 获取注解中对方法的描述信息 用于Controller层注解
	 *
	 * @param joinPoint 切点
	 * @return 方法描述
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map<String, String> getControllerMethodDescription(JoinPoint joinPoint) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String targetName = joinPoint.getTarget().getClass().getName();
		String methodName = joinPoint.getSignature().getName();
		Object[] arguments = joinPoint.getArgs();
		Class targetClass = Class.forName(targetName);
		Method[] methods = targetClass.getMethods();
		for (Method method : methods) {
			if (method.getName().equals(methodName)) {
				Class[] clazzs = method.getParameterTypes();
				if (clazzs.length == arguments.length) {
					map.put("module", method.getAnnotation(SystemLog.class).module());
					map.put("methods", method.getAnnotation(SystemLog.class).methods());
//					map.put("operateObj",method.getAnnotation(SystemLog.class).operateObj());
					String de = method.getAnnotation(SystemLog.class).description();
					if (Common.isEmpty(de))
						de = "执行成功!";
					map.put("description", de);
					break;
				}
			}
		}
		return map;
	}
}
