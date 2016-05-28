package cn.ac.bcc.controller.ws;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;

/**
 * Created by lenovo on 2016-05-23.
 */
@Controller
@RequestMapping("/ws/stream/")
public class StreamController extends BaseController{

    @ResponseBody
    @RequestMapping(value = "remoteCheck")
    public ResponseJson remoteCheck(Integer seq) {
        //TODO 方便测试，暂用固定值
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

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
        getResponse().addCookie(new Cookie(Common.COOKIE,token));
        return rj;
    }
}
