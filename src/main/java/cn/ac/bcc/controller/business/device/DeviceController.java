package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.exception.SystemException;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 设备管理
 * Created by bcc on 16/5/28.
 */
@Controller
@RequestMapping("/device/")
public class DeviceController extends BaseController<Device> {

    @Autowired
    private DeviceService deviceService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/business/device/list";
    }

    @RequestMapping("debugList")
    public String debugListUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/business/device/debugList";
    }

    @RequestMapping("addUI")
    public String addUI() {
        return Common.BACKGROUND_PATH + "/business/device/add";
    }

    @RequestMapping("modifyUI")
    public String modifyUI(Model model) {
        String id = getPara("id");
        if (Common.isNotEmpty(id)) {
            Device device = deviceService.selectByPrimaryKey(Integer.valueOf(id));
            model.addAttribute("device", device);
        }
        return Common.BACKGROUND_PATH + "/business/device/edit";
    }


    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Device device, Integer limit, Integer offset) throws Exception {
        PageHelper.offsetPage(offset, limit);
        Example example = getEqualsToExample(device);
        List<Device> list = deviceService.selectByExample(example);
        PageInfo<Device> pageInfo = new PageInfo<Device>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }


    @ResponseBody
    @RequestMapping("searchDebug")
    public ResponseData searchDebug(Device device, Integer pageNum, Integer pageSize) throws Exception {
        Integer userId = Common.findUserSessionId(getRequest());
        device.setRegisterAccount(userId);
        device.setDebugAccount(userId);
        device.setStatus(1);
        PageHelper.startPage(pageNum, pageSize);
        List<Device> list = deviceService.selectDebugDevice(device);
        PageInfo<Device> pageInfo = new PageInfo<Device>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
//        return responseData;
    }


    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "设备管理", methods = "设备管理-设备注册")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Device device) {
        try {
            if (Common.isEmpty(device.getPrivateKey())) {
                device.setPrivateKey(new Date().getTime() + new Random().nextInt(100000) + "");
            }
            device.setRegisterTime(new Date());
            Integer userId = Common.findUserSessionId(getRequest());
            device.setRegisterAccount(userId);
            device.setDebugAccount(userId);
            device.setStatus(1);
            deviceService.insert(device);
            return SUCCESS;
        } catch (Exception e) {
            throw new SystemException("注册设备异常");
        }

    }


    @ResponseBody
    @RequestMapping(value = "delete")
    @SystemLog(module = "设备管理", methods = "设备管理-删除设备")//凡需要处理业务逻辑的.都需要记录操作日志
    public String delete() {
        String deviceIds = getPara("ids");
        if (deviceIds != null && deviceIds != "") {
            String[] deviceId = deviceIds.split(",");
            for (String id : deviceId) {
                deviceService.deleteByPrimaryKey(Integer.valueOf(id));
            }
        }
        return SUCCESS;
    }


    @ResponseBody
    @RequestMapping(value = "isExist")
    public boolean isExist(Device device) {
        if (deviceService.select(device).size() > 0) {
            return false;
        }
        return true;
    }


}
