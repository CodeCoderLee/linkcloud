package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.service.business.device.DeviceUseApplyService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by bcc on 16/5/30.
 */
@Controller
@RequestMapping("/deviceUseApply/")
public class DeviceUseApplyController extends BaseController<DeviceUseApply> {

    @Autowired
    private DeviceUseApplyService deviceUseApplyService;

    @RequestMapping("list")
    public String listUI(){
        return Common.BACKGROUND_PATH + "/business/device/useApplyList";
    }

    @RequestMapping("addUI")
    public String addUI(){
        return Common.BACKGROUND_PATH + "/business/device/addUseApply";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceUseApply deviceUseApply, Integer pageNum, Integer pageSize){
        PageHelper.startPage(pageNum, pageSize);
        List<DeviceUseApply> list = deviceUseApplyService.selectDeviceUseApply(deviceUseApply);
        PageInfo<DeviceUseApply> pageInfo = new PageInfo<DeviceUseApply>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }
}
