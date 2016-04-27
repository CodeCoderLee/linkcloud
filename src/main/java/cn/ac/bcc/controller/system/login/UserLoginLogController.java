package cn.ac.bcc.controller.system.login;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.UserLogin;
import cn.ac.bcc.service.system.login.UserLoginService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.batik.svggen.font.table.LigatureSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by lifm on 2016/2/2.
 */
@Controller
@RequestMapping("/userlogin/")
public class UserLoginLogController extends BaseController<UserLogin>{
    @Autowired
    private UserLoginService userLoginService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        return Common.BACKGROUND_PATH + "/system/userlogin/list";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(UserLogin userLogin, Integer limit, Integer offset) throws Exception {
        PageHelper.startPage(offset + 1, limit);
        Example example = getEqualsToExample(userLogin);
        List<UserLogin> list = userLoginService.selectByExample(example);
        PageInfo<UserLogin> pageInfo = new PageInfo<UserLogin>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }
}
