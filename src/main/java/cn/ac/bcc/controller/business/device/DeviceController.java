package cn.ac.bcc.controller.business.device;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.exception.SystemException;
import cn.ac.bcc.model.business.Area;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.model.business.DeviceView;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.service.business.area.AreaService;
import cn.ac.bcc.service.business.device.DeviceViewService;
import cn.ac.bcc.util.helper.*;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.HelperUtils;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 设备管理
 * Created by bcc on 16/5/28.
 */
@Controller
@RequestMapping("/device/")
public class DeviceController extends BaseController<Device> {

    @Autowired
    private DeviceService deviceService;

    @Autowired
    DeviceAuthenService deviceAuthenService;

    @Autowired
    private DeviceViewService deviceViewService;

    @Autowired
    private AreaService areaService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/business/device/list";
    }

    @RequestMapping("debugList")
    public String debugListUI(Model model) throws Exception {

        model.addAttribute("res", findByRes());
        model.addAttribute("openId",((User)Common.findUserSession(getRequest())).getOpenId());
        return Common.BACKGROUND_PATH + "/business/device/debugList";
    }

    @RequestMapping("showList")
    public String showListUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("openId",((User)Common.findUserSession(getRequest())).getOpenId());
        return Common.BACKGROUND_PATH + "/business/device/showList";
    }

    @RequestMapping("settingList")
    public String settingListUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        /*向前台传递资源id,为了传递给扫频页面,在扫频页面判断是否有设置默认频点的权限*/
        model.addAttribute("resId", getPara("id"));
        model.addAttribute("openId",((User)Common.findUserSession(getRequest())).getOpenId());
        return Common.BACKGROUND_PATH + "/business/device/deviceSettingList";
    }

    @RequestMapping("scanFrequencyUI")
    public String scanFrequencyUI(Model model,String serialNumber) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("openId",((User)Common.findUserSession(getRequest())).getOpenId());
        model.addAttribute("serialNumber", serialNumber);
        Device device = new Device();
        device.setSerialNumber(serialNumber);
        List<Device> devices = deviceService.select(device);
        model.addAttribute("areaId", devices.size() > 0 ? devices.get(0).getAreaId() : null);
//        Map<String, String> map = new HashMap<String,String>();
//        map.put(HelperUtils.KEY_FRQ, HelperUtils.KEY_FRQ);
//        JSONObject object = new JSONObject();
//        object.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_SCANFRQ);
//        CommandMap.addCommand(serialNumber,object);
        return Common.BACKGROUND_PATH + "/business/device/scanFrequency";
    }

    @ResponseBody
    @RequestMapping("startScanFrequency")
    public String startScanFrequency(String serialNumber) throws Exception {
//        Map<String, String> map = new HashMap<String,String>();
//        map.put(HelperUtils.KEY_FRQ, HelperUtils.KEY_FRQ);
        JSONObject object = new JSONObject();
        object.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_SCANFRQ);
        CommandMap.addCommand(serialNumber,object);
