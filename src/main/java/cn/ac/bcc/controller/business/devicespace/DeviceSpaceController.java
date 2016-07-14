package cn.ac.bcc.controller.business.devicespace;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.*;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserRole;
import cn.ac.bcc.service.business.advertisement.AdvertisementPublishService;
import cn.ac.bcc.service.business.comment.CommentService;
import cn.ac.bcc.service.business.comment.CommentUserService;
import cn.ac.bcc.service.business.device.DeviceAuthenService;
import cn.ac.bcc.service.business.device.DeviceService;
import cn.ac.bcc.service.business.program.ProgramNetDiskService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import cn.ac.bcc.util.helper.HeartBeatMap;
import cn.ac.bcc.util.helper.MemoryMap;
import cn.ac.bcc.util.helper.ScanFreqInfos;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016-05-26.
 */
@Controller
@RequestMapping("/space/")
public class DeviceSpaceController extends BaseController<Comment>{
    @Autowired
    private CommentService commentService;
    @Autowired
    private CommentUserService commentUserService;

    @Autowired
    private UserService userService;
    @Autowired
    private ProgramService programService;
    @Autowired
    private ProgramNetDiskService programNetDiskService;
    @Autowired
    private UserRoleService userRoleService;
    @Autowired
    private DeviceService deviceService;
    @Autowired
    private DeviceAuthenService deviceAuthenService;
    @Autowired
    private AdvertisementPublishService advertisementPublishService;

    private final int PAGE_SIZE = 10;
    private final int SHOW_STATUS = 3;
    private final int DEBUG_STATUS = 1;
    private static Log log = LogFactory.getLog(DeviceSpaceController.class);

    @RequestMapping(value = "debug", produces = "text/html; charset=utf-8")
    public String debug(Model mode,String openId,String type, Integer pageNum){
        boolean hasRole = false;
        if(openId != null){
            User user = new User();
            /*通过openId获取user信息*/
            user.setAccountname(openId);
            user = userService.selectOne(user);
            if(user != null){
                Integer userId = user.getId();
                UserRole userRole = new UserRole();
                userRole.setUserid(userId);
                List<UserRole> urList = userRoleService.select(userRole);
                if(urList != null && urList.size() > 0){
                    hasRole = true;
                }
            }
        }
        Device device = new Device();
        ResponseData rd = searchByPage(device,pageNum,DEBUG_STATUS);
        mode.addAttribute("rd",rd);
        mode.addAttribute("openId",openId);
        mode.addAttribute("hasRole",hasRole);
        mode.addAttribute("type",type);
        return Common.BACKGROUND_PATH + "/business/devicespace/debug";
    }

    @RequestMapping(value = "debugList", produces = "text/html; charset=utf-8")
    @ResponseBody
    public ResponseData debugList(Device device,Integer pageNum){
        return searchByPage(device, pageNum,DEBUG_STATUS);
    }

    @RequestMapping(value = "showList", produces = "text/html; charset=utf-8")
    @ResponseBody
    public ResponseData showList(Device device,Integer pageNum){
        return searchByPage(device, pageNum,SHOW_STATUS);
    }

    private ResponseData searchByPage(Device device, Integer pageNum,int status) {
        int pageSize = PAGE_SIZE;
        if(pageNum == null)pageNum = 1;
        Integer userId = Common.findUserSessionId(getRequest());
        device.setStatus(status);
//        device.setRegisterAccount(userId);
//        device.setDebugAccount(userId);
        PageHelper.startPage(pageNum, pageSize);
        List<Device> list = deviceService.selectDebugDevice(device);
        PageInfo<Device> pageInfo = new PageInfo<Device>(list);
        ResponseData responseData = new ResponseData();
        responseData.setRows(list);
        responseData.setTotal(pageInfo.getTotal());
        responseData.setPageNum(pageInfo.getNextPage());
        responseData.setHasNextPage(pageInfo.isHasNextPage());
        return responseData;
    }

