package cn.ac.bcc.controller.business.advertisement;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Advertisement;
import cn.ac.bcc.model.business.Company;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 图文广告素材管理
 * Created by bcc on 16/6/3.
 */
@Controller
@RequestMapping("/advertisement/")
public class AdvertisementController extends BaseController<Advertisement>{
    @Autowired
    private AdvertisementService advertisementService;

    @Autowired
    private CompanyService companyService;

    @RequestMapping("list")
    public String listUI(Model model) throws Exception {
        model.addAttribute("res", findByRes());
        return Common.BACKGROUND_PATH + "/business/advertisement/list";
    }

    @RequestMapping("addUI")
    public String addUI(Model model) {
        List<Company> companyList = companyService.selectAll();

        model.addAttribute("companyList",companyList);
        return Common.BACKGROUND_PATH + "/business/advertisement/add";
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

    @ResponseBody
    @RequestMapping("add")
    @SystemLog(module = "广告管理", methods = "图文广告管理-添加图文广告")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(Advertisement advertisement, HttpServletRequest request){
        File uploadPath = new File(Common.BACKGROUND_PATH+"/upload");
        if(!uploadPath.exists()){
            uploadPath.mkdir();
        }

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        String path = simpleDateFormat.format(new Date());

        File finalPath = new File(Common.BACKGROUND_PATH+"/upload/"+path);
        if(!finalPath.exists()){
            uploadPath.mkdir();
        }




        advertisementService.insertSelective(advertisement);
        return SUCCESS;
    }

}
