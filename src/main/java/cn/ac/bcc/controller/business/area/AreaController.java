package cn.ac.bcc.controller.business.area;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Area;
import cn.ac.bcc.service.business.area.AreaService;
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
 * Created by bcc on 16/5/16.
 */
@Controller
@RequestMapping("/area/")
public class AreaController extends BaseController<Area>{

    @Autowired
    private AreaService areaService;


    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/area/list";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Area area, Integer limit, Integer offset) throws Exception {
        /*查询未删除的数据*/
        PageHelper.startPage(offset+1, limit);
        Example example = getEqualsToExample(area);
        List<Area> list = areaService.selectByExample(example);
        PageInfo<Area> pageInfo = new PageInfo<Area>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }
}
