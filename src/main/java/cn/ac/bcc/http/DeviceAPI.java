package cn.ac.bcc.http;

import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.util.HelperUtils;
import io.netty.buffer.Unpooled;
import io.netty.handler.codec.http.DefaultFullHttpResponse;
import io.netty.handler.codec.http.FullHttpResponse;
import io.netty.handler.codec.http.HttpRequest;
import io.netty.handler.codec.http.ServerCookieEncoder;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.springframework.context.ApplicationContext;
import tk.mybatis.mapper.entity.Example;

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
    public static final String URI_LINKHELLO = "/device/linkhello.shtml";
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
        log.info("date::" + new Date() + "  uri:" + uri + "\r\n" + "  data:::" + postData);
        String jsonStr = "";
        String sessionID = null;
        String token = null;
        uri = uri.toLowerCase();
        if(uri.contains(URI_LINKHELLO)){
//            UUID uuid  =  UUID.randomUUID();
//            token = uuid.toString();
            token = "9acd5102-b150-45fc-afad-331bb51d6b79";
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
        boolean validation = true;
        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation){
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
        }else{
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
        }
        map.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_DESCRIPTION,"");
        map.put(HelperUtils.KEY_TIME,""+System.currentTimeMillis()/1000);
        map.put(HelperUtils.KEY_TOKEN,token);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String authen(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);

        JSONObject json = JSONObject.fromObject(postData);
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setSerialNumber(json.getString(HelperUtils.KEY_ID));
        deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);

        boolean validation = false;
        boolean update = true;
        if(deviceAuthen == null){
            deviceAuthen = new DeviceAuthen();
            update = false;
        }
        deviceAuthen.setSerialNumber(json.getString(HelperUtils.KEY_ID));
        deviceAuthen.setPrivateKey(json.getString(HelperUtils.KEY_KEY));
        deviceAuthen.setIp1(json.getString(HelperUtils.KEY_IP_S));
        deviceAuthen.setIp2(json.getString(HelperUtils.KEY_IP_T));
        deviceAuthen.setMac1(json.getString(HelperUtils.KEY_MAC_S));
        deviceAuthen.setMac2(json.getString(HelperUtils.KEY_MAC_T));
        deviceAuthen.setVersion1(json.getString(HelperUtils.KEY_VERSION_S));
        deviceAuthen.setVersion2(json.getString(HelperUtils.KEY_VERSION_T));
        deviceAuthen.setToken(token);
        if(update){
            deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
        }else{
            deviceAuthenService.insertSelective(deviceAuthen);
        }

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation){
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
        }else{
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_DESCRIPTION,"error.");
        map.put(HelperUtils.KEY_FRQ,"626");
        map.put(HelperUtils.KEY_PROGRAMS,"1,3,5,7,9");

        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }


    private void parseReportProgram(String content,String token,String serialNumber){
        JSONObject jsonObject = JSONObject.fromObject(content);
        ProgramService programService = ctx.getBean(ProgramService.class);
        Integer srcnumber = jsonObject.getInt(HelperUtils.KEY_RP_SCRNUMBER);
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("deviceSerialNumber",serialNumber);
        programService.deleteByExample(example);

        JSONArray array = jsonObject.getJSONArray(HelperUtils.KEY_RP_SRCLIST);
        int len = array.size();
        for(int i = 0;i<len;i++){
            JSONObject obj = (JSONObject) array.get(i);
            String srcid = obj.getString(HelperUtils.KEY_RP_SRCID);
            String stype = obj.getString(HelperUtils.KEY_RP_STYPE);
            Integer pnumber = obj.getInt(HelperUtils.KEY_RP_PNUMBER);
            JSONArray plist = obj.getJSONArray(HelperUtils.KEY_RP_PLIST);
            int size = plist.size();
            for(int j = 0;j<size;j++){
                JSONObject jobj = (JSONObject) plist.get(j);
                String pid = jobj.getString(HelperUtils.KEY_RP_PID);
                String pname = jobj.getString(HelperUtils.KEY_RP_PNAME);
                String ptype = jobj.getString(HelperUtils.KEY_RP_PTYPE);
                String purl = jobj.getString(HelperUtils.KEY_RP_PURL);

                Program program = new Program();
                program.setSrcNumber(srcnumber);
                program.setSrcId(srcid);
                program.setStype(stype);
                program.setPnumber(pnumber);
                program.setPid(pid);
                program.setPname(pname);
                program.setPtype(ptype);
                program.setPurl(purl);
                program.setDeviceSerialNumber(serialNumber);
                programService.insertSelective(program);
            }
        }
    }

    private String getDeviceSerialNumber(String token){
        DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
        Example example = new Example(DeviceAuthen.class);
        example.createCriteria().andEqualTo("token");
        List<DeviceAuthen> dvList = deviceAuthenService.selectByExample(example);
        String serialNumber = null;
        if(dvList != null && dvList.size() > 0){
            DeviceAuthen deviceAuthen = dvList.get(0);
            serialNumber = deviceAuthen.getSerialNumber();
        }
        return  serialNumber;
    }

    public String reportPrograms(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);
        boolean validation = false;
        if(serialNumber != null){
            parseReportProgram(postData,token,serialNumber);
        }
        //TODO
        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_DESCRIPTION, "");

        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }

    public String analysisv(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        JSONObject json = JSONObject.fromObject(postData);
        HelperUtils rj = new HelperUtils();

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String shock(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String scanFrq(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String setFrq(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String updateAd(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String setAd(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String remoteWatch(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String remoteCheck(HttpRequest request,String postData,List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String,Object> map  = new HashMap<String,Object>();
        if(validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        }else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        JSONObject jsonObject =  JSONObject.fromObject(map);
        return jsonObject.toString();
    }
}