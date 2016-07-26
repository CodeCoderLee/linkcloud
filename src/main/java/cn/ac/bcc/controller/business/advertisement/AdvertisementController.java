package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Advertisement;
import cn.ac.bcc.model.business.Company;
import cn.ac.bcc.model.business.Video;
import cn.ac.bcc.service.business.advertisement.AdvertisementService;
import cn.ac.bcc.service.business.company.CompanyService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * 图文广告素材管理
 * Created by bcc on 16/6/3.
 */
@Controller
@RequestMapping("/advertisement/")
public class AdvertisementController extends BaseController<Advertisement>{

//    private final String rootPath = "C:/linkcloud/upload/advertisement/";
    private final String rootPath = "/Users/bcc/Project/linkcloud/upload/advertisement/";

    @Autowired
    private AdvertisementService advertisementService;

    @Autowired
    private CompanyService companyService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/business/advertisement/pictureList";
    }

    @RequestMapping("addUI")
    public String addUI(Model model) {
        List<Company> companyList = companyService.selectAll();

        model.addAttribute("companyList",companyList);
        return Common.BACKGROUND_PATH + "/business/advertisement/addPicture";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Advertisement advertisement, Integer limit, Integer offset){
        PageHelper.offsetPage(offset, limit);
        List<Advertisement> advertisementList = advertisementService.selectAdvertisement(advertisement);
        PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(advertisementList);
        ResponseData responseData = new ResponseData();
        responseData.setRows(advertisementList);
        responseData.setTotal(pageInfo.getTotal());
        return responseData;
    }

//    @ResponseBody
//    @RequestMapping("upload")
//    public Integer upload(MultipartFile image){
//        if (!image.isEmpty()) {
//            try {
//                File filepath = new File(rootPath);
//                if (!filepath.exists())
//                    filepath.mkdirs();
//                UUID uuid = UUID.randomUUID();
//                String newFilePath = filepath + "/" + uuid.toString();
//                image.transferTo(new File(newFilePath));
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//
//        }
//        return 1;
//    }

    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "广告管理", methods = "图文广告管理-添加图文广告")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Advertisement advertisement, MultipartFile image, HttpServletRequest request){
        Date date = new Date();
        advertisement.setAddTime(date);
        String fileName = advertisement.getFileName();
        String newFilePath = "";
        if (image!=null&&!image.isEmpty()) {
            try {
                File filepath = new File(rootPath);
                if (!filepath.exists())
                    filepath.mkdirs();
                UUID uuid = UUID.randomUUID();
                newFilePath = filepath + "/" + uuid.toString()+ fileName.substring(fileName.lastIndexOf("."));
                image.transferTo(new File(newFilePath));
                advertisement.setFilePath(newFilePath);
                try {
                    BufferedImage bufferedImage = ImageIO.read(new File(advertisement.getFilePath()));
                    advertisement.setWidth(bufferedImage.getWidth());
                    advertisement.setHeight(bufferedImage.getHeight());
                } catch (IOException e) {
                    e.printStackTrace();
                }
                String url = "/advertisement/getPic/"+newFilePath.substring(newFilePath.lastIndexOf('/')+1)+".shtml";
                advertisement.setUrl(url);
                advertisementService.insertSelective(advertisement);
//                advertisementService.updateByPrimaryKeySelective(advertisement);
                return SUCCESS;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return ERROR;
        }else{
            return "EMPTY";
        }

    }

    /**
     * 获取照片
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value={"getPic/{filePath}"},method= RequestMethod.GET)
    public void getPic(@PathVariable("filePath") String filePath, HttpServletRequest request,
                       HttpServletResponse response) throws Exception{


        if(StringUtils.isEmpty(filePath)) {
            filePath = "";
        }

        String fileName = rootPath + filePath;
        File file = new File(fileName);

        //判断文件是否存在如果不存在就返回默认图标
        if(!(file.exists() && file.canRead())) {
            fileName = request.getServletContext().getRealPath("/images//") + "/body.jpg";
            file = new File(fileName);
        }

        FileInputStream inputStream = new FileInputStream(file);
        byte[] data = new byte[(int)file.length()];
        inputStream.read(data);
        inputStream.close();

        response.setContentType("image/jpg");

        OutputStream stream = response.getOutputStream();
        stream.write(data);
        stream.flush();
        stream.close();
    }


    @ResponseBody
    @RequestMapping("searchAdByPageNum")
    public ResponseData searchAdByPageNum(Advertisement advertisement, Integer pageNum, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        List<Advertisement> list = advertisementService.searchAdvertisement(advertisement, null, null);
        PageInfo<Advertisement> pageInfo = new PageInfo<Advertisement>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        responseData.setPageNum(pageInfo.getPageNum());
        responseData.setTotalPages(pageInfo.getPages());
        return responseData;

    }

}
