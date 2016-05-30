package cn.ac.bcc.controller.business.devicespace;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Comment;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.service.business.comment.CommentService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016-05-26.
 */
@Controller
@RequestMapping("/space/device/")
public class SpaceDeivceController extends BaseController<Comment>{
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "index", produces = "text/html; charset=utf-8")
    public String index(Model mode,String openId){

        return Common.BACKGROUND_PATH + "/business/devicespace/index";
    }

    @RequestMapping(value = "list", produces = "text/html; charset=utf-8")
    public String list(Model mode){

        return Common.BACKGROUND_PATH + "/business/devicespace/list";
    }

    @RequestMapping(value = "play", produces = "text/html; charset=utf-8")
    public String play(Model mode,Integer videoId){
        List<Comment> commentList = getCommentList(1);
        mode.addAttribute("commentList",commentList);
        return Common.BACKGROUND_PATH + "/business/devicespace/play";
    }

    @RequestMapping(value = "comment", produces = "text/html; charset=utf-8")
    public String comment(Model mode,String text){
        Comment comment = new Comment();
        comment.setVideoId(1);
        comment.setUserId(Common.findUserSessionId(getRequest()));
        User user = userService.selectByPrimaryKey(comment.getUserId());
        comment.setComment(text);
        comment.setUser(user);

        commentService.insertSelective(comment);
//        commentList.add(comment);
        mode.addAttribute("videoId",1);
        return "redirect:/space/device/commentList.shtml";
    }

    @RequestMapping(value = "commentList", produces = "text/html; charset=utf-8")
    @ResponseBody
    public List<Comment> commentList(Model mode,Integer videoId){
        return getCommentList(1);
    }

    private List<Comment> getCommentList(Integer videoId){
        List<Comment> commentList = new ArrayList<Comment>();
        Comment comment = new Comment();
        comment.setVideoId(videoId);
        commentList = commentService.select(comment);
        return commentList;
    }
}
