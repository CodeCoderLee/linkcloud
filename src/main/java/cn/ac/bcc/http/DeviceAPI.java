package cn.ac.bcc.http;

import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseJson;
import io.netty.buffer.Unpooled;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpResponse;
import io.netty.handler.codec.http.HttpRequest;
import io.netty.handler.codec.http.ServerCookieEncoder;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.springframework.context.ApplicationContext;

import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static io.netty.handler.codec.http.HttpResponseStatus.OK;
import static io.netty.handler.codec.http.HttpVersion.HTTP_1_1;

/**
 * Created by lenovo on 2016-05-31.
 */
public class DeviceAPI {
    public static final String SET_COOKIE = "Set-Cookie";
    public static final String URI_LINKHELLO = "/device/linkHello.shtml";
    public static final String URI_AUTHEN = "/device/authen.shtml";
    public static final String URI_REPORT_PROGRAMS = "/device/reportprograms.shtml";
    public static final String URI_ANALYSISV = "/device/analysisv.shtml";
    public static final String URI_SHOCK = "/device/shock.shtml";
    public static final String URI_SCANFRQ = "/device/scanfrq.shtml";
    public static final String URI_SETFRQ = "/device/setfrq.shtml";
    public static final String URI_UPDATEAD = "/device/updatead.shtml";
    public static final String URI_SETAD = "/device/setad.shtml";
    public static final String URI_REMOTEWATCH = "/device/remotewatch.shtml";
    public static final String URI_REMOTECHECK = "/device/remotecheck.shtml";

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
        log.info("uri:" + uri + "\r\n" + "data:::" + postData);
        String jsonStr = "";
        String sessionID = null;
        String token = null;
        uri = uri.toLowerCase();
        if(uri.contains(URI_LINKHELLO)){
            UUID uuid  =  UUID.randomUUID();
            token = uuid.toString();
            sessionID = ServerCookieEncoder.encode("PHPSESSID",token);
            jsonStr = linkHello(request,postData,nvList,token);
        }else if(uri.contains(URI_AUTHEN)){
            jsonStr = authen(request,postData,nvList);
        }else if(uri.contains(URI_REPORT_PROGRAMS)){
            jsonStr = reportPrograms(request,postData,nvList);
        }else if(uri.contains(URI_ANALYSISV)){
            jsonStr = analysisv(request,postData,nvList);
        }else if(uri.contains(URI_REMOTECHECK)){
            jsonStr = remoteCheck(request,postData,nvList);
        }else if(uri.contains(URI_REMOTEWATCH)){
            jsonStr = remoteWatch(request,postData,nvList);
        }else if(uri.contains(URI_SCANFRQ)){
            jsonStr = scanFrq(request,postData,nvList);
        }else if (uri.contains(URI_SETAD)) {
            jsonStr = setAd(request,postData,nvList);
        }else if(uri.contains(URI_UPDATEAD)){
            jsonStr = updateAd(request,postData,nvList);
        }else if(uri.contains(URI_SETFRQ)){
            jsonStr = setFrq(request,postData,nvList);
        }else if(uri.contains(URI_SHOCK)){
            jsonStr = shock(request,postData,nvList);
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

    public String  linkHello(HttpRequest request,String postData,List<NameValuePair> nvList,String token)  {
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

    public String authen(HttpRequest request,String postData,List<NameValuePair> nvList) {
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
        if(validation){
            map.put(ResponseJson.KEY_RESULT,ResponseJson.RESULT_SUCCESS);
        }else{
            map.put(ResponseJson.KEY_RESULT,ResponseJson.RESULT_FAIL);
        }
        map.put(ResponseJson.KEY_COMMAND,ResponseJson.Command.Nothing);
        map.put(ResponseJson.KEY_DESCRIPTION,"error.");
        map.put(ResponseJson.KEY_FRQ,"626");
        map.put(ResponseJson.KEY_PROGRAMS,"1,3,5,7,9");

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

    public String reportPrograms(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        log.debug("reportPrograms --postData::\r\n" + postData);
        parseReportProgram(postData);
        //TODO
        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);
        map.put(ResponseJson.KEY_DESCRIPTION, "");

        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }

    public String analysisv(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        JSONObject json = JSONObject.fromObject(postData);
        ResponseJson rj = new ResponseJson();

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String shock(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);
        System.out.print("json::" + json);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String scanFrq(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String setFrq(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String updateAd(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String setAd(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String remoteWatch(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        map.put(ResponseJson.KEY_COMMAND, ResponseJson.Command.Nothing);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String remoteCheck(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_SUCCESS);
            map.put(ResponseJson.KEY_DESCRIPTION, "");
        }else {
            map.put(ResponseJson.KEY_RESULT, ResponseJson.RESULT_FAIL);
            map.put(ResponseJson.KEY_DESCRIPTION, "error");
        }
        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }
}
