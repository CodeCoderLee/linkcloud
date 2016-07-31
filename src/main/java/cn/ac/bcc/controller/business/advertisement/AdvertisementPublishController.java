package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.AdPublish;
import cn.ac.bcc.model.business.DeviceToAd;
import cn.ac.bcc.service.business.advertisement.AdvertisementPublishService;
import cn.ac.bcc.service.business.advertisement.AdvertisementService;
import cn.ac.bcc.service.business.advertisement.DeviceToAdService;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lifm on 16/7/11.
 */
@Controller
@RequestMapping("/advertisementPublish/")
public class AdvertisementPublishController extends BaseController<DeviceToAd> {

    @Autowired
    private DeviceToAdService deviceToAdService;

    @Autowired
    private AdvertisementPublishService advertisementPublishService;

    @Autowired
    private AdvertisementService advertisementService;


    @RequestMapping("list")
    public String listUI() {
        return Common.BACKGROUND_PATH + "/business/advertisement/picturePublishList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String serialNumbers) {
        model.addAttribute("serialNumbers", serialNumbers);
//        deviceToVideo = deviceToVideoService.selectOne(deviceToVideo);
//        deviceToVideo.getSelfVideoInfo();
        return Common.BACKGROUND_PATH + "/business/advertisement/addPicturePublish";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceToAd deviceToAd, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DeviceToAd> list = deviceToAdService.searchList(deviceToAd);
        PageInfo<DeviceToAd> pageInfo = new PageInfo<DeviceToAd>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }

    @ResponseBody
    @RequestMapping("updateAdPublish")
    @Transactional
    public String updateAdPublish(String serialNumbers, String adInfos) throws InterruptedException {
        String[] serialNumber = serialNumbers.split(",");
        String[] ad = adInfos.split(",");
        JSONArray selfJsonArray = new JSONArray();
        JSONArray companyJsonArray = new JSONArray();
        JSONArray customJsonArray = new JSONArray();
        List<AdPublish> adPublishes = new ArrayList<AdPublish>();
        for (int i = 0; i < ad.length; i++) {
            AdPublish adPublish = new AdPublish();
            String[] videoInfo = ad[i].split("&");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", videoInfo[0]);
            jsonObject.put("fileName", videoInfo[1]);
            jsonObject.put("filePath", videoInfo[2]);
            jsonObject.put("url", videoInfo[3]);
            if (Integer.valueOf(videoInfo[4]) == 1) {
                selfJsonArray.add(jsonObject);
            } else if (Integer.valueOf(videoInfo[4]) == 2) {
                companyJsonArray.add(jsonObject);
            } else {
                customJsonArray.add(jsonObject);
            }
            adPublish.setAdId(Integer.valueOf(videoInfo[0]));
            adPublish.setType(Integer.valueOf(videoInfo[4]));
            adPublishes.add(adPublish);

        }

        for (int i = 0; i < serialNumber.length; i++) {
            for (int j = 0; j < adPublishes.size(); j++) {
                adPublishes.get(j).setSerialNumber(serialNumber[i]);
                adPublishes.get(j).setPublishTime(new Date());
//                adPublishes.get(j).setType(type);
            }
            //todo 心跳包下发指令
            //心跳包下发指令


            JSONObject jsonObject = new JSONObject();
            jsonObject.put("serialNumber", serialNumber[i]);
            jsonObject.put("updateTime", new Date().getTime());

            DeviceToAd deviceToAd = new DeviceToAd();
            deviceToAd.setSerialNumber(serialNumber[i]);
            List<DeviceToAd> list = deviceToAdService.select(deviceToAd);

            deviceToAd.setUpdateTime(new Date());

            jsonObject.put("ads", selfJsonArray);
            deviceToAd.setSelfAdInfo(jsonObject.toString());

            jsonObject.put("ads", companyJsonArray);
            deviceToAd.setCompanyAdInfo(jsonObject.toString());

            jsonObject.put("ads", customJsonArray);
            deviceToAd.setCustomAdInfo(jsonObject.toString());



            if (list.size() > 0) {
                //更新
                deviceToAd.setId(list.get(0).getId());
                deviceToAdService.updateByPrimaryKeySelective(deviceToAd);
            } else {
                //插入
                deviceToAdService.insert(deviceToAd);
            }

            //删除关联表
            AdPublish adPublish = new AdPublish();
            adPublish.setSerialNumber(serialNumber[i]);
            advertisementPublishService.delete(adPublish);

        }

        advertisementPublishService.batchInsert(adPublishes);

        advertisementService.updateBindStatus();
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping("unBindAdPublish")
    public String unBindAdPublish(String serialNumbers) throws InterruptedException {
        String[] serialNumber = serialNumbers.split(",");
        for(int i=0;i<serialNumber.length;i++){
            AdPublish adPublish = new AdPublish();
            adPublish.setSerialNumber(serialNumber[i]);
            advertisementPublishService.delete(adPublish);

            DeviceToAd deviceToAd = new DeviceToAd();
            deviceToAd.setSerialNumber(serialNumber[i]);
            deviceToAdService.delete(deviceToAd);

//            //todo 心跳包下发指令
//            //心跳包下发指令
//            JSONObject object = new JSONObject();
//            object.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_UPDATEAD);
//            CommandMap.addCommand(serialNumber[i],object);
        }

        advertisementService.updateBindStatus();
        return SUCCESS;
    }
}
