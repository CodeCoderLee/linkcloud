package cn.ac.bcc.controller.business.industry;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Industry;
import cn.ac.bcc.service.business.industry.IndustryService;
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
@RequestMapping("/industry/")
public class IndustryController extends BaseController<Industry> {

    @Autowired
    private IndustryService industryService;


    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/industry/list";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Industry industry, Integer limit, Integer offset) throws Exception {
        /*查询未删除的数据*/
        PageHelper.offsetPage(offset, limit);
        Example example = getEqualsToExample(industry);
        List<Industry> list = industryService.selectByExample(example);
        PageInfo<Industry> pageInfo = new PageInfo<Industry>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }
}
