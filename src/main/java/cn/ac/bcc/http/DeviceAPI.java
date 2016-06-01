package cn.ac.bcc.http;

import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseJson;
import io.netty.buffer.Unpooled;
import io.netty.handler.codec.http.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.*;
import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.*;

import static io.netty.handler.codec.http.HttpResponseStatus.OK;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

/**
 * Created by lenovo on 2016-05-31.
 */
public class DeviceAPI {
    public static final String SET_COOKIE = "Set-Cookie";
    public static final String URI_LINKHELLO = "/device/linkHello.shtml";
    public static final String URI_AUTHEN = "/device/authen.shtml";
    public static final String URI_REPORT_PROGRAMS = "/device/reportPrograms.shtml";

    private static Log log = LogFactory.getLog(DeviceAPI.class);
    private ApplicationContext ctx;

    public DeviceAPI(ApplicationContext applicationContext){
        this.ctx = applicationContext;
    }



    public FullHttpResponse dispatcher(HttpRequest request,String postData) throws UnsupportedEncodingException {
        String uri = request.getUri();
        int index = uri.indexOf("?");
        String query = "";
        if(index != -1){
            query = uri.substring(index+1);
        }

        List<NameValuePair> nvList = URLEncodedUtils.parse(query, Charset.forName("UTF-8"));
        System.out.println("Uri:" + uri);
        String jsonStr = "";
        String sessionID = null;
        String token = null;
        if(uri.contains(URI_LINKHELLO)){
            UUID uuid  =  UUID.randomUUID();
            token = uuid.toString();
            sessionID = ServerCookieEncoder.encode("PHPSESSID",token);
            jsonStr = linkHello(request,postData,token);
        }else if(uri.contains(URI_AUTHEN)){
            jsonStr = authen(request,postData);
        }else if(uri.contains(URI_REPORT_PROGRAMS)){
            jsonStr = reportPrograms(request,postData);
        }

        FullHttpResponse response = new DefaultFullHttpResponse(HTTP_1_1,OK, Unpooled.wrappedBuffer(jsonStr.getBytes("UTF-8")));
        if(sessionID != null) {
            response.headers().set(SET_COOKIE, sessionID);
        }
        return response;
    }

    private String getCookieValue(HttpRequest request){
        String cookieStr = request.headers().get("Cookie");
        String[] args = cookieStr.split("=");
        String value = "";
        if(args.length >= 2 && args[0].equals("PHPSESSID")){
            value = args[1];
        }
        return value;
    }

    public String  linkHello(HttpRequest request,String postData,String token)  {
        // 获取设备授权令牌
        ResponseJson rj = new ResponseJson();
        rj.setResult(ResponseJson.RESULT_SUCCESS);
        rj.setCommand(ResponseJson.Command.Nothing);
        rj.setDescription("no error.");
        rj.setTime(System.currentTimeMillis()/1000);
        rj.setToken(token);

        JSONObject jsonObject = JSONObject.fromObject(rj);
        return jsonObject.toString();
    }

    public String authen(HttpRequest request,String postData) {
        String token = getCookieValue(request);
        DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
        log.debug("authen --postData::\r\n" + postData);
        JSONObject json = JSONObject.fromObject(postData);
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setSerialNumber(json.getString(ResponseJson.KEY_ID));
        deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);

        boolean validation = false;
//
//        deviceAuthen.setPrivateKey(json.getString(ResponseJson.KEY_KEY));
//        deviceAuthen.setIp1(json.getString(ResponseJson.KEY_IP1));
//        deviceAuthen.setIp2(json.getString(ResponseJson.KEY_IP2));
//        deviceAuthen.setMac1(json.getString(ResponseJson.KEY_MAC1));
//        deviceAuthen.setMac2(json.getString(ResponseJson.KEY_MAC2));
//        deviceAuthen.setVersion1(json.getString(ResponseJson.KEY_VERSION1));
//        deviceAuthen.setVersion2(json.getString(ResponseJson.KEY_VERSION2));
//        deviceAuthen.setToken(token);
//        if(deviceAuthen != null){
//            deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
//        }else{
//            deviceAuthenService.insertSelective(deviceAuthen);
//        }

