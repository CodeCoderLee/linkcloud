package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceToVideo;
import cn.ac.bcc.model.business.VideoPublish;
import cn.ac.bcc.service.business.advertisement.DeviceToVideoService;
import cn.ac.bcc.service.business.advertisement.VideoPublishService;
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
 * Created by lifm on 16/6/30.
 */
@Controller
@RequestMapping("/videoPublish/")
public class VideoPublishController extends BaseController<VideoPublish> {
    @Autowired
    private VideoPublishService videoPublishService;

    @Autowired
    private DeviceToVideoService deviceToVideoService;

    @RequestMapping("list")
    public String listUI() {
        return Common.BACKGROUND_PATH + "/business/advertisement/videoPublishList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String serialNumbers) {
        model.addAttribute("serialNumbers", serialNumbers);
//        deviceToVideo = deviceToVideoService.selectOne(deviceToVideo);
//        deviceToVideo.getSelfVideoInfo();
        return Common.BACKGROUND_PATH + "/business/advertisement/addVideoPublish";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceToVideo deviceToVideo, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DeviceToVideo> list = deviceToVideoService.searchList(deviceToVideo);
        PageInfo<DeviceToVideo> pageInfo = new PageInfo<DeviceToVideo>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }

    @ResponseBody
    @RequestMapping("updateVideoPublish")
    @Transactional
    public String updateDeviceVersion(String serialNumbers, String videoInfos, Integer type) throws InterruptedException {
        String[] serialNumber = serialNumbers.split(",");
        String[] video = videoInfos.split(",");
        JSONArray jsonArray = new JSONArray();
        List<VideoPublish> videoPublishes = new ArrayList<VideoPublish>();
        for (int i = 0; i < video.length; i++) {
            VideoPublish videoPublish = new VideoPublish();
            String[] videoInfo = video[i].split("&");
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", videoInfo[0]);
            jsonObject.put("fileName", videoInfo[1]);
            jsonObject.put("filePath", videoInfo[2]);
            jsonObject.put("url", videoInfo[3]);
            jsonArray.add(jsonObject);
            videoPublish.setVideoId(Integer.valueOf(videoInfo[0]));
            videoPublishes.add(videoPublish);

        }

        for (int i = 0; i < serialNumber.length; i++) {
            for(int j=0;j<videoPublishes.size();j++){
                videoPublishes.get(j).setSerialNumber(serialNumber[i]);
                videoPublishes.get(j).setPublishTime(new Date());
                videoPublishes.get(j).setType(type);
            }
            //todo 心跳包下发指令
            //心跳包下发指令
            JSONObject heartObj = new JSONObject();
            heartObj.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_UPDATEAD);
            CommandMap.addCommand(serialNumber[i],heartObj);

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("serialNumber", serialNumber[i]);
            jsonObject.put("updateTime", new Date().getTime());
            jsonObject.put("videos", jsonArray);
            DeviceToVideo deviceToVideo = new DeviceToVideo();
            deviceToVideo.setSerialNumber(serialNumber[i]);
            List<DeviceToVideo> list = deviceToVideoService.select(deviceToVideo);
            //type 标记广告类型,1自带广告,2第三方企业广告,3自定义广告
            if (type == 1) {
                deviceToVideo.setSelfVideoInfo(jsonObject.toString());
            } else if (type == 2) {
                deviceToVideo.setCompanyVideoInfo(jsonObject.toString());
            } else {
                deviceToVideo.setCustomVideoInfo(jsonObject.toString());
            }
            if (list.size() > 0) {
                //更新
                deviceToVideo.setId(list.get(0).getId());
                deviceToVideoService.updateByPrimaryKeySelective(deviceToVideo);
            } else {
                //插入
                deviceToVideoService.insert(deviceToVideo);
            }

            //删除关联表
            VideoPublish videoPublish = new VideoPublish();
            videoPublish.setSerialNumber(serialNumber[i]);
            videoPublish.setType(type);
            videoPublishService.delete(videoPublish);

        }

        videoPublishService.batchInsert(videoPublishes);
        return SUCCESS;
    }
}
