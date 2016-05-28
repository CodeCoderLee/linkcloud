package cn.ac.bcc.controller.system.role;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Role;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserRole;
import cn.ac.bcc.service.system.role.RoleService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.util.Common;

import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lifm on 2016/2/3.
 */
@Controller
@RequestMapping("/role/")
public class RoleController extends BaseController<Role> {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping("list")
    public String list(Model model) {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/system/role/list";
    }

    @ResponseBody
    @RequestMapping(value = "search")
    public ResponseData search(Role role, Integer limit, Integer offset) {
        PageHelper.offsetPage(offset , limit);
        Example example = getEqualsToExample(role);
        List<Role> list = roleService.selectByExample(example);
        PageInfo<Role> pageInfo = new PageInfo<Role>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }

    @RequestMapping(value = "modifyUI")
    public String modifyUI(Model model) {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            Role role = roleService.selectByPrimaryKey(Integer.valueOf(id));
            model.addAttribute("role", role);
        }
        return Common.BACKGROUND_PATH + "/system/role/edit";
    }

    @ResponseBody
    @RequestMapping(value = "modify")
    @SystemLog(module = "角色管理", methods = "角色管理-修改角色")//凡需要处理业务逻辑的.都需要记录操作日志
    public String modify(Role role) {
        roleService.updateByPrimaryKeySelective(role);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping(value = "add")
    @SystemLog(module = "角色管理", methods = "角色管理-添加角色")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Role role) {
        roleService.insert(role);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping(value = "delete")
    @SystemLog(module = "角色管理", methods = "角色管理-删除角色")//凡需要处理业务逻辑的.都需要记录操作日志
    public String delete() {
        String roleIds = getPara("ids");
        if (roleIds != null && roleIds != "") {
            String[] roleId = roleIds.split(",");
            for (String id : roleId) {
                Role role = new Role();
                role.setId(Integer.valueOf(id));
                roleService.delete(role);
            }
        }
        return SUCCESS;
    }


    @RequestMapping("addUI")
    public String addUI() throws Exception {
        return Common.BACKGROUND_PATH + "/system/role/add";
    }

    @ResponseBody
    @RequestMapping("addEntity")
    @Transactional(readOnly = false)//需要事务操作必须加入此注解
    @SystemLog(module = "系统管理", methods = "组管理-新增组")//凡需要处理业务逻辑的.都需要记录操作日志
    public String addEntity() throws Exception {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Role role = new Role();
        role.setDescription(request.getParameter("description"));
        role.setName(request.getParameter("name"));
        role.setRolekey(request.getParameter("roleKey"));
        role.setState(request.getParameter("state"));
        roleService.insert(role);
        return "success";
    }

    @RequestMapping("selectRole")
    public String selectRole(Model model) throws Exception {
        UserRole userRole = new UserRole();
        String userIdStr = getPara("userId");
        List<UserRole> myRoleList = new ArrayList<UserRole>();
        List<Role> roles = roleService.selectAll();
        if (userIdStr != null) {
            userRole.setUserid(Integer.valueOf(userIdStr));
            myRoleList = userRoleService.select(userRole);

            String myRoleId = "";
            for (UserRole ur : myRoleList) {
                myRoleId = myRoleId + ur.getRoleid() + ",";
            }
            myRoleId = Common.trimComma(myRoleId);
            model.addAttribute("txtRoleSelect", myRoleId);
        }
        List<Role> resultAllRoles = new ArrayList<Role>();
        List<Role> resultMyRoles = new ArrayList<Role>();
        for (Role role : roles) {
            /*标记是否角色已分配*/
            boolean flag = false;
            for (UserRole ur : myRoleList) {
                if (ur.getRoleid().equals(role.getId())) {
                    flag = true;
                    resultMyRoles.add(role);
                }
            }
            if (!flag) {
                resultAllRoles.add(role);
            }

        }
        model.addAttribute("role", resultAllRoles);
        model.addAttribute("userRole", resultMyRoles);
        return Common.BACKGROUND_PATH + "/system/user/roleSelect";
    }
}
