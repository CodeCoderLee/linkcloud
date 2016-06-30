package cn.ac.bcc.controller.business.version;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Version;
import cn.ac.bcc.service.base.BaseService;
import cn.ac.bcc.service.business.version.VersionService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by bcc on 16/6/21.
 */
@Controller
@RequestMapping("/version/")
public class VersionController extends BaseController<Version> {

    private final String relativeUploadPath = "upload/version/";

    @Autowired
    private VersionService versionService;

    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/version/list";
    }

    @RequestMapping("addUI")
    public String addUI(Model model, String entrance) {
        model.addAttribute("entrance", entrance);
        return Common.BACKGROUND_PATH + "/business/version/add";
    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Version version, Integer limit, Integer offset) throws Exception {
        PageHelper.offsetPage(offset, limit);
        Example example = getEqualsToExample(version);
        List<Version> list = versionService.selectByExample(example);
        PageInfo<Version> pageInfo = new PageInfo<Version>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);

        return responseData;
    }

    @ResponseBody
    @RequestMapping("searchVersionList")
    public List<Version> searchVersionList(){

        List<Version> list = versionService.searchVersionList();
        return list;
    }

    @RequestMapping("add")
    @ResponseBody
    @SystemLog(module = "版本管理", methods = "版本管理-添加版本")//凡需要处理业务逻辑的.都需要记录操作日志
    public String add(MultipartFile file, Version version, HttpServletRequest request){
        Date date = new Date();
        version.setAddTime(date);

        if (!file.isEmpty()) {
            try {
                String tomcatPath = request.getServletContext().getRealPath("/");
                File filepath = new File(tomcatPath + relativeUploadPath);
                if (!filepath.exists())
                    filepath.mkdirs();
                UUID uuid = UUID.randomUUID();
                FileCopyUtils.copy(file.getBytes(), new File(filepath + "/" +  uuid.toString()));

                version.setFilePath(filepath + "/" + uuid.toString());
                version.setFileName(file.getOriginalFilename());
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        versionService.insertSelective(version);
        String url = "/version/download.shtml?id="+version.getId();
        version.setUrl(url);
        versionService.updateByPrimaryKeySelective(version);
        return SUCCESS;
    }

    @ResponseBody
    @RequestMapping("download")
    public void download(Integer id, HttpServletRequest request, HttpServletResponse response){
        Version version = new Version();
        version.setId(id);
        version = versionService.selectByPrimaryKey(id);
        String filePath = version.getFilePath();
        if (filePath == null) {
            return;
        }
        String fileName = version.getFileName();
        if (Common.isEmpty(fileName)) {
            fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        }
        File file = new File(filePath);

        try {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            response.reset();
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String(fileName.replaceAll(" ", "").getBytes("utf-8"),"iso8859-1")+";id="+id);
            // 设置下载文件的大小
            response.addHeader("Content-Length", ""+file.length());
            // 设置文件ContentType类型，这样设置，会自动判断下载文件类型
            response.setContentType("application/octet-stream");
            //		response.setContentType("multipart/form-data");
            // 创建文件输入流
            FileInputStream in = new FileInputStream(file);
            // 创建文件输出流
            OutputStream out = response.getOutputStream(); // 浏览器下载
            //		out = new FileOutputStream("E:\\file\\out\\" + realName); // 本地下载
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            // 循环将输入流中的内容读取到缓冲区当中
            while((len=in.read(buffer))>0){
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            // 刷新
            out.flush();
            //关闭文件输入流
            //关闭输出流
            out.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
