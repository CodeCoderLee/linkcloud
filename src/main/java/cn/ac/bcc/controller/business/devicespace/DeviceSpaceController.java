package cn.ac.bcc.controller.business.devicespace;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Comment;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.service.business.comment.CommentService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping("/space/device/")
public class DeviceSpaceController extends BaseController<Comment>{
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProgramService programService;

    private static Log log = LogFactory.getLog(DeviceSpaceController.class);

    @RequestMapping(value = "index", produces = "text/html; charset=utf-8")
    public String index(Model mode,String openId){
        log.info("openId:::" + openId);
        Map<String,List<Program>> map = programService.findTop3Program("9acd5102-b150-45fc-afad-331bb51d6b79");
        mode.addAttribute("map",map);
        mode.addAttribute("openId",openId);
        return Common.BACKGROUND_PATH + "/business/devicespace/index";
    }

    @RequestMapping(value = "list", produces = "text/html; charset=utf-8")
    public String list(Model mode,String stype){
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("stype",stype);
        List<Program> list = programService.selectByExample(example);
        mode.addAttribute("list",list);
        String title = "";
        if(stype.equals("dtmb"))title= "电视直播";
        if(stype.equals("netdisk"))title= "视频点播";
        if(stype.equals("camera"))title= "远程监控";
        mode.addAttribute("title",title);
        mode.addAttribute("stype",stype);
        return Common.BACKGROUND_PATH + "/business/devicespace/list";
    }

    @RequestMapping(value = "play", produces = "text/html; charset=utf-8")
    public String play(Model mode,Integer programId){
        Program program = programService.selectByPrimaryKey(programId);
        List<Comment> commentList = getCommentList(programId);
        mode.addAttribute("commentList",commentList);
        mode.addAttribute("program",program);
        return Common.BACKGROUND_PATH + "/business/devicespace/play";
    }

    @RequestMapping(value = "comment", produces = "text/html; charset=utf-8")
    public String comment(Model mode,String text,Integer programId){
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
