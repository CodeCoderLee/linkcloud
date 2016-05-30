package cn.ac.bcc.controller.ws;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.model.core.Role;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import cn.ac.bcc.util.ResponseJson;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.json.Json;
import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016-05-23.
 */
@Controller
@RequestMapping("/ws/device/")
public class DeviceApiController extends BaseController{
    @Autowired
    private DeviceAuthenService deviceAuthenService;
    @Autowired
    private ProgramService programService;

    private final static String COOKIE = Common.COOKIE;
    @ResponseBody
    @RequestMapping(value = "linkHello")
    public ResponseJson linkHello(Integer seq) {
        // 获取设备授权令牌
        String token = getRequest().getSession(true).getId();
        getResponse().addCookie(new Cookie(COOKIE,token));

        ResponseJson rj = new ResponseJson();
        rj.setResult(ResponseJson.RESULT_SUCCESS);
        rj.setCommand(ResponseJson.Command.Nothing);
        rj.setDescription("no error.");
        rj.setTime(System.currentTimeMillis()/1000);
        rj.setToken(token);
        return rj;
    }

    @ResponseBody
    @RequestMapping(value = "authen")
    public Map<String,Object> authen(Integer seq,String authen) {
        String token = getRequest().getSession(true).getId();
        boolean validation = Common.validateToken(getRequest().getCookies(),token);
        System.out.println("authen-----\r\n" + authen);

        JSONObject json = JSONObject.fromObject(authen);
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setSerialNumber(json.getString(ResponseJson.KEY_ID));
        deviceAuthen = deviceAuthenService.selectOne(deviceAuthen);

        deviceAuthen.setPrivateKey(json.getString(ResponseJson.KEY_KEY));
        deviceAuthen.setIp1(json.getString(ResponseJson.KEY_IP1));
        deviceAuthen.setIp2(json.getString(ResponseJson.KEY_IP2));
        deviceAuthen.setMac1(json.getString(ResponseJson.KEY_MAC1));
        deviceAuthen.setMac2(json.getString(ResponseJson.KEY_MAC2));
        deviceAuthen.setVersion1(json.getString(ResponseJson.KEY_VERSION1));
        deviceAuthen.setVersion2(json.getString(ResponseJson.KEY_VERSION2));
        deviceAuthen.setToken(token);
        if(deviceAuthen != null){
            deviceAuthenService.updateByPrimaryKeySelective(deviceAuthen);
        }else{
            deviceAuthenService.insertSelective(deviceAuthen);
        }

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
        getResponse().addCookie(new Cookie(COOKIE,token));
        return map;
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    private void parseReportProgram(String content){
        JSONObject jsonObject = JSONObject.fromObject(content);

        Integer srcnumber = jsonObject.getInt(ResponseJson.KEY_RP_SCRNUMBER);
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("srcnumber",srcnumber);
        programService.deleteByExample(example);

        JSONArray array = jsonObject.getJSONArray(ResponseJson.KEY_RP_SRCLIST);
        int len = array.size();
        for(int i = 0;i<len;i++){
            JSONObject obj = (JSONObject) array.get(i);
            String srcid = obj.getString(ResponseJson.KEY_RP_SRCID);
            String stype = obj.getString(ResponseJson.KEY_RP_STYPE);
            Integer pnumber = obj.getInt(ResponseJson.KEY_RP_PNUMBER);
            JSONArray plist = obj.getJSONArray(ResponseJson.KEY_RP_PLIST);
            int size = plist.size();
            for(int j = 0;j<size;j++){
                JSONObject jobj = (JSONObject) plist.get(j);
                String pid = jobj.getString(ResponseJson.KEY_RP_PID);
                String pname = jobj.getString(ResponseJson.KEY_RP_PNAME);
                String ptype = jobj.getString(ResponseJson.KEY_RP_PTYPE);
                String purl = jobj.getString(ResponseJson.KEY_RP_PURL);

                Program program = new Program();
                program.setSrcNumber(srcnumber);
                program.setSrcId(srcid);
                program.setStype(stype);
                program.setPnumber(pnumber);
                program.setPid(pid);
                program.setPname(pname);
                program.setPtype(ptype);
                program.setPurl(purl);
                programService.insertSelective(program);
            }
        }
    }

    @ResponseBody
    @RequestMapping(value = "reportPrograms")
    public Map<String,Object> reportPrograms(Integer seq) {
        String token = "12312sdfgsdgfegrfger";
        boolean validation = Common.validateToken(getRequest().getCookies(),token);

        String content = readRequestInputStream();
        System.out.println("reportPrograms-----\r\n" + content);
        parseReportProgram(content);
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
        getResponse().addCookie(new Cookie(COOKIE,token));
        return map;
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
            rj.setResult(ResponseJson.RESULT_FAIL);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("error.");
        }else{
            rj.setResult(ResponseJson.RESULT_SUCCESS);
            rj.setCommand(ResponseJson.Command.Nothing);
            rj.setDescription("no error.");
        }
        getResponse().addCookie(new Cookie(COOKIE,token));
        return rj;
    }

    public static void main(String[] args){
//        Map<String,String> map = new HashMap<String, String>();
//        map.put("id","88888888");
//        map.put("key","asdasertert");
//        map.put("ip1","192.168.0.10");
//        map.put("ip2","192.168.0.11");
//        map.put("mac1","80:80:88:88:88:88");
//        map.put("mac2","81:81:88:88:88:88");
//        map.put("version1","1.16.0413.1");
//        map.put("version2","1.16.0413.1");
//        Object obj = JSONObject.fromObject(map);
//        System.out.print(obj);


        ResponseJson rj = new ResponseJson();
        rj.setResult(ResponseJson.RESULT_SUCCESS);
        rj.setCommand(ResponseJson.Command.Nothing);
        rj.setDescription("no error.");
        rj.setTime(System.currentTimeMillis()/1000);
        rj.setToken("000000000000000000");

        JSONObject obj = JSONObject.fromObject(rj);
        System.out.println("obj---------------" + obj.toString());
    }
}
