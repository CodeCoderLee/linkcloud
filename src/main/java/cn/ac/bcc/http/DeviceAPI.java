package cn.ac.bcc.http;

import cn.ac.bcc.model.business.*;
import cn.ac.bcc.service.business.advertisement.DeviceToVideoService;
import cn.ac.bcc.service.business.device.DeviceUpdateService;
import cn.ac.bcc.service.business.report.VideoReportService;
import cn.ac.bcc.service.business.version.VersionService;
import cn.ac.bcc.util.helper.*;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.service.business.program.ProgramNetDiskService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.util.HelperUtils;
import io.netty.buffer.Unpooled;
import io.netty.handler.codec.http.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
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
    public static final String URI_HEARTBEAT = "/device/heartbeat.shtml";
    public static final String URI_GETUPDATEINFO = "/device/getupdateinfo.shtml";

    public static final String DOMAIN = "http://www.linkedcloud.com.cn";
    public static Map<String,Boolean> AUTHEN_MAP = new HashMap<String, Boolean>();
    public static final int IS_DIR = 1;
    public static final int IS_NOT_DIR = 0;

    private static Log log = LogFactory.getLog(DeviceAPI.class);
    private ApplicationContext ctx;

    public DeviceAPI(ApplicationContext applicationContext) {
        this.ctx = applicationContext;
    }

    public FullHttpResponse dispatcher(HttpRequest request, String postData) throws UnsupportedEncodingException {
        String uri = request.getUri();
        int index = uri.indexOf("?");
        String query = "";
        if (index != -1) {
            query = uri.substring(index + 1);
        }
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);

        if(serialNumber != null && !OnOffLineMap.isOnline(serialNumber)){
            AUTHEN_MAP.put(serialNumber,true);
            DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
            DeviceService deviceService = ctx.getBean(DeviceService.class);
            deviceService.updateOnOffLineByNum(serialNumber, HelperUtils.OFF_LINE);
            deviceAuthenService.updateOnOffLineByNum(serialNumber, HelperUtils.OFF_LINE);
        }

        List<NameValuePair> nvList = URLEncodedUtils.parse(query, Charset.forName("UTF-8"));
        log.info("date::" + new Date() + "  uri:" + uri + "\r\n" + "token::::::::::" + token + "\r\nserialNumber:::" +  serialNumber + "\r\ndata:::::::::::" + postData);
        String jsonStr = "";
        String sessionID = null;

        uri = uri.toLowerCase();
        boolean is_ok = false;
        if (uri.contains(URI_LINKHELLO)) {
            UUID uuid = UUID.randomUUID();
            token = uuid.toString();
            //token = "b340f12c-f6e0-4c75-b87a-871296a760d2";
            sessionID = ServerCookieEncoder.encode("PHPSESSID", token);
            jsonStr = linkHello(request, postData, nvList, token);
            is_ok = true;
        } else if (uri.contains(URI_AUTHEN)) {
            jsonStr = authen(request, postData, nvList);
            is_ok = true;
        } else if (uri.contains(URI_REPORT_PROGRAMS)  && getAuthen(serialNumber)) {
            jsonStr = reportPrograms(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_ANALYSISV) && getAuthen(serialNumber)) {
            jsonStr = analysisv(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_REMOTECHECK) && getAuthen(serialNumber)) {
            jsonStr = remoteCheck(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_REMOTEWATCH) && getAuthen(serialNumber)) {
            jsonStr = remoteWatch(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_SCANFRQ) && getAuthen(serialNumber)) {
            jsonStr = scanFrq(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_SETAD) && getAuthen(serialNumber)) {
            jsonStr = setAd(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_UPDATEAD) && getAuthen(serialNumber)) {
            jsonStr = updateAd(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_SETFRQ) && getAuthen(serialNumber)) {
            jsonStr = setFrq(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_SHOCK) && getAuthen(serialNumber)) {
            jsonStr = shock(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        } else if (uri.contains(URI_HEARTBEAT) && getAuthen(serialNumber)) {
            jsonStr = heartBeat(request, postData, nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        }
//        else if(uri.contains(URI_GETUPDATEINFO) && getAuthen(serialNumber)){
//            jsonStr = getUpdateInfo(request,postData,nvList);
//            is_ok = true;
//            OnOffLineMap.online(serialNumber);
//        }
        else if(uri.contains(URI_GETUPDATEINFO)){
            jsonStr = getUpdateInfo(request,postData,nvList);
            is_ok = true;
            OnOffLineMap.online(serialNumber);
        }

        FullHttpResponse response = null;
        if(is_ok){
            response = new DefaultFullHttpResponse(HTTP_1_1, HttpResponseStatus.OK, Unpooled.wrappedBuffer(jsonStr.getBytes("UTF-8")));
            if (sessionID != null) {
                response.headers().set(SET_COOKIE, sessionID);
            }
        }else{
            response = new DefaultFullHttpResponse(HTTP_1_1, HttpResponseStatus.NON_AUTHORITATIVE_INFORMATION, Unpooled.wrappedBuffer("".getBytes("UTF-8")));
        }
        return response;
    }

    private String getCookieValue(HttpRequest request) {
        String value = null;
        try {
            String cookieStr = request.headers().get("Cookie");
            String[] args = cookieStr.split("=");
            if (args.length >= 2 && args[0].equals("PHPSESSID")) {
                value = args[1];
            }
        } catch (Exception e) {

        }
        return value;
    }

    public String linkHello(HttpRequest request, String postData, List<NameValuePair> nvList, String token) {
        // 获取设备授权令牌
        boolean validation = true;
        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_DESCRIPTION, "");
        map.put(HelperUtils.KEY_TIME, "" + System.currentTimeMillis() / 1000);
        map.put(HelperUtils.KEY_TOKEN, token);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String authen(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
        DeviceService deviceService = ctx.getBean(DeviceService.class);

        //TODO 还没有判断是否进行了设备注册操作，检查bcc_device设备表中
        JSONObject json = JSONObject.fromObject(postData);
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setSerialNumber(json.getString(HelperUtils.KEY_ID));
        deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);

        String serialNumber = json.getString(HelperUtils.KEY_ID);
        TokenNumMap.add(token,serialNumber);

        Device device = new Device();
        device.setSerialNumber(serialNumber);
        device = deviceService.selectOne(device);
        String frq = "0";
        String programIds = "";
        boolean validation = true;
        if (device != null) {
            frq = device.getWorkFrequency() != null?device.getWorkFrequency():"0";
            programIds = device.getProgramIds()!=null?device.getProgramIds():"";
            device.setOnOffLine(HelperUtils.ON_LINE);
            deviceService.updateByPrimaryKeySelective(device);
        }else{
            validation = false;
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            boolean update = true;
            if (deviceAuthen == null) {
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
            deviceAuthen.setOnOffLine(HelperUtils.ON_LINE);
            if (update) {
                deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
            } else {
                deviceAuthenService.insertSelective(deviceAuthen);
            }

            //TODO 授权
            AUTHEN_MAP.put(serialNumber,true);

            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error.");

            AUTHEN_MAP.put(serialNumber,false);
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_FRQ, frq);
        map.put(HelperUtils.KEY_PROGRAMS, programIds);

        System.out.print("on-line");
        OnOffLineMap.online(serialNumber);
        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }

     private void parseReportProgram(String content, String token, String serialNumber) {
        JSONObject jsonObject = JSONObject.fromObject(content);
        ProgramService programService = ctx.getBean(ProgramService.class);
        Integer srcnumber = jsonObject.getInt(HelperUtils.KEY_RP_SCRNUMBER);
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("deviceSerialNumber", serialNumber);
        programService.deleteByExample(example);

        ProgramNetDiskService programNetDiskService = ctx.getBean(ProgramNetDiskService.class);
        example = new Example(ProgramNetDisk.class);
        example.createCriteria().andEqualTo("deviceSerialNumber", serialNumber);
        programNetDiskService.deleteByExample(example);

        JSONArray array = jsonObject.getJSONArray(HelperUtils.KEY_RP_SRCLIST);
        int len = array.size();
        for (int i = 0; i < len; i++) {
            JSONObject obj = (JSONObject) array.get(i);
            String srcid = obj.getString(HelperUtils.KEY_RP_SRCID);
            String stype = obj.getString(HelperUtils.KEY_RP_STYPE);
            Integer pnumber = obj.getInt(HelperUtils.KEY_RP_PNUMBER);
            JSONArray plist = obj.getJSONArray(HelperUtils.KEY_RP_PLIST);
            int size = plist.size();

            List<MyProp> doList = new ArrayList<MyProp>();
            for (int j = 0; j < size; j++) {
                JSONObject jobj = (JSONObject) plist.get(j);
                String pid = jobj.getString(HelperUtils.KEY_RP_PID);
                String pname = jobj.getString(HelperUtils.KEY_RP_PNAME);
                String ptype = jobj.getString(HelperUtils.KEY_RP_PTYPE);
                String purl = jobj.getString(HelperUtils.KEY_RP_PURL);
                String pimg = "";
                try {
                    pimg = jobj.getString(HelperUtils.KEY_RP_PIMG);
                } catch (Exception e) {

                }

                int length = 0;
                if (stype.equals("netdisk")) {
                    int parentId = 0;
                    if(StringUtils.isNotEmpty(ptype)) {
                        String[] tmps = ptype.split("/");
                        length = tmps.length;
                        for (int m = 0; m < length; m++) {
                            String key = tmps[m] + "_" + m;
                            MyProp prop = new MyProp();
                            prop.setKey(key);
                            int index = doList.indexOf(prop);
                            if (index == -1) {
                                doList.add(prop);
                                ProgramNetDisk programNetDisk = new ProgramNetDisk();
                                programNetDisk.setIsDir(IS_DIR);
                                programNetDisk.setLevel(m);
                                programNetDisk.setPname(tmps[m]);
                                programNetDisk.setStype("netdisk");
                                programNetDisk.setDeviceSerialNumber(serialNumber);
                                programNetDisk.setParentId(parentId);
                                programNetDiskService.insertSelective(programNetDisk);
                                parentId = programNetDisk.getId();
                                prop.setParentId(parentId);
                            }else{
                                prop = doList.get(index);
                                parentId = prop.getParentId();
                            }
                        }
                    }
                    ProgramNetDisk programNetDisk = new ProgramNetDisk();
                    programNetDisk.setSrcNumber(srcnumber);
                    programNetDisk.setSrcId(srcid);
                    programNetDisk.setStype(stype);
                    programNetDisk.setPnumber(pnumber);
                    programNetDisk.setPid(pid);
                    programNetDisk.setPname(pname);
                    programNetDisk.setPtype(ptype);
                    programNetDisk.setPurl(purl);
                    programNetDisk.setPimg(pimg);
                    programNetDisk.setDeviceSerialNumber(serialNumber);
                    programNetDisk.setIsDir(IS_NOT_DIR);
                    programNetDisk.setLevel(length);
                    programNetDisk.setParentId(parentId);
                    programNetDiskService.insertSelective(programNetDisk);
                }else{
                    Program program = new Program();
                    program.setSrcNumber(srcnumber);
                    program.setSrcId(srcid);
                    program.setStype(stype);
                    program.setPnumber(pnumber);
                    program.setPid(pid);
                    program.setPname(pname);
                    program.setPtype(ptype);
                    program.setPurl(purl);
                    program.setPimg(pimg);
                    program.setDeviceSerialNumber(serialNumber);
                    programService.insertSelective(program);
                }
            }
        }
    }

    private String getDeviceSerialNumber(String token) {
        String serialNumber = "";
        try{
            serialNumber = TokenNumMap.get(token);
        }catch (Exception e){
//            e.printStackTrace();
        }
        return serialNumber;
    }

    public String reportPrograms(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);

        boolean validation = true;
        if (serialNumber != null) {
            try {
                DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
                DeviceAuthen deviceAuthen = new DeviceAuthen();
                deviceAuthen.setSerialNumber(serialNumber);
                deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);
                if(deviceAuthen != null){
                    deviceAuthen.setPrograms(postData);
                    deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
                }
            }catch (Exception e){

            }
            parseReportProgram(postData, token, serialNumber);
        }

        //TODO
        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_DESCRIPTION, "");

        JSONObject object = JSONObject.fromObject(map);
        return object.toString();
    }

    public String getUpdateInfo(HttpRequest request,String postData,List<NameValuePair> nvList){
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);
        boolean validation = true;
        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_NOTHING);

        DeviceUpdateService deviceUpdateService  = ctx.getBean(DeviceUpdateService.class);
        Example example = new Example(DeviceUpdate.class);
        example.createCriteria().andEqualTo("serialNumber",serialNumber).andEqualTo("isUpdate",0);
        example.setOrderByClause("id desc");
        List<DeviceUpdate> versionList = deviceUpdateService.selectByExample(example);
        DeviceUpdate update = getUpdateVersion(versionList);
        if(update == null) {
            map.put(HelperUtils.KEY_VER_VERSION_B, "");
            map.put(HelperUtils.KEY_VER_URL_B, "");
        }else{
            update.setIsUpdate(1); //标记为已处理
            deviceUpdateService.updateByPrimaryKeySelective(update);

            String updateInfo = update.getUpdateInfo();
            JSONObject obj = JSONObject.fromObject(updateInfo);
            JSONArray array = obj.getJSONArray("versions");
            for(int i = 0;i<array.size();i++){
                JSONObject jobj = array.getJSONObject(i);
//                jobj.getString("id");
//                jobj.getString("name");
                String url = jobj.getString("url");
                String type = jobj.getString("type");
                String version = jobj.getString("version");
//                jobj.getString("fileName");
//                jobj.getString("modelName");
                int type0 = Integer.parseInt(type);
                switch (type0){
                    case 1:
                        //引导模块
                        map.put(HelperUtils.KEY_VER_VERSION_B, version);
                        map.put(HelperUtils.KEY_VER_URL_B, DeviceAPI.DOMAIN + url);
                        break;
                    case 2:
                        //转码模块
                        map.put(HelperUtils.KEY_VER_VERSION_T, version);
                        map.put(HelperUtils.KEY_VER_URL_T, DeviceAPI.DOMAIN + url);
                        break;
                    case 3:
                        //流媒体模块
                        map.put(HelperUtils.KEY_VER_VERSION_S, version);
                        map.put(HelperUtils.KEY_VER_URL_S, DeviceAPI.DOMAIN + url);
                        break;
                }
            }
        }
        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String getUpdateInfo2(HttpRequest request,String postData,List<NameValuePair> nvList){
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);
        boolean validation = true;
        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND,HelperUtils.CMD_NOTHING);

        VersionService versionService = ctx.getBean(VersionService.class);
        Example example = new Example(Version.class);
        example.createCriteria().andEqualTo("type",1);//引导模块
        example.setOrderByClause("id desc");
        List<Version> versionList = versionService.selectByExample(example);
        Version version = getVersion(versionList);
        if(version == null) {
            map.put(HelperUtils.KEY_VER_VERSION_B, "");
            map.put(HelperUtils.KEY_VER_URL_B, "");
        }else{
            map.put(HelperUtils.KEY_VER_VERSION_B, version.getVersion());
            map.put(HelperUtils.KEY_VER_URL_B, version.getUrl());
        }

        example = new Example(Version.class);
        example.createCriteria().andEqualTo("type",2);//转码模块
        example.setOrderByClause("id desc");
        versionList = versionService.selectByExample(example);
        version = getVersion(versionList);
        if(version == null) {
            map.put(HelperUtils.KEY_VER_VERSION_T,"");
            map.put(HelperUtils.KEY_VER_URL_T,"");
        }else{
            map.put(HelperUtils.KEY_VER_VERSION_T, version.getVersion());
            map.put(HelperUtils.KEY_VER_URL_T, version.getUrl());
        }


        example = new Example(Version.class);
        example.createCriteria().andEqualTo("type",3);//流媒体模块
        example.setOrderByClause("id desc");
        versionList = versionService.selectByExample(example);
        version = getVersion(versionList);
        if(version == null) {
            map.put(HelperUtils.KEY_VER_VERSION_S,"");
            map.put(HelperUtils.KEY_VER_URL_S,"");
        }else{
            map.put(HelperUtils.KEY_VER_VERSION_S, version.getVersion());
            map.put(HelperUtils.KEY_VER_URL_S, version.getUrl());
        }

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    private DeviceUpdate getUpdateVersion(List<DeviceUpdate> list){
        return list != null && list.size() > 0?list.get(0):null;
    }

    private Version getVersion(List<Version> list){
        return list != null && list.size() > 0?list.get(0):null;
    }

    public String analysisv(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        JSONObject json = null;
        try{
            json = JSONObject.fromObject(postData);
            String number = json.getString("number");
            JSONArray array = json.getJSONArray("list");
            VideoReportService videoReportService = ctx.getBean(VideoReportService.class);
            validation = videoReportService.addReportData(array);
        }catch (Exception e){
            validation = false;
        }


        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String shock(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    private void parseScanFreq(String postData, String serialNumber) {
        JSONObject json = JSONObject.fromObject(postData);
        String scanEndedStr = json.getString("scan_ended");
        boolean scanEnded = "1".equals(scanEndedStr) ? true : false;
        String progressStr = json.getString("progress");
        int progress = Integer.parseInt(progressStr);
        String frqsNumStr = json.getString("frqs_num");
        int frqsNum = frqsNumStr != null ? Integer.parseInt(frqsNumStr) : 0;


        ScanFreqInfos scanFreqInfos = MemoryMap.get(serialNumber);
        if (scanFreqInfos == null) {
            scanFreqInfos = new ScanFreqInfos();
            MemoryMap.add(serialNumber, scanFreqInfos);
        }
        scanFreqInfos.setScanEnded(scanEnded);
        scanFreqInfos.setProgress(progress);
        scanFreqInfos.setFrqsNum(frqsNum);

        JSONArray freqsArray = json.getJSONArray("frqs_list");
        int size = freqsArray.size();
        List<Freq> freqList = new ArrayList<Freq>();

        for (int i = 0; i < size; i++) {
            JSONObject freqObject = (JSONObject) freqsArray.get(i);
            String freq = freqObject.getString("frq");
            String strengthStr = freqObject.getString("strenght");
            String snrStr = freqObject.getString("snr");
            int strength = Integer.parseInt(strengthStr);
            int snr = Integer.parseInt(snrStr);

            Freq freqObj = new Freq();
            freqObj.setFrq(freq);
            freqObj.setStrength(strength);
            freqObj.setSnr(snr);
            freqList.add(freqObj);

            JSONArray programsArray = freqObject.getJSONArray("progs_list");
            int len = programsArray.size();
            List<ScanFreqProgram> fpList = new ArrayList<ScanFreqProgram>();
            freqObj.setProgramList(fpList);
            for (int j = 0; j < len; j++) {
                JSONObject programObject = (JSONObject) programsArray.get(j);
                String pid = programObject.getString("pid");
                String name = programObject.getString("name");
                String ca = programObject.getString("ca");
                String vpid = programObject.getString("vpid");
                String venc = programObject.getString("venc");
                String apid = programObject.getString("apid");
                String aenc = programObject.getString("aenc");

                ScanFreqProgram fp = new ScanFreqProgram();
                fp.setPid(pid);
                fp.setName(name);
                fp.setCa(ca);
                fp.setVpid(vpid);
                fp.setVenc(venc);
                fp.setApid(apid);
                fp.setAenc(aenc);
                fpList.add(fp);
            }
        }
        scanFreqInfos.setFreqList(freqList);
    }

    public String scanFrq(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);
        boolean validation = true;
        if (serialNumber != null) {
            parseScanFreq(postData, serialNumber);
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String setFrq(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        String serialNumber = getDeviceSerialNumber(token);

        String keyFreq = null;
        String keyPrograms = null;
        JSONObject cmmd = CommandMap.getCommand(serialNumber);
        if (cmmd != null) {
            keyFreq = (String) cmmd.get(HelperUtils.KEY_FRQ);
            keyPrograms = (String) cmmd.get(HelperUtils.KEY_PROGRAMS);
        }
        //TODO for Test
        if (StringUtils.isEmpty(keyFreq)) keyFreq = "626";
        if (StringUtils.isEmpty(keyPrograms)) keyPrograms = "1,3,5,7,9";

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        map.put(HelperUtils.KEY_FRQ, keyFreq);
        map.put(HelperUtils.KEY_PROGRAMS, keyPrograms);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String updateAd(HttpRequest request, String postData, List<NameValuePair> nvList) {
//        String token = getCookieValue(request);
//        boolean validation = true;
//
//        JSONObject json = JSONObject.fromObject(postData);
//
//        Map<String, Object> map = new HashMap<String, Object>();
//        if (validation) {
//            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
//            map.put(HelperUtils.KEY_DESCRIPTION, "");
//        } else {
//            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
//            map.put(HelperUtils.KEY_DESCRIPTION, "error");
//        }
//        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
//
//        JSONObject jsonObject = JSONObject.fromObject(map);
//        return jsonObject.toString();
        return  setAd(request,postData,nvList);
    }

    public String setAd(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        String serialNumber = getDeviceSerialNumber(token);
        boolean validation = true;

        DeviceToVideoService deviceToVideoService  = ctx.getBean(DeviceToVideoService.class);
        Example example = new Example(DeviceToVideo.class);
        example.createCriteria().andEqualTo("serialNumber",serialNumber);
        List<DeviceToVideo> list =  deviceToVideoService.selectByExample(example);
        DeviceToVideo dtv = null;

        Map<String, Object> map = new HashMap<String, Object>();
        if(list.size() > 0){
            dtv = list.get(0);
        }
        if(dtv == null){
            validation = false;
        }

        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");

            JSONArray jsonArr = new JSONArray();
            String selfJson  =dtv.getSelfVideoInfo();
            int num = 0;
            num += doProcessAd(selfJson,jsonArr);

            String companyJson = dtv.getCompanyVideoInfo();
            num += doProcessAd(companyJson,jsonArr);

            String customJson = dtv.getCustomVideoInfo();
            num += doProcessAd(customJson,jsonArr);
            map.put(HelperUtils.KEY_AD_NUMBER, String.valueOf(num));
            map.put(HelperUtils.KEY_AD_LIST,jsonArr);
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
            map.put(HelperUtils.KEY_AD_NUMBER, "0");
            map.put(HelperUtils.KEY_AD_LIST, "[]");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    private int doProcessAd(String jsonStr,JSONArray array){
        JSONObject jsonObj = null;
        try{
            jsonObj = JSONObject.fromObject(jsonStr);
            JSONArray jsonArr = jsonObj.getJSONArray("videos");
            int size = jsonArr.size();
            for(int i = 0;i<size;i++){
                JSONObject obj = jsonArr.getJSONObject(i);
                String url = obj.getString("url");
                String id = obj.getString("id");
                JSONObject adObj = new JSONObject();
                adObj.put("url",DOMAIN + url);
                adObj.put("op","add");
                adObj.put("pid",id);
                array.add(adObj);
            }
            return size;
        }catch (Exception e){
            //e.printStackTrace();
            return 0;
        }
    }

    public String remoteWatch(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);

        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String remoteCheck(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;

        JSONObject json = JSONObject.fromObject(postData);

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }
        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public String heartBeat(HttpRequest request, String postData, List<NameValuePair> nvList) {
        String token = getCookieValue(request);
        boolean validation = true;
        long currentTime = System.currentTimeMillis();

        JSONObject json = JSONObject.fromObject(postData);
        json.put("time",currentTime);
        if(nvList != null && nvList.size() > 0){
            NameValuePair nvp = nvList.get(0);
            if(nvp.getName().equals("seq")){
                json.put("seq",nvp.getValue());
            }
        }
        postData = json.toString();
        //{"dstat":"0","line":"480","temper":"68","locked":"1","frq":"786000000","strength":"179","snr":"13","dprogs":"3","ndisks":"0","camers":"0","sessions":"0"}
        String serialNumber = getDeviceSerialNumber(token);
        long oldTime = HeartBeatMap.getTimestamp(serialNumber);
        boolean isUpdate = HeartBeatMap.add(serialNumber, postData);
        if(isUpdate){
            DeviceAuthenService deviceAuthenService = ctx.getBean(DeviceAuthenService.class);
            DeviceAuthen deviceAuthen = new DeviceAuthen();
            deviceAuthen.setSerialNumber(serialNumber);
            deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);
            if(deviceAuthen != null){
                deviceAuthen.setHeartbeat(postData);
                deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
            }
        }

        Map<String, Object> map = new HashMap<String, Object>();
        if (validation) {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_SUCCESS);
            map.put(HelperUtils.KEY_DESCRIPTION, "");
        } else {
            map.put(HelperUtils.KEY_RESULT, HelperUtils.RESULT_FAIL);
            map.put(HelperUtils.KEY_DESCRIPTION, "error");
        }

        //TODO 从CommandMap中获取
        JSONObject obj = CommandMap.getCommand(serialNumber);
        String cmd = obj != null ? obj.getString(HelperUtils.KEY_COMMAND) : "";
        if (HelperUtils.CMD_SCANFRQ.equals(cmd)) {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_SCANFRQ);
        } else if (HelperUtils.CMD_SETFRQ.equals(cmd)) {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_SETFRQ);
        } else if (HelperUtils.CMD_SHOCK.equals(cmd)) {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_SHOCK);
        } else if (HelperUtils.CMD_REMOTEWATCH.equals(cmd)) {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_REMOTEWATCH);
        } else if (HelperUtils.CMD_UPDATEAD.equals(cmd)) {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_UPDATEAD);
        } else if(HelperUtils.CMD_UPDATE_VERSION.equals(cmd)){
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_UPDATE_VERSION);
        } else {
            map.put(HelperUtils.KEY_COMMAND, HelperUtils.CMD_NOTHING);
        }
        JSONObject jsonObject = JSONObject.fromObject(map);
        return jsonObject.toString();
    }

    public boolean getAuthen(String serialNumber){
        boolean authen = false;
        try {
            authen = AUTHEN_MAP.get(serialNumber);
        }catch (Exception e){
            authen =false;
            //e.printStackTrace();
        }
        return  authen;
    }



    public static void main(String[] args) {
        String s = "";
        if(StringUtils.isNotEmpty(s)) {
            String[] tmps = s.split("/");
            int k = tmps.length;
            int m = 0;
        }
    }
}
