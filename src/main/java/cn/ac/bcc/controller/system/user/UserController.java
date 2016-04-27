package cn.ac.bcc.controller.system.user;


import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.exception.SystemException;
import cn.ac.bcc.model.core.Role;
import cn.ac.bcc.model.core.UserRole;
import cn.ac.bcc.service.system.role.RoleService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Constants;
import cn.ac.bcc.util.PasswordHelper;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.elasticsearch.index.query.IdsQueryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.util.Common;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author sunqi 2016-2-3
 */
@Controller
@RequestMapping("/user/")
public class UserController extends BaseController<User> {

    @Autowired
    public UserService userService;

    @Autowired
    public UserRoleService userRoleService;

    @Autowired
    public RoleService roleService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/user/list";
    }

    @RequestMapping("addUI")
    public String addUI() {
        return Common.BACKGROUND_PATH + "/system/user/add";
    }

    @RequestMapping("modifyUI")
    public String modifyUI(Model model) {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            User user = userService.selectByPrimaryKey(Integer.valueOf(id));
            model.addAttribute("user", user);
        }
        return Common.BACKGROUND_PATH + "/system/user/edit";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(User user, Integer limit, Integer offset) throws Exception {
        /*查询未删除的数据*/
        user.setDeleteStatus(0);
        PageHelper.startPage(offset+1, limit);
        Example example = getEqualsToExample(user);
        List<User> list = userService.selectByExample(example);
        PageInfo<User> pageInfo = new PageInfo<User>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }

    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "用户管理", methods = "用户管理-新增用户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(User user) {
        try {
            if (user.getPassword() == null) {
                user.setPassword(Constants.USER_DEFAULT_PASSWORD);/*默认密码123456*/
            }
            PasswordHelper passwordHelper = new PasswordHelper();
            passwordHelper.encryptPassword(user);
            user.setCreatetime(new Date());
            user.setDeleteStatus(0);
            userService.insertUser(user);
            /*添加角色*/
            String roleId = getPara("roleId");
            modifyUserRole(user.getId(), roleId);
            return SUCCESS;
        } catch (Exception e) {
            throw new SystemException("添加账号异常");
        }

    }

    @ResponseBody
    @RequestMapping(value = "modify")
    @SystemLog(module = "用户管理", methods = "用户管理-修改用户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String modify(User user) {
        userService.updateByPrimaryKeySelective(user);
        /*添加角色*/
        String roleId = getPara("roleId");
        modifyUserRole(user.getId(), roleId);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping(value = "delete")
    @SystemLog(module = "用户管理", methods = "用户管理-删除用户")//凡需要处理业务逻辑的.都需要记录操作日志
    public String delete() {
        String userIds = getPara("ids");
        if (userIds != null && userIds != "") {
            String[] userId = userIds.split(",");
            for (String id : userId) {
                User user = new User();
                user.setId(Integer.valueOf(id));
                user.setDeleteStatus(1);
                userService.updateByPrimaryKeySelective(user);
            }
        }
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping(value = "isExist")
    public boolean isExist(User user) {
        if (userService.select(user).size() > 0) {
            return false;
        }
        return true;
    }

    @ResponseBody
    @RequestMapping(value = "getRoles")
    public JSONObject getRoles() {
        UserRole userRole = new UserRole();
        String userIdStr = getPara("userId");
        List<UserRole> myRoleList = new ArrayList<UserRole>();
        if (userIdStr != null && !userIdStr.equals("")) {
            userRole.setUserid(Integer.valueOf(userIdStr));
            myRoleList = userRoleService.select(userRole);
        }
        List<Role> roleList = roleService.selectAll();
        /*获取角色列表是,需要判断当前用户的权限,若为管理单位的联系人,则只能获取到系统中默认给分配的角色列表*/
        User user = (User) Common.findUserSession(getRequest());
        JSONArray jsonArray = new JSONArray();
        for (Role role : roleList) {
            JSONObject roleJson = new JSONObject();
            roleJson.put("key", role.getId());
            roleJson.put("title", role.getName());
            roleJson.put("description", role.getDescription());
            roleJson.put("chosen", false);
            for (UserRole userRoleTemp : myRoleList) {
                if (role.getId().equals(userRoleTemp.getRoleid())) {
                    roleJson.put("chosen", true);
                    myRoleList.remove(userRoleTemp);
                    break;
                }
            }
            jsonArray.add(roleJson);

        }
        JSONObject responseObject = new JSONObject();
        responseObject.put("transferData", jsonArray);
        return responseObject;
    }

    public void modifyUserRole(int userId, String roleId) {
        deleteUserRoleByUserId(userId);
        if (roleId != null && roleId != "") {
            String[] roleIds = roleId.split(",");
            for (int i = 0; i < roleIds.length; i++) {
                UserRole userRole = new UserRole();
                userRole.setUserid(userId);
                userRole.setRoleid(Integer.valueOf(roleIds[i]));
                userRoleService.insert(userRole);
            }
        }

    }

    public void deleteUserRoleByUserId(int userId) {
        UserRole userRole = new UserRole();
        userRole.setUserid(userId);
        userRoleService.delete(userRole);
    }

}