        Map<String,Object> map  = new HashMap<String,Object>();
        if(!validation){
            map.put(ResponseJson.KEY_RESULT,ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_COMMAND,ResponseJson.Command.Nothing);
            map.put(ResponseJson.KEY_DESCRIPTION,"error.");
            map.put(ResponseJson.KEY_FRQ,"626");
            map.put(ResponseJson.KEY_PROGRAMS,"1,3,5,7,9");
        }else{
            map.put(ResponseJson.KEY_RESULT,ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_COMMAND,ResponseJson.Command.Nothing);
            map.put(ResponseJson.KEY_DESCRIPTION,"");
            map.put(ResponseJson.KEY_FRQ,"626");
            map.put(ResponseJson.KEY_PROGRAMS,"1,3,5,7,9");
        }
        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }


    private void parseReportProgram(String content){
//        JSONObject jsonObject = JSONObject.fromObject(content);
//
//        Integer srcnumber = jsonObject.getInt(ResponseJson.KEY_RP_SCRNUMBER);
//        Example example = new Example(Program.class);
//        example.createCriteria().andEqualTo("srcnumber",srcnumber);
//        programService.deleteByExample(example);
//
//        JSONArray array = jsonObject.getJSONArray(ResponseJson.KEY_RP_SRCLIST);
//        int len = array.size();
//        for(int i = 0;i<len;i++){
//            JSONObject obj = (JSONObject) array.get(i);
//            String srcid = obj.getString(ResponseJson.KEY_RP_SRCID);
//            String stype = obj.getString(ResponseJson.KEY_RP_STYPE);
//            Integer pnumber = obj.getInt(ResponseJson.KEY_RP_PNUMBER);
//            JSONArray plist = obj.getJSONArray(ResponseJson.KEY_RP_PLIST);
//            int size = plist.size();
//            for(int j = 0;j<size;j++){
//                JSONObject jobj = (JSONObject) plist.get(j);
//                String pid = jobj.getString(ResponseJson.KEY_RP_PID);
//                String pname = jobj.getString(ResponseJson.KEY_RP_PNAME);
//                String ptype = jobj.getString(ResponseJson.KEY_RP_PTYPE);
//                String purl = jobj.getString(ResponseJson.KEY_RP_PURL);
//
//                Program program = new Program();
//                program.setSrcNumber(srcnumber);
//                program.setSrcId(srcid);
//                program.setStype(stype);
//                program.setPnumber(pnumber);
//                program.setPid(pid);
//                program.setPname(pname);
//                program.setPtype(ptype);
//                program.setPurl(purl);
//                programService.insertSelective(program);
//            }
//        }
    }

    public String reportPrograms(HttpRequest request,String postData) {
        String token = "12312sdfgsdgfegrfger";
        boolean validation = true;//Common.validateToken(getRequest().getCookies(),token);
        log.debug("reportPrograms --postData::\r\n" + postData);
        parseReportProgram(postData);
        //TODO
        Map<String,Object> map  = new HashMap<String,Object>();
        if(!validation){
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else{
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }
        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }

//    public String analysisv(HttpRequest request,String postData) {
//        //TODO 方便测试，暂用固定值
//        String token = "12312sdfgsdgfegrfger";
//        boolean validation = true; //Common.validateToken(getRequest().getCookies(),token);
//
//        JSONObject json = JSONObject.fromObject(content);
//        System.out.print("json::" + json);
//
//        ResponseJson rj = new ResponseJson();
//        if(!validation){
//            rj.setResult(ResponseJson.RESULT_FAIL);
//            rj.setCommand(ResponseJson.Command.Nothing);
//            rj.setDescription("error.");
//        }else{
//            rj.setResult(ResponseJson.RESULT_SUCCESS);
//            rj.setCommand(ResponseJson.Command.Nothing);
//            rj.setDescription("no error.");
//        }
//        getResponse().addCookie(new Cookie(COOKIE,token));
//        return rj;
//    }
}
