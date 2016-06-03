package cn.ac.bcc.controller.business.devicespace;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Comment;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserRole;
import cn.ac.bcc.service.business.comment.CommentService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
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
    private UserService userService;
    @Autowired
    private ProgramService programService;
    @Autowired
    private UserRoleService userRoleService;

    private static Log log = LogFactory.getLog(DeviceSpaceController.class);

    @RequestMapping(value = "device/{serialNumber}", produces = "text/html; charset=utf-8")
    public String index(@PathVariable String serialNumber, String openId, String appId,Model mode){
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
        Map<String,List<Program>> map = programService.findTop3Program(serialNumber);
        mode.addAttribute("map",map);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        mode.addAttribute("hasRole",hasRole);
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

    @RequestMapping(value = "play/{serialNumber}", produces = "text/html; charset=utf-8")
    public String play(@PathVariable String serialNumber,Model mode,Integer programId, String openId){
        Program program = programService.selectByPrimaryKey(programId);
        List<Comment> commentList = getCommentList(programId);
        mode.addAttribute("commentList",commentList);
        mode.addAttribute("program",program);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        return Common.BACKGROUND_PATH + "/business/devicespace/play";
    }

    @RequestMapping(value = "comment/{serialNumber}", produces = "text/html; charset=utf-8")
    public String comment(@PathVariable String serialNumber,Model mode,String text,Integer programId){
        Comment comment = new Comment();
        comment.setVideoId(programId);
        comment.setUserId(Common.findUserSessionId(getRequest()));
        User user = userService.selectByPrimaryKey(comment.getUserId());
        comment.setComment(text);
        comment.setUser(user);

        commentService.insertSelective(comment);
//        commentList.add(comment);
        mode.addAttribute("programId",programId);
        return "redirect:/space/device/commentList.shtml";
    }

    @RequestMapping(value = "commentList", produces = "text/html; charset=utf-8")
    @ResponseBody
    public List<Comment> commentList(Model mode,Integer videoId){
        return getCommentList(1);
    }

    private List<Comment> getCommentList(Integer programId){
        List<Comment> commentList = new ArrayList<Comment>();
        Comment comment = new Comment();
        comment.setVideoId(programId);
        commentList = commentService.select(comment);
        return commentList;
    }
}
