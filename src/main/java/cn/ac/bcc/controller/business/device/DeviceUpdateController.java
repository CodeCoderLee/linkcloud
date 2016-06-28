package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceUpdate;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.model.business.Version;
import cn.ac.bcc.service.business.device.DeviceUpdateService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.HelperUtils;
import cn.ac.bcc.util.ResponseData;
import cn.ac.bcc.util.helper.CommandMap;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * Created by lifm on 16/6/27.
 */
@Controller
@RequestMapping("deviceUpdate")
public class DeviceUpdateController extends BaseController<DeviceUpdate> {
    @Autowired
    private DeviceUpdateService deviceUpdateService;

    @RequestMapping("list")
    public String listUI() {
        return Common.BACKGROUND_PATH + "/business/device/deviceUpdateList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model,String serialNumbers) {
        model.addAttribute("serialNumbers", serialNumbers);
        return Common.BACKGROUND_PATH + "/business/device/addDeviceUpdate";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceUpdate deviceUpdate, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DeviceUpdate> list = deviceUpdateService.searchList(deviceUpdate.getSerialNumber());

        PageInfo<DeviceUpdate> pageInfo = new PageInfo<DeviceUpdate>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }

    @ResponseBody
    @RequestMapping("updateDeviceVersion")
    public String updateDeviceVersion(String serialNumbers, String versions) throws InterruptedException {
        String[] serialNumber = serialNumbers.split(",");
        String[] version = versions.split(",");
        JSONArray jsonArray = new JSONArray();
        for (int i= 0;i<version.length;i++) {
            String[] versionInfos = version[i].split("&");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", versionInfos[0]);
            jsonObject.put("name", versionInfos[1]);
            jsonObject.put("url", versionInfos[2]);
            jsonObject.put("type", versionInfos[3]);
            jsonObject.put("version", versionInfos[4]);
            jsonObject.put("fileName", versionInfos[5]);
            jsonObject.put("modelName", versionInfos[6]);
            jsonArray.add(jsonObject);

        }
        for (int i= 0;i<serialNumber.length;i++) {
            //心跳包下发指令
            JSONObject object = new JSONObject();
            object.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_UPDATE_VERSION);
            CommandMap.addCommand(serialNumber[i],object);

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("serialNumber", serialNumber[i]);
            jsonObject.put("updateTime", new Date().getTime());
            jsonObject.put("versions", jsonArray);
            DeviceUpdate deviceUpdate = new DeviceUpdate();
            deviceUpdate.setSerialNumber(serialNumber[i]);
            List<DeviceUpdate> list = deviceUpdateService.select(deviceUpdate);
            if (list.size() > 0) {
                //更新
                deviceUpdate.setUpdateInfo(jsonObject.toString());
                deviceUpdate.setId(list.get(0).getId());
                deviceUpdate.setIsUpdate(0);
                deviceUpdateService.updateByPrimaryKeySelective(deviceUpdate);
            } else {
                //插入
                deviceUpdate.setUpdateInfo(jsonObject.toString());
                deviceUpdate.setIsUpdate(0);
                deviceUpdateService.insert(deviceUpdate);
            }
        }
        return SUCCESS;
    }


}
