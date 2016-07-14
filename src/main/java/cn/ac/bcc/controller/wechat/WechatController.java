package cn.ac.bcc.controller.wechat;

import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserLogin;
import cn.ac.bcc.service.system.login.UserLoginService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.*;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

/**
 * Created by bcc on 16/4/16.
 */
@Controller
@RequestMapping("/wechat/")
public class WechatController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserLoginService userLoginService;

    public static boolean flag = true;

    private final String domain = "http://www.linkedcloud.com.cn";

    /*验证微信接口*/
    @RequestMapping(value = "token", method = RequestMethod.GET)
    public void token(HttpServletRequest request, HttpServletResponse response, String signature, String timestamp, String nonce, String echostr) throws NoSuchAlgorithmException {
        String tmpStr = SHAUtil.getSHA1(Constants.TOKEN, timestamp, nonce);

        System.out.println("+++++++++++++++++++++tmpStr   " + tmpStr);
        System.out.println("---------------------signature   " + signature);

        if (tmpStr.equals(signature)) {
            request.getSession().setAttribute(Constants.ACCESS_TOKEN, Constants.TOKEN);
            try {
                PrintWriter printWriter = response.getWriter();
                printWriter.print(echostr);
                printWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "authen", method = RequestMethod.GET)
    public String authen(HttpServletRequest request, Model model, String uri) throws UnsupportedEncodingException {
        StringBuilder url = new StringBuilder();
        url.append("https://open.weixin.qq.com/connect/oauth2/authorize?appid=").append(WechatUtil.getAppId());
        url.append("&redirect_uri=");//http%3a%2f%2flinkcloud.tunnel.qydev.com%2fwechat%2findex.shtml%3furl%3d%2findex
        url.append(URLEncoder.encode(domain, "utf-8"));
        url.append(URLEncoder.encode("/wechat/index.shtml?url=", "utf-8")).append(URLEncoder.encode(uri, "utf-8"));
        url.append("&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
        return "redirect:" + url;
    }

    /**
     * 演示空间地址 /space/show.shtml
     * 个人空间地址 /index.shtml
     * 设备空间地址 /device/{number}.shtml
     *
     * @param request
     * @param model
     * @param url
     * @return
     */
    @RequestMapping("index")
    public String index(HttpServletRequest request, Model model, String url) {
        String code = request.getParameter("code");
        String isWeb = request.getParameter("isWeb");
        JSONObject jsonObject;
        if (Common.isEmpty(isWeb)) {
            jsonObject = WechatUtil.getOauthAccessToken(code);
        } else {
            jsonObject = WechatUtil.getWebOauthAccessToken(code);
        }
        JSONObject userInfo = WechatUtil.getOauthUserInfo(jsonObject.getString("access_token"), jsonObject.getString("openid"));
        System.out.println("userInfo===" + userInfo.toString());
        User user = new User();
        /*通过openId获取user信息*/
        user.setUnionId(userInfo.getString("unionid"));
        user.setDeleteStatus(0);
        List<User> users = userService.select(user);
        if (users.size() < 1) {//根据unionid查找用户，兼容以前没有存unionid的情况
            //微信公众帐号和网页都没有登陆过
                /*如果不存在该用户,那么添加新用户*/
            user.setCity(userInfo.containsKey("city") ? userInfo.getString("city") : null);
            user.setCountry(userInfo.containsKey("country") ? userInfo.getString("country") : null);
            user.setCreatetime(new Date());
            user.setAccountname(user.getUnionId());
            user.setOpenId(userInfo.getString("openid"));
            user.setDeleteStatus(0);
            user.setGroupId(userInfo.containsKey("groupid") ? userInfo.getInt("groupid") : null);
            user.setHeadImgUrl(userInfo.containsKey("headimgurl") ? userInfo.getString("headimgurl") : null);
            user.setNickName(userInfo.containsKey("nickname") ? userInfo.getString("nickname") : null);
            user.setProvince(userInfo.containsKey("province") ? userInfo.getString("province") : null);
            user.setSex(userInfo.containsKey("sex") ? userInfo.getInt("sex") : null);
            user.setUnionId(userInfo.containsKey("unionid") ? userInfo.getString("unionid") : null);
            user.setRemark(userInfo.containsKey("remark") ? userInfo.getString("remark") : null);
            user.setPassword(Constants.USER_DEFAULT_PASSWORD);
            PasswordHelper passwordHelper = new PasswordHelper();
            passwordHelper.encryptPassword(user);
            userService.insert(user);
        } else {
            user = users.get(0);
        }
//        user.setOpenId(userInfo.getString("openid"));
//        List<User> users = userService.select(user);
//        if (users.size() < 1) {
//
//        }else {
//            user = users.get(0);
//        }

        request.getContextPath();
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setCharacterEncoding("UTF-8");
        try {
            if (Common.isEmpty(user.getAccountname()) || Common.isEmpty(user.getPassword())) {
                request.setAttribute("error", "用户名或密码不能为空！");
                return "/login";

            }
            // 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
            Subject user1 = SecurityUtils.getSubject();
            // 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
            // 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
            // 当以上认证成功后会向下执行,认证失败会抛出异常
            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccountname(), Constants.USER_DEFAULT_PASSWORD);
            try {
                user1.login(token);
            } catch (LockedAccountException lae) {
                token.clear();
                request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
                return "/login";
            } catch (ExcessiveAttemptsException e) {
                token.clear();
                request.setAttribute("error", "账号：" + user.getAccountname() + " 登录失败次数过多,锁定10分钟!");
                return "/login";
            } catch (AuthenticationException e) {
                token.clear();
                request.setAttribute("error", "用户或密码不正确！");
                return "/login";
            }

            Session session = SecurityUtils.getSubject().getSession();
            UserLogin bccUserlogin = new UserLogin();
            bccUserlogin.setUserid(Integer.valueOf(session.getAttribute("userSessionId").toString()));
            bccUserlogin.setAccountname(user.getAccountname());
            bccUserlogin.setLoginip(session.getHost());
            bccUserlogin.setLogintime(new Date());
            userLoginService.insert(bccUserlogin);
            request.removeAttribute("error");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "登录异常，请联系管理员！");
            return "/login";
        }
        //TODO 普通权限的用户仅能进入前台页面
        //return "redirect:/space/device/index.shtml?openId="+user.getOpenId();
        model.addAttribute("openId", user.getOpenId());
        if (!Common.isEmpty(isWeb)) {
            return "redirect:/index.shtml";
        }
        return "redirect:" + url + ".shtml";
    }
//
//    @RequestMapping("goIndex")
//    public String goIndex(Model model,String openId)
//    {
//        model.addAttribute("openId",openId);
//        return Common.BACKGROUND_PATH + "/wechat/index";
//    }

    @RequestMapping("getOpenId")
    public String getOpenId(HttpServletRequest request, Model model) {
        String code = request.getParameter("code");
        JSONObject jsonObject = WechatUtil.getOauthAccessToken(code);
        JSONObject userInfo = WechatUtil.getOauthUserInfo(jsonObject.getString("access_token"), jsonObject.getString("openid"));
        User user = new User();
        /*通过openId获取user信息*/
        user.setOpenId(userInfo.getString("openid"));
        List<User> users = userService.select(user);
        if (users.size() < 1) {
            /*如果不存在该用户,那么添加新用户*/
            user.setCity(userInfo.containsKey("city") ? userInfo.getString("city") : null);
            user.setCountry(userInfo.containsKey("country") ? userInfo.getString("country") : null);
            user.setCreatetime(new Date());
            user.setAccountname(user.getOpenId());
            user.setDeleteStatus(0);
            user.setGroupId(userInfo.containsKey("groupid") ? userInfo.getInt("groupid") : null);
            user.setHeadImgUrl(userInfo.containsKey("headimgurl") ? userInfo.getString("headimgurl") : null);
            user.setNickName(userInfo.containsKey("nickname") ? userInfo.getString("nickname") : null);
            user.setProvince(userInfo.containsKey("province") ? userInfo.getString("province") : null);
            user.setSex(userInfo.containsKey("sex") ? userInfo.getInt("sex") : null);
            user.setUnionId(userInfo.containsKey("unionid") ? userInfo.getString("unionid") : null);
            user.setRemark(userInfo.containsKey("remark") ? userInfo.getString("remark") : null);
            user.setPassword(Constants.USER_DEFAULT_PASSWORD);
            PasswordHelper passwordHelper = new PasswordHelper();
            passwordHelper.encryptPassword(user);
            userService.insert(user);
        } else {
            user = users.get(0);
        }

        request.getContextPath();
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setCharacterEncoding("UTF-8");
        try {
            if (Common.isEmpty(user.getAccountname()) || Common.isEmpty(user.getPassword())) {
                request.setAttribute("error", "用户名或密码不能为空！");
                return "/login";

            }
            // 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
            Subject user1 = SecurityUtils.getSubject();
            // 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
            // 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
            // 当以上认证成功后会向下执行,认证失败会抛出异常
            UsernamePasswordToken token = new UsernamePasswordToken(user.getAccountname(), Constants.USER_DEFAULT_PASSWORD);
            try {
                user1.login(token);
            } catch (LockedAccountException lae) {
                token.clear();
                request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
                return "/login";
            } catch (ExcessiveAttemptsException e) {
                token.clear();
                request.setAttribute("error", "账号：" + user.getAccountname() + " 登录失败次数过多,锁定10分钟!");
                return "/login";
            } catch (AuthenticationException e) {
                token.clear();
                request.setAttribute("error", "用户或密码不正确！");
                return "/login";
            }

            Session session = SecurityUtils.getSubject().getSession();
            UserLogin bccUserlogin = new UserLogin();
            bccUserlogin.setUserid(Integer.valueOf(session.getAttribute("userSessionId").toString()));
            bccUserlogin.setAccountname(user.getAccountname());
            bccUserlogin.setLoginip(session.getHost());
            bccUserlogin.setLogintime(new Date());
            userLoginService.insert(bccUserlogin);
            request.removeAttribute("error");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "登录异常，请联系管理员！");
            return "/login";
        }
        //TODO 普通权限的用户仅能进入前台页面
        //return "redirect:/space/device/index.shtml?openId="+user.getOpenId();
        model.addAttribute("openId", user.getOpenId());
        String type = request.getParameter("type");
        if (!Common.isEmpty(type)) {
            if (type.equals("1")) {
                return Common.BACKGROUND_PATH + "/wechat/index";
            } else if (type.equals("2")) {
                return "redirect:/index.shtml";
            }
        }
        return Common.BACKGROUND_PATH + "/wechat/index";
    }


    @ResponseBody
    @RequestMapping(value = "token", method = RequestMethod.POST)
    public void token(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter printWriter = response.getWriter();
            String accessToken = WechatUtil.getAccessToken();
            InputStream inputStream = request.getInputStream();
            SAXReader reader = new SAXReader();

            Document document = reader.read(inputStream);
            System.out.println(document.toString());
            Element element = document.getRootElement();
            System.out.println(element.getName() + "====" + element.getText());
            List<Element> elements = element.elements();
            String event = "";
            String openId = "";
            String msgType = "";
            for (Element e : elements) {
                if (e.getName().equals("FromUserName")) {
                    openId = e.getText();
                }
                if (e.getName().equals("Event")) {
                    event = e.getText();
                }
                if (e.getName().equals("MsgType")) {
                    msgType = e.getText();
                }
                System.out.println(e.getName() + "===" + e.getText());
            }
            inputStream.close();
            if (event.equals("CLICK") || msgType.equals("text")) {
                Document responseDOM = DocumentHelper.createDocument();
                Element root = responseDOM.addElement("xml");
                Element toUserName = root.addElement("ToUserName");
                toUserName.addText(openId);
                Element fromUserName = root.addElement("FromUserName");
                fromUserName.addText("gh_074d2507edae");
                Element createTime = root.addElement("CreateTime");
                createTime.addText("123456789");
                Element msgTypeElement = root.addElement("MsgType");
                msgTypeElement.addText("text");
                Element content = root.addElement("Content");
                JSONObject userInfo = WechatUtil.getUserInfo(openId);
                content.addText(userInfo.getString("nickname") + ",你好");
                String xmlString = responseDOM.asXML();
                System.out.println("xmlString====" + xmlString);
                printWriter.write(xmlString);
                printWriter.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }

    }


}
