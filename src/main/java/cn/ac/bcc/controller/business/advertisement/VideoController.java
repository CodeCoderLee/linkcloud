package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceUpdate;
import cn.ac.bcc.model.business.Video;
import cn.ac.bcc.service.business.advertisement.VideoService;
import cn.ac.bcc.util.AliUtils;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.PolicyConditions;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by lifm on 16/6/30.
 */
@Controller
@RequestMapping("/video/")
public class VideoController extends BaseController<Video>{
    private final String rootPath = "C:/linkcloud/upload/video/";
//    private final String rootPath = "/Users/bcc/Project/linkcloud/upload/video/";

    @Autowired
    private VideoService videoService;

    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/advertisement/videoList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String entrance) {
        model.addAttribute("entrance", entrance);
        return Common.BACKGROUND_PATH + "/business/advertisement/addVideo";
//
//        String policy = AliUtils.getPolicy();
//        String signature = AliUtils.getSignature(policy);
//        model.addAttribute("entrance", entrance);
//        model.addAttribute("OSSAccessKeyId",AliUtils.accessKeyId);
//        model.addAttribute("policy",policy);
//        model.addAttribute("Signature",signature);
//        model.addAttribute("key","");
//        return Common.BACKGROUND_PATH + "/business/advertisement/addVideo-ali";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Video video, Integer limit, Integer offset) throws Exception {
        PageHelper.offsetPage(offset, limit);
        String sortOrder = getPara("order");
        String sortNameStr = getPara("sort");
        String sortName = Common.getClassFieldColumnName(video.getClass(),sortNameStr);
        List<Video> list = videoService.searchVideo(video, sortOrder, sortName);
        PageInfo<Video> pageInfo = new PageInfo<Video>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);

        return responseData;
    }

    @ResponseBody
    @RequestMapping("searchVideoByPageNum")
    public ResponseData searchVideoByPageNum(Video video, Integer pageNum, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Video> list = videoService.searchVideo(video, null, null);
        PageInfo<Video> pageInfo = new PageInfo<Video>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;

    }

    @RequestMapping("add")
    @ResponseBody
    @SystemLog(module = "广告管理", methods = "广告管理-添加视频广告")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(MultipartFile file, Video video) throws IOException {
//        Date date = new Date();
//        video.setAddTime(date);
//        String filePath = saveFile(file, rootPath);
//        video.setFilePath(filePath);
//        video.setFileName(file.getOriginalFilename());
//        videoService.insertSelective(video);
//        String url = "/video/download.shtml?id="+video.getId();
//        video.setUrl(url);
//        videoService.updateByPrimaryKeySelective(video);
        InputStream inputStream = file.getInputStream();
        Date date = new Date();
        video.setAddTime(date);
        video.setFileName(file.getOriginalFilename());
        videoService.insertSelective(video);

        String downUrl = AliUtils.uploadVideo(inputStream,video.getId());
//        video.setFilePath(filePath);
//        String url = "/video/download.shtml?id="+video.getId();
        video.setUrl(downUrl);
        videoService.updateByPrimaryKeySelective(video);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping("download")
    public void download(Integer id){
        Video video = new Video();
        video.setId(id);
        video = videoService.selectByPrimaryKey(id);
        String filePath = video.getFilePath();
        if (filePath == null) {
            return;
        }
        String fileName = video.getFileName();
        if (Common.isEmpty(fileName)) {
            fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        }
        download(fileName, filePath, id);
    }

}