//        ScanFreqInfos scanFreqInfos = new ScanFreqInfos();
//        scanFreqInfos.setFrqsNum(3);
//        scanFreqInfos.setProgress(20);
//        scanFreqInfos.setScanEnded(true);
//        List<Freq> freqs = new ArrayList<Freq>();
//        Freq freq = new Freq();
//        freq.setFrq("111");
//        freq.setSnr(10);
//        freq.setStrength(80);
//        List<ScanFreqProgram> scanFreqPrograms = new ArrayList<ScanFreqProgram>();
//        ScanFreqProgram scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-1");
//        scanFreqProgram.setPid("CCTV-1");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-2");
//        scanFreqProgram.setPid("CCTV-2");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-3");
//        scanFreqProgram.setPid("CCTV-3");
//        scanFreqPrograms.add(scanFreqProgram);
//        freq.setProgramList(scanFreqPrograms);
//        freqs.add(freq);
//
//        freq = new Freq();
//        freq.setFrq("222");
//        freq.setSnr(11);
//        freq.setStrength(88);
//        scanFreqPrograms = new ArrayList<ScanFreqProgram>();
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-4");
//        scanFreqProgram.setPid("CCTV-4");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-5");
//        scanFreqProgram.setPid("CCTV-5");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-6");
//        scanFreqProgram.setPid("CCTV-6");
//        scanFreqPrograms.add(scanFreqProgram);
//        freq.setProgramList(scanFreqPrograms);
//        freqs.add(freq);
//
//        freq = new Freq();
//        freq.setFrq("333");
//        freq.setSnr(12);
//        freq.setStrength(78);
//        scanFreqPrograms = new ArrayList<ScanFreqProgram>();
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-7");
//        scanFreqProgram.setPid("CCTV-7");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-8");
//        scanFreqProgram.setPid("CCTV-8");
//        scanFreqPrograms.add(scanFreqProgram);
//        scanFreqProgram = new ScanFreqProgram();
//        scanFreqProgram.setName("CCTV-9");
//        scanFreqProgram.setPid("CCTV-9");
//        scanFreqPrograms.add(scanFreqProgram);
//        freq.setProgramList(scanFreqPrograms);
//        freqs.add(freq);
//
//        scanFreqInfos.setFreqList(freqs);
//        MemoryMap.add(serialNumber,scanFreqInfos);
        return SUCCESS;
    }

    @RequestMapping("deviceSetting")
    public String deviceSetting(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        model.addAttribute("openId",((User)Common.findUserSession(getRequest())).getOpenId());
        return Common.BACKGROUND_PATH + "/business/device/deviceSetting";
    }

    @RequestMapping("addUI")
    public String addUI() {
        return Common.BACKGROUND_PATH + "/business/device/add";
    }

    @RequestMapping("modifyUI")
    public String modifyUI(Model model) {
        String id = getPara("id");
        DeviceView deviceView = new DeviceView();
        if (Common.isNotEmpty(id)) {
            deviceView.setId(Integer.valueOf(id));
            DeviceView device = deviceViewService.selectOne(deviceView);
            model.addAttribute("device", device);
        }
        return Common.BACKGROUND_PATH + "/business/device/edit";
    }


    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceView deviceView, Integer limit, Integer offset) throws Exception {
        PageHelper.offsetPage(offset, limit);
        Example example = getEqualsToExample(deviceView,deviceView.getClass());
        List<DeviceView> list = deviceViewService.selectByExample(example);
        PageInfo<DeviceView> pageInfo = new PageInfo<DeviceView>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }


    @ResponseBody
    @RequestMapping("searchByPage")
    public ResponseData searchByPage(Device device, Integer pageNum, Integer pageSize) throws Exception {
//        if (device.getStatus() != null && device.getStatus() == 1) {
//            Integer userId = Common.findUserSessionId(getRequest());
//            device.setRegisterAccount(userId);
//            device.setDebugAccount(userId);
//        }
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
    @RequestMapping("searchDeviceSettingList")
    public ResponseData searchDeviceSettingList(Device device, Integer pageNum, Integer pageSize){
        Integer userId = Common.findUserSessionId(getRequest());
//        device.setRegisterAccount(userId);
//        device.setDebugAccount(userId);
        PageHelper.startPage(pageNum, pageSize);
        List<Device> list = deviceService.selectSettingDevice(userId, device);
        PageInfo<Device> pageInfo = new PageInfo<Device>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }


    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "设备管理", methods = "设备管理-设备注册")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Device device) {
        try {
            List<Device> deviceList = deviceService.select(device);
            if (Common.isEmpty(device.getPrivateKey())) {
                device.setPrivateKey(new Date().getTime() + new Random().nextInt(100000) + "");
            }
            device.setRegisterTime(new Date());
            Integer userId = Common.findUserSessionId(getRequest());
            device.setRegisterAccount(userId);
            device.setDebugAccount(userId);
            device.setStatus(1);
            //方便测试,默认区域id为海淀区的...
            if (device.getAreaId() == null) {
                device.setAreaId(110108);
            }
            Area area = areaService.selectByPrimaryKey(device.getAreaId());
            JSONArray jsonSelect = new JSONArray();
            if (!Common.isEmpty(area.getSelectProgram())) {
                jsonSelect = JSONArray.fromObject(area.getSelectProgram());
            }
            device.setWorkFrequency(area.getDefaultFrequency());
            String programIds = "";
            for (int j=0;j<jsonSelect.size();j++) {
                programIds = programIds + jsonSelect.getJSONObject(j).getString("pid") +",";
            }
            device.setProgramIds(programIds.equals("") ? null : programIds.substring(0, programIds.length() - 1));
            if(!(deviceList!=null && deviceList.size()>0)){
                deviceService.insert(device);
            }

            //设备注册之后往设备认证里添加一条数据
            DeviceAuthen deviceAuthen = new DeviceAuthen();
            deviceAuthen.setSerialNumber(device.getSerialNumber());

            List<DeviceAuthen> deviceAuthenList = deviceAuthenService.select(deviceAuthen);
            if(!(deviceAuthenList != null && deviceAuthenList.size()>0)){
                deviceAuthenService.insertSelective(deviceAuthen);
            }

            return SUCCESS;
        } catch (Exception e) {
            throw new SystemException("注册设备异常");
        }

    }

    @ResponseBody
    @RequestMapping("modify")
    @SystemLog(module = "设备管理", methods = "设备注册-修改设备")//凡需要处理业务逻辑的.都需要记录操作日志
    public String modify(Device device) {
        try {
            Device oldDevice = deviceService.selectByPrimaryKey(device.getId());
            if (device.getStatus() != oldDevice.getStatus()) {
                device.setExStatus(oldDevice.getStatus());
            }
            if (device.getAreaId() != null && device.getAreaId() != oldDevice.getAreaId()) {
                Integer areaId = device.getAreaId();
                Area area = new Area();
                area = areaService.selectByPrimaryKey(areaId);
                area.getSelectProgram();
                JSONArray jsonArray = new JSONArray();
                if (!Common.isEmpty(area.getSelectProgram())) {
                    jsonArray = JSONArray.fromObject(area.getSelectProgram());
                }
                String programIds = "";
                for(int i=0;i<jsonArray.size();i++){
                    programIds = programIds + jsonArray.getJSONObject(i).getString("pid") + ",";
                }
                device.setProgramIds(programIds.equals("")?null:programIds.substring(0, programIds.length() - 1));
                device.setWorkFrequency(oldDevice.getWorkFrequency());
            }
            deviceService.updateByPrimaryKeySelective(device);
            return SUCCESS;
        } catch (Exception e) {
            throw new SystemException("修改设备异常");
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
        return deviceService.select(device).size() <= 0;
    }


    @ResponseBody
    @RequestMapping(value = "updateDevice")
    @SystemLog(module = "设备管理", methods = "设备管理-设备调试")//凡需要处理业务逻辑的.都需要记录操作日志
    public String updateDevice(Device device){
        deviceService.updateByPrimaryKeySelective(device);
        return SUCCESS;
    }


    @ResponseBody
    @RequestMapping("setFrequency")
    public String setFrequency(String serialNumber, String frequency, String programIds) throws InterruptedException {
        deviceService.updateWorkFrequencyAndProgramIds(serialNumber,frequency,programIds);
        //设置后清空MemroyMap中的相关数据
//        MemoryMap.clear(serialNumber);
        //TODO 下发设置节目号
        //心跳包下发指令
        JSONObject object = new JSONObject();
        object.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_SETFRQ);
        CommandMap.addCommand(serialNumber,object);
        //设备再次请求SetFrq指令时需要的命令数据
        JSONObject obj = new JSONObject();
        obj.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_SETFRQ);
        obj.put(HelperUtils.KEY_FRQ,frequency);
        obj.put(HelperUtils.KEY_PROGRAMS,programIds);
        CommandMap.addCommand(serialNumber,obj);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping("shock")
    public String shock(String serialNumber) throws InterruptedException {
        //TODO 下发设置节目号
        //心跳包下发指令
        JSONObject object = new JSONObject();
        object.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_SHOCK);
        CommandMap.addCommand(serialNumber, object);
        return SUCCESS;
    }


    @ResponseBody
    @RequestMapping("getScanFrequency")
    public ScanFreqInfos getScanFrequency(String serialNumber){
        ScanFreqInfos scanFreqInfos;
        scanFreqInfos = MemoryMap.get(serialNumber);
        if(scanFreqInfos == null){
            scanFreqInfos = new ScanFreqInfos();
        }
        return scanFreqInfos;
    }

    @RequestMapping("getHeartBeatInfoPage")
    public String getHeartBeatInfoPage(Model model,HttpServletRequest request){
        int id = Integer.parseInt(request.getParameter("id"));
        String serialNumber = request.getParameter("serialNumber");

        //获取HeartBeatMap中的心跳数据包,默认情况下隐藏,点击详情显示
        //JSONObject json = JSONObject.fromObject(postData);
        //{"dstat":"0","line":"480","temper":"68","locked":"1",
        // "frq":"786000000","strength":"179","snr":"13","dprogs":"3",
        // "ndisks":"0","camers":"0","sessions":"0"}

//        JSONObject json = new JSONObject();
//        json.put("dstat","0");
//        json.put("line","480");
//       json.put("temper","68");
//        json.put("locked","1");
//        json.put("frq","78600000");
//        json.put("strength","179");
//        json.put("snr","13");
//        json.put("dprogs","3");
//        json.put("ndisks","0");
//
//        json.put("camers","0");
//        json.put("sessions","0");

        String postData = HeartBeatMap.get("serialNumber");
        JSONObject json = null;
        if(postData == null){
            JSONObject.fromObject(postData);
        }else{
            json = new JSONObject();
        }

        model.addAttribute("postData",json);
        model.addAttribute("serialNumber",serialNumber);
        return Common.BACKGROUND_PATH + "/business/device/deviceHeartBeatInfoPage";
    }




}
