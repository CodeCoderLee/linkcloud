package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.model.business.DeviceUpdate;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.model.business.Version;
import cn.ac.bcc.service.business.device.DeviceUpdateService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.HelperUtils;
import cn.ac.bcc.util.Messenger;
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

import javax.servlet.http.HttpServletRequest;
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
    public String listUI(Model model, HttpServletRequest request,Messenger messenger) {
//        String msgEntrance = request.getParameter("msgEntrance");
//        String msgSerialNumber = request.getParameter("msgSerialNumber");
//        int msgPageSize = request.getParameter("msgPageSize") == null ? 0 : Integer.parseInt(request.getParameter("msgPageSize"));
//        int msgPageNumber = request.getParameter("msgPageNumber") == null ? 0 : Integer.parseInt(request.getParameter("msgPageNumber"));
//        Messenger messenger = new Messenger();
//        messenger.setMsgEntrance(msgEntrance);
//        messenger.setMsgSerialNumber(msgSerialNumber);
//        messenger.setMsgPageNumber(msgPageNumber);
//        messenger.setMsgPageSize(msgPageSize);

        model.addAttribute("messenger", messenger);
        return Common.BACKGROUND_PATH + "/business/device/deviceUpdateList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String serialNumbers, HttpServletRequest request,Messenger messenger) {
        model.addAttribute("serialNumbers", serialNumbers);
        model.addAttribute("messenger", messenger);
        return Common.BACKGROUND_PATH + "/business/device/addDeviceUpdate";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceUpdate deviceUpdate, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        String serialNumber = deviceUpdate.getSerialNumber();
        if (Common.isEmpty(serialNumber) && getSession().getAttribute("serialNumber") != null) {
            deviceUpdate.setSerialNumber(getSession().getAttribute("serialNumber").toString());
        }
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
    @SystemLog(module = "设备管理", methods = "设备管理-设备升级")
    public String updateDeviceVersion(String serialNumbers, Device device, String versions,HttpServletRequest request) throws InterruptedException {
        String msgEntrance = request.getParameter("msgEntrance")==null ? "":request.getParameter("msgEntrance");
        String[] serialNumber = serialNumbers.split(",");
        String[] version = versions.split(",");
        JSONArray jsonArray = new JSONArray();
        for (int i = 0; i < version.length; i++) {
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
        for (int i = 0; i < serialNumber.length; i++) {
            //心跳包下发指令
            JSONObject object = new JSONObject();
            object.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_UPDATE_VERSION);
            CommandMap.addCommand(serialNumber[i], object);

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
        if(msgEntrance.equals("debug")){
            return "debug";
        }else
            return SUCCESS;
    }


}
