package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.mapper.business.DeviceApplyMapper;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.model.business.DeviceApply;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.service.business.device.DeviceApplyService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.service.business.device.DeviceUseApplyService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by bcc on 16/5/30.
 */
@Controller
@RequestMapping("/deviceUseApply/")
public class DeviceUseApplyController extends BaseController<DeviceUseApply> {

    @Autowired
    private DeviceUseApplyService deviceUseApplyService;

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private DeviceApplyService deviceApplyService;

    @RequestMapping("list")
    public String listUI() {
        return Common.BACKGROUND_PATH + "/business/device/useApplyList";
    }

    @RequestMapping("addUI")
    public String addUI() {
        return Common.BACKGROUND_PATH + "/business/device/addUseApply";
    }

    @RequestMapping("stockOutUI")
    public String stockOutUI(Model model,HttpServletRequest request) {
        Device device = new Device();
        device.setStatus(4);
        List<Device> deviceList = deviceService.select(device);
        int applyId = Integer.parseInt(request.getParameter("id"));

        model.addAttribute("deviceList",deviceList);
        model.addAttribute("applyId",applyId);
        return Common.BACKGROUND_PATH + "/business/device/deviceStockOut";
    }

    /**
     * 设备出库
     * @return
     */
    @RequestMapping("stockOut")
    @ResponseBody
    public String stockOut(HttpServletRequest request){
        int applyId = Integer.parseInt(request.getParameter("id"));
        String[] deviceNumbers = request.getParameterValues("deviceNumbers");
        if(deviceNumbers!=null || deviceNumbers.length>0){
            for(int i=0;i<deviceNumbers.length;i++){
                DeviceApply deviceApply = new DeviceApply();
                String deviceNumber = deviceNumbers[i];
                deviceApply.setApplyId(applyId);
                deviceApply.setSerialNumber(deviceNumber);

                deviceApplyService.insertSelective(deviceApply);


                DeviceUseApply deviceUseApply = deviceUseApplyService.selectByPrimaryKey(applyId);
                deviceUseApply.setIsStockOut(1);
                deviceUseApplyService.updateByPrimaryKeySelective(deviceUseApply);
                int status = deviceUseApply.getStatus()==null?0:deviceUseApply.getStatus();
                if(status!=0){
                    String number = deviceApply.getSerialNumber();
                    deviceService.updateStatusByNum(number,status);
                }
            }
        }

        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceUseApply deviceUseApply, Integer pageNum, Integer pageSize) {
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

    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "使用申请", methods = "使用申请-添加申请")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(DeviceUseApply deviceUseApply) {
        deviceUseApply.setIsStockOut(0);
        deviceUseApply.setApplyTime(new Date());
        deviceUseApplyService.insert(deviceUseApply);
        return SUCCESS;
    }
}