    @RequestMapping(value = "show", produces = "text/html; charset=utf-8")
    public String show(Model mode,String openId,String type, Integer pageNum){
        log.info("openId:::" + openId);

        boolean hasRole = false;
        if(openId != null){
            User user = new User();
            /*通过openId获取user信息*/
            user.setAccountname(openId);
            user = userService.selectOne(user);
            if(user != null){
                Integer userId = user.getId();
                UserRole userRole = new UserRole();
                userRole.setUserid(userId);
                List<UserRole> urList = userRoleService.select(userRole);
                if(urList != null && urList.size() > 0){
                    hasRole = true;
                }
            }
        }
        Device device = new Device();
        ResponseData rd = searchByPage(device,pageNum,SHOW_STATUS);
        mode.addAttribute("rd",rd);
        mode.addAttribute("openId",openId);
        mode.addAttribute("hasRole",hasRole);
        mode.addAttribute("type",type);
        return Common.BACKGROUND_PATH + "/business/devicespace/show";
    }

    @RequestMapping(value = "device/{serialNumber}", produces = "text/html; charset=utf-8")
    public String index(@PathVariable String serialNumber,String openId,String type,Model mode){
        log.info("openId:::" + openId);
        boolean hasRole = false;
        boolean isScan = false;
        if(openId != null){
            User user = new User();
            /*通过openId获取user信息*/
            user.setAccountname(openId);
            user = userService.selectOne(user);
            if(user != null){
                Integer userId = user.getId();
                UserRole userRole = new UserRole();
                userRole.setUserid(userId);
                List<UserRole> urList = userRoleService.select(userRole);
                if(urList != null && urList.size() > 0){
                    hasRole = true;
                }
            }
        }
        JSONArray array = advertisementPublishService.getAdList(serialNumber);
        DeviceAuthen deviceAuthen = deviceAuthenService.findDeviceBySerialNumber(serialNumber);
        Map<String,List<Program>> map = programService.findTop3Program(serialNumber);
        List<ProgramNetDisk> lst = programNetDiskService.findProgram(serialNumber,0,true);
        ScanFreqInfos scanFreqInfos = MemoryMap.get(serialNumber);
        if(scanFreqInfos != null && !scanFreqInfos.isScanEnded()){
            isScan = true;
        }
        String ip = deviceAuthen.getIp1();
        mode.addAttribute("ip_address",ip);
        mode.addAttribute("isScan",isScan);
        mode.addAttribute("map",map);
        mode.addAttribute("netdiskList",lst);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("hasRole",hasRole);
//        mode.addAttribute("type",type);
        if(type != null)getSession().setAttribute("_type_",type);
        mode.addAttribute("array",array);
        mode.addAttribute("arraySize",array.size());
        mode = deviceAuthen.getOnOffLine() != 1 ? mode.addAttribute("onoff", "离线") : mode.addAttribute("onoff", "在线");
        return Common.BACKGROUND_PATH + "/business/devicespace/index";
    }

    @RequestMapping(value = "list/{serialNumber}", produces = "text/html; charset=utf-8")
    public String list(@PathVariable String serialNumber,Model mode,String stype, String openId){
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("stype",stype).andEqualTo("deviceSerialNumber",serialNumber);
        List<Program> list = programService.selectByExample(example);
        mode.addAttribute("list",list);
        String title = "";
        if(stype.equals("dtmb"))title= "电视直播";
        if(stype.equals("netdisk"))title= "视频点播";
        if(stype.equals("camera"))title= "远程监控";
        mode.addAttribute("title",title);
        mode.addAttribute("stype",stype);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("openId",openId);
        return Common.BACKGROUND_PATH + "/business/devicespace/list";
    }

    @RequestMapping(value = "list2/{serialNumber}", produces = "text/html; charset=utf-8")
    public String list2(@PathVariable String serialNumber,Model mode,String stype,int parentId){
        Example example = new Example(ProgramNetDisk.class);
        example.createCriteria().andEqualTo("stype",stype).andEqualTo("deviceSerialNumber",serialNumber)
                .andEqualTo("parentId",parentId);
        List<ProgramNetDisk> list = programNetDiskService.selectByExample(example);
        mode.addAttribute("list",list);

        ProgramNetDisk pnd ;
        ProgramNetDisk grandPnd ;
        if(parentId != 0) {
            pnd = programNetDiskService.selectByPrimaryKey(parentId);
            if (pnd != null) {
                grandPnd = programNetDiskService.selectByPrimaryKey(pnd.getParentId());
                if (grandPnd == null) {
                    grandPnd = new ProgramNetDisk();
                    grandPnd.setId(0);
                    grandPnd.setPname("视频点播");
                }
            }else{
                pnd = new ProgramNetDisk();
                grandPnd = new ProgramNetDisk();
            }
        }else{
            pnd = new ProgramNetDisk();
            pnd.setPname("视频点播");
            grandPnd = new ProgramNetDisk();
            grandPnd.setId(0);
        }
        mode.addAttribute("stype",stype);
        mode.addAttribute("parent",pnd);
        mode.addAttribute("grandpa",grandPnd);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("parentId",parentId);
//        mode.addAttribute("level",level + 1);
//        mode.addAttribute("openId",openId);
        return Common.BACKGROUND_PATH + "/business/devicespace/netdisk-list";
    }

