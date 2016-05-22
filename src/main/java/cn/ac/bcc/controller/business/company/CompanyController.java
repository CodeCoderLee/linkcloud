package cn.ac.bcc.controller.business.company;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Company;
import cn.ac.bcc.service.business.company.CompanyService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
