package cn.ac.bcc.controller.system.login;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.ac.bcc.util.Messenger;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Resources;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserLogin;
import cn.ac.bcc.service.system.resources.ResourcesService;
import cn.ac.bcc.service.system.role.RoleService;
import cn.ac.bcc.service.system.login.UserLoginService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.TreeObject;
import cn.ac.bcc.util.TreeUtil;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * Created by lifm on 2016/2/1.
 */
@Controller
@RequestMapping("/")
public class UserLoginController extends BaseController {

    @Autowired
    private UserLoginService userLoginService;


    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private ResourcesService resourcesService;



    @RequestMapping(value = "index", produces = "text/html; charset=utf-8")
    public String index(Model model, String base64) {
        System.out.println("index");
        Messenger messenger = new Messenger();
        if (!Common.isEmpty(base64)) {
            BASE64Decoder base64Decoder = new BASE64Decoder();
            try {
                byte[] bytes = base64Decoder.decodeBuffer(base64);
                String messengerStr = new String(bytes);
                JSONObject jsonObject = JSONObject.fromObject(messengerStr);
                messenger.setMsgPageSize(jsonObject.getInt("msgPageSize"));
                messenger.setMsgPageNumber(jsonObject.getInt("msgPageNumber"));
                messenger.setMsgSerialNumber(jsonObject.getString("msgSerialNumber"));
                messenger.setMsgUrl(jsonObject.getString("msgUrl"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


        JSONObject jsonObject = new JSONObject();
        try {
            HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            User user1 = (User) Common.findUserSession(request);
            System.out.println(user1.getId());
            if (user1 == null) {
                jsonObject.put("status", 0);
                //return jsonObject;
                return "/error";
            }
            getSession().setAttribute("user", user1);
            List<Resources> rs = resourcesService.findUserResourcess("" + user1.getId());
            System.out.println(rs.size());
            List<TreeObject> list = new ArrayList<TreeObject>();
            for (Resources r : rs) {
                String key = r.getReskey();
                //TODO 硬编码不可取，过滤掉前端的功能
                if (!"search".equals(key) && !"realtime".equals(key)) {
                    TreeObject ts = new TreeObject(r);
                    list.add(ts);
                }
            }
            TreeUtil treeUtil = new TreeUtil();
            List<TreeObject> ns = treeUtil.getChildTreeObjects(list, list.size() == 0 ? 0 : list.get(0).getParentId());
            System.out.println(JSONArray.fromObject(ns).toString());
            jsonObject.put("treelists", JSONArray.fromObject(ns).toString());
            jsonObject.put("user", user1);
            jsonObject.put("status", 1);
            System.out.println(JSONArray.fromObject(ns).toString());
            getSession().setAttribute("resourceList", ns);
            model.addAttribute("list", ns);
            // 登陆的信息回传页面
            model.addAttribute("user", user1);
            model.addAttribute("messenger", messenger);

            //return jsonObject;
            return "/index";
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("status", 0);
            //return jsonObject;
            return "/index";
        }
    }

    @RequestMapping(value = "toLogin", produces = "text/html; charset=utf-8")
    public String toLogin(HttpServletRequest request) {
        request.removeAttribute("error");
        return "/login";
    }


    @RequestMapping(value = "login", produces = "text/html; charset=utf-8")
    public String login(String username, String password, HttpServletRequest request) {
        JSONObject jsonObject = new JSONObject();
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setCharacterEncoding("UTF-8");
        try {
//            if (!request.getMethod().equals("POST")) {
//                request.setAttribute("error", "支持POST方法提交！");
//                jsonObject.put("status", 0);
//                jsonObject.put("message", "支持POST方法提交！");
//                try {
//                    PrintWriter printWriter = response.getWriter();
//                    printWriter.write("success_callback(" + net.sf.json.JSONObject.fromObject(jsonObject).toString() + ")");
//                    return;
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
            if (Common.isEmpty(username) || Common.isEmpty(password)) {
                request.setAttribute("error", "用户名或密码不能为空！");
                return "/login";
//                jsonObject.put("status", 0);
//                jsonObject.put("message", "用户名或密码不能为空！");
//                try {
//                    PrintWriter printWriter = response.getWriter();
//                    printWriter.write(JSONObject.fromObject(jsonObject).toString());
//                    return "/login";
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }

            }
            // 想要得到 SecurityUtils.getSubject()　的对象．．访问地址必须跟ｓｈｉｒｏ的拦截地址内．不然后会报空指针
            Subject user = SecurityUtils.getSubject();
            // 用户输入的账号和密码,,存到UsernamePasswordToken对象中..然后由shiro内部认证对比,
            // 认证执行者交由ShiroDbRealm中doGetAuthenticationInfo处理
            // 当以上认证成功后会向下执行,认证失败会抛出异常
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                user.login(token);
            } catch (LockedAccountException lae) {
                token.clear();
                request.setAttribute("error", "用户已经被锁定不能登录，请与管理员联系！");
//                jsonObject.put("status", 0);
//                jsonObject.put("message", "用户名或密码不能为空！");
//                try {
//                    PrintWriter printWriter = response.getWriter();
//                    printWriter.write(JSONObject.fromObject(jsonObject).toString());
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
                return "/login";
            } catch (ExcessiveAttemptsException e) {
                token.clear();
                request.setAttribute("error", "账号：" + username + " 登录失败次数过多,锁定10分钟!");
//                jsonObject.put("status", 0);
//                jsonObject.put("message", "账号：" + username + " 登录失败次数过多,锁定10分钟!");
//                try {
//                    PrintWriter printWriter = response.getWriter();
//                    printWriter.write(JSONObject.fromObject(jsonObject).toString());
//                } catch (IOException e1) {
//                    e1.printStackTrace();
//                }
                return "/login";
            } catch (AuthenticationException e) {
                token.clear();
                request.setAttribute("error", "用户或密码不正确！");
//                jsonObject.put("status", 0);
//                jsonObject.put("message", "用户或密码不正确！");
//                try {
//                    PrintWriter printWriter = response.getWriter();
//                    printWriter.write(JSONObject.fromObject(jsonObject).toString());
//                    return "/login";
//                } catch (IOException e2) {
//                    e2.printStackTrace();
//                }
                return "/login";
            }

            Session session = SecurityUtils.getSubject().getSession();
            UserLogin bccUserlogin = new UserLogin();
            bccUserlogin.setUserid(Integer.valueOf(session.getAttribute("userSessionId").toString()));
            bccUserlogin.setAccountname(username);
            bccUserlogin.setLoginip(session.getHost());
            bccUserlogin.setLogintime(new Date());
            bccUserlogin.setNickName(username);
            userLoginService.insert(bccUserlogin);
            request.removeAttribute("error");

//            User user1 = (User) Common.findUserSession(request);
//            List<Resources> rs = resourcesService.findUserResourcess("" + user1.getId());
//            //List<ResFormMap> mps = resourcesMapper.findByWhere(new ResFormMap());
//            List<TreeObject> list = new ArrayList<TreeObject>();
//            for (Resources r : rs) {
//                String key = r.getReskey();
//                //TODO 硬编码不可取，过滤掉前端的功能
//                if (!"search".equals(key) && !"realtime".equals(key)) {
//                    TreeObject ts = new TreeObject(r);
//                    list.add(ts);
//                }
//            }
//            TreeUtil treeUtil = new TreeUtil();
//            List<TreeObject> ns = treeUtil.getChildTreeObjects(list, list.size()==0?0:list.get(0).getParentId());
//            System.out.println(JSONArray.fromObject(ns).toString());
//            jsonObject.put("treelists", ns);
//            jsonObject.put("user", user1);
//            jsonObject.put("status", 1);
//            jsonObject.put("message", "登录成功！");
//            try {
//                PrintWriter printWriter = response.getWriter();
//                printWriter.write(JSONObject.fromObject(jsonObject).toString());
//                return "redirect:index.shtml";
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            response.addAttribute("list", ns);
//            // 登陆的信息回传页面
//            model.addAttribute("user", user);
//            return "/index";
//            user1 = userService.selectByPrimaryKey(user1.getId());

//            roleKey = bccUse

//            UserFormMap userForm = new UserFormMap();
//            userForm.put("id", session.getAttribute("userSessionId"));
//            UserFormMap user1 =  userMapper.findByUserId(userForm);
//            roleKey = user1.getStr("roleKey");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "登录异常，请联系管理员！");
//            jsonObject.put("status", 0);
//            jsonObject.put("message", "登录异常，请联系管理员！");
//            try {
//                PrintWriter printWriter = response.getWriter();
//                printWriter.write(JSONObject.fromObject(jsonObject).toString());
//            } catch (IOException e1) {
//                e1.printStackTrace();
//            }
            return "/login";
        }
//        //TODO 普通权限的用户仅能进入前台页面
//        if("simple".equals(roleKey)){
//            return "redirect:front.shtml";
//        }else{
        return "redirect:index.shtml";
//        }
    }

    @ResponseBody
    @RequestMapping(value = "logout")
    public JSONObject logout() {
        JSONObject jsonObject = new JSONObject();
        // 使用权限管理工具进行用户的退出，注销登录
        SecurityUtils.getSubject().logout(); // session
        // 会销毁，在SessionListener监听session销毁，清理权限缓存
        jsonObject.put("status", 1);
        jsonObject.put("message", "退出成功");
        return jsonObject;
    }
}
