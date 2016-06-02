package cn.ac.bcc.controller.business.company;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Company;
import cn.ac.bcc.service.business.company.CompanyService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * Created by bcc on 16/5/22.
 */
@Controller
@RequestMapping("/company/")
public class CompanyController extends BaseController<Company> {

    @Autowired
    private CompanyService companyService;


    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/company/list";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String entrance) {
        model.addAttribute("entrance", entrance);
        return Common.BACKGROUND_PATH + "/business/company/add";
    }


    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Company company, Integer limit, Integer offset) throws Exception {
        /*查询未删除的数据*/
        PageHelper.offsetPage(offset, limit);
        Example example = getEqualsToExample(company);
        List<Company> list = companyService.selectByExample(example);
        PageInfo<Company> pageInfo = new PageInfo<Company>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }


    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "企业管理", methods = "企业管理-添加企业")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Company company) {
        try {
            companyService.insert(company);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }

    }

    @ResponseBody
    @RequestMapping("searchCompanyByAreaAndIndustry")
    public List<Company> searchCompanyByAreaAndIndustry(Company company){
        return companyService.select(company);
    }
}
