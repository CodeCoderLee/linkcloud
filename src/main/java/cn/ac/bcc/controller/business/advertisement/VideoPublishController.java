package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceToVideo;
import cn.ac.bcc.model.business.VideoPublish;
import cn.ac.bcc.service.business.advertisement.DeviceToVideoService;
import cn.ac.bcc.service.business.advertisement.VideoPublishService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by lifm on 16/6/30.
 */
@Controller
@RequestMapping("/videoPublish/")
public class VideoPublishController extends BaseController<VideoPublish>{
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
//        model.addAttribute("serialNumbers", deviceToVideo.getSerialNumber());
//        deviceToVideo = deviceToVideoService.selectOne(deviceToVideo);
//        deviceToVideo.getSelfVideoInfo();
        return Common.BACKGROUND_PATH + "/business/device/addDeviceUpdate";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(DeviceToVideo deviceToVideo, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DeviceToVideo> list = null;
        PageInfo<DeviceToVideo> pageInfo = new PageInfo<DeviceToVideo>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;
    }

    @ResponseBody
    @RequestMapping("updateDeviceVersion")
    public String updateDeviceVersion(String serialNumbers, String versions) {
        return null;
    }
}
