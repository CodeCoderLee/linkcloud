package cn.ac.bcc.controller.ws;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Role;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import cn.ac.bcc.util.ResponseJson;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.Cookie;
import java.util.List;

/**
 * Created by lenovo on 2016-05-23.
 */
@Controller
@RequestMapping("/ws/device/")
public class DeviceApiController extends BaseController{
    private final static String COOKIE = Common.COOKIE;
    @ResponseBody
    @RequestMapping(value = "linkHello")
    public ResponseJson linkHello(Integer seq) {
        // 获取设备授权令牌
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        getResponse().addCookie(new Cookie(COOKIE,token));
        ResponseJson rj = new ResponseJson();
        rj.setResult(0);
        rj.setCommand(ResponseJson.Command.Nothing);
        rj.setDescription("no error.");
        rj.setTime(System.currentTimeMillis()/1000);
        rj.setToken(token);
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "authen")
    public ResponseJson authen(Integer seq,String authen) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(authen);
        System.out.print("json::" + json);
        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
            rj.setTime(System.currentTimeMillis()/1000);
            rj.setToken(token);
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
            rj.setTime(System.currentTimeMillis()/1000);
            rj.setToken(token);
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }


    @ResponseBody
    @RequestMapping(value = "analysisv")
    public ResponseJson analysisv(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "shock")
    public ResponseJson shock(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "scanFrq")
    public ResponseJson scanFrq(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "setFrq")
    public ResponseJson setFrq(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "updateAd")
    public ResponseJson updateAd(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "setAd")
    public ResponseJson setAd(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "reportPrograms")
    public ResponseJson reportPrograms(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "remoteWatch")
    public ResponseJson remoteWatch(Integer seq,String content) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        JSONObject json = JSONObject.fromObject(content);
        System.out.print("json::" + json);

        ResponseJson rj = new ResponseJson();
        if(!validation){
            rj.setResult(1);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(0);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

}