    @RequestMapping(value = "play/{serialNumber}", produces = "text/html; charset=utf-8")
    public String play(@PathVariable String serialNumber,Model mode,Integer programId, String openId){
        Program program = programService.selectByPrimaryKey(programId);
        String ptype = "";
        if(program != null)ptype = program.getStype();
        String pname = "";
        if(program != null)pname = program.getPname();

        User user = (User) Common.findUserSession(getRequest());
        Integer userId = user.getId();

        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("stype",ptype).andEqualTo("deviceSerialNumber",serialNumber);
        List<Program> list = programService.selectByExample(example);

        DeviceAuthen deviceAuthen = deviceAuthenService.findDeviceBySerialNumber(serialNumber);
        mode.addAttribute("ip_address",deviceAuthen.getIp1());

        ResponseData responseData = getCommentList(programId,1);
        mode.addAttribute("responseData",responseData);
        mode.addAttribute("program",program);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("ptype",ptype);
        mode.addAttribute("pname",pname);
        mode.addAttribute("userId",userId);
        mode.addAttribute("list",list);
        return Common.BACKGROUND_PATH + "/business/devicespace/play";
    }

    @RequestMapping(value = "play2/{serialNumber}", produces = "text/html; charset=utf-8")
    public String play2(@PathVariable String serialNumber,Model mode,Integer programId, String openId){
        ProgramNetDisk programNetDisk = programNetDiskService.selectByPrimaryKey(programId);
        String pname = "";
        if(programNetDisk != null)pname = programNetDisk.getPname();
        DeviceAuthen deviceAuthen = deviceAuthenService.findDeviceBySerialNumber(serialNumber);

        User user = (User) Common.findUserSession(getRequest());
        Integer userId = user.getId();

        mode.addAttribute("ip_address",deviceAuthen.getIp1());

        ResponseData responseData = getCommentList(programId,1);
        mode.addAttribute("responseData",responseData);
        mode.addAttribute("program",programNetDisk);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("ptype","netdisk");
        mode.addAttribute("pname",pname);
        mode.addAttribute("userId",userId);
        return Common.BACKGROUND_PATH + "/business/devicespace/netdisk-play";
    }

    @RequestMapping(value = "comment", produces = "text/html; charset=utf-8")
    public String comment(String serialNumber,Model mode,String text,Integer programId,Integer pageNum){
        if(pageNum == null) pageNum = 1;
        Comment comment = new Comment();
        comment.setVideoId(programId);
        comment.setUserId(Common.findUserSessionId(getRequest()));
        User user = userService.selectByPrimaryKey(comment.getUserId());
        comment.setComment(text);
        comment.setUser(user);
        comment.setPublishDate(new Date());
        commentService.insertSelective(comment);
//        commentList.add(comment);
        mode.addAttribute("programId",programId);
        mode.addAttribute("pageNum",pageNum);
        return "redirect:/space/commentList.shtml";
    }

    @RequestMapping(value = "commentList", produces = "text/html; charset=utf-8")
    @ResponseBody
    public ResponseData commentList(Model mode,Integer videoId,Integer pageNum){
        return getCommentList(1, pageNum);
    }

    private List<Comment> getCommentList(Integer programId,Integer pageNum,Integer pageSize){
        List<Comment> commentList = new ArrayList<Comment>();
        Example example = new Example(Comment.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("videoId",programId);
        example.setOrderByClause("publishDate desc");
        PageInfo<Comment> pageInfo = commentService.selectByPage(pageNum,pageSize);
        return pageInfo.getList();// commentList;
    }

    private ResponseData getCommentList(Integer programId,Integer pageNum){
        int pageSize = 5;
        CommentUser commentUser = new CommentUser();
        PageHelper.offsetPage((pageNum - 1) * pageSize, pageSize);
        getRequest().setAttribute("order","desc");
        getRequest().setAttribute("sort","publishDate");

        Example example = new Example(CommentUser.class);
        example = getEqualsToExample(example);
        User user = (User) Common.findUserSession(getRequest());

        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("videoId",programId);
        List<CommentUser> commentList = commentUserService.selectByExample(example);
        for(CommentUser cu: commentList){
            Date pd = cu.getPublishDate();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd H:m:s");
            cu.setPublishDateStr(format.format(pd));
            if(user.getId() == cu.getUserId()){
                //可以删除修改
                cu.setUpdate(true);
            }else{
                //不能删除修改
                cu.setUpdate(false);
            }
        }
        PageInfo<CommentUser> pageInfo = new PageInfo<CommentUser>(commentList);
        ResponseData responseData = new ResponseData();
        responseData.setRows(pageInfo.getList());
        responseData.setTotal(pageInfo.getTotal());
        responseData.setPageNum(pageInfo.getNextPage());
        responseData.setHasNextPage(pageInfo.isHasNextPage());
        return responseData;
    }

    @RequestMapping(value = "getTvPrograms/{serialNumber}", produces = "text/html; charset=utf-8")
    @ResponseBody
    public ScanFreqInfos getTvPrograms(@PathVariable String serialNumber,Model mode){
        ScanFreqInfos ret = null;//new ScanFreqInfos();
        try {
            ScanFreqInfos scanFreqInfos = MemoryMap.get(serialNumber);
            if(scanFreqInfos != null){
                ret = new ScanFreqInfos();
                ret.setScanEnded(scanFreqInfos.isScanEnded());
                ret.setProgress(scanFreqInfos.getProgress());
            }
        }catch (Exception e){

        }
        return ret;
    }

    @RequestMapping(value = "getHeartBeat", produces = "text/html; charset=utf-8")
    @ResponseBody
    public JSONObject getHeartBeat(Model mode,String serialNumber,String seq){
        JSONObject obj = new JSONObject();
        try {
            long oldTime = HeartBeatMap.getTimestamp(serialNumber);
            String oldSeq = HeartBeatMap.getSeq(serialNumber);
            if (!oldSeq.equals(seq) && !oldSeq.equals("-1")) {
                String json = HeartBeatMap.get(serialNumber);
                //json  = "Hello World!";
                obj.put("json",json);
                obj.put("date-time",timestampToDate(oldTime));
                obj.put("seq",oldSeq);
                obj.put("validate",true);
            }
        }catch (Exception e){

        }
        return obj;
    }

    private String timestampToDate(Long beginDate) {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        String sd = sdf.format(new Date(beginDate));
        return sd;
    }

    @RequestMapping(value = "goDebugHeartBeat/{serialNumber}", produces = "text/html; charset=utf-8")
    public String goDebugHeartBeat(@PathVariable String serialNumber,Model mode) throws IOException {
        mode.addAttribute("serialNumber",serialNumber);
        if(Common.check(getRequest(),getResponse())){
            //移动端访问
            return Common.BACKGROUND_PATH + "/business/devicespace/debug-heartbeat";
        }else {
            //pc端访问
            return Common.BACKGROUND_PATH + "/business/devicespace/debug-heartbeat-pc";
        }
    }
    /**
     * 获取object中不为空的属性相等的查询条件及order规则的Example
     *
     * @return 返回带有查询条件约束和排序规则的Example
     */
    public Example getEqualsToExample(Example example) {

        /*增加排序*/
        String sortOrder = getPara("order");
        String sortName = getPara("sort");
        if (Common.isNotEmpty(sortOrder)) {
            if (Common.isNotEmpty(sortName)) {
                String columnName = Common.getClassFieldColumnName(CommentUser.class,sortName);
                if (columnName != null) {
                    example.setOrderByClause(columnName + " " + sortOrder);
                }else
                    example.setOrderByClause("id " + sortOrder);
            } else
                example.setOrderByClause("id " + sortOrder);
        } else {
            example.setOrderByClause("id desc");
        }
        return example;
    }
}
