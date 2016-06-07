package cn.ac.bcc.controller.business.devicespace;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Area;
import cn.ac.bcc.model.business.Comment;
import cn.ac.bcc.model.business.CommentUser;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.model.core.UserRole;
import cn.ac.bcc.service.business.comment.CommentService;
import cn.ac.bcc.service.business.comment.CommentUserService;
import cn.ac.bcc.service.business.program.ProgramService;
import cn.ac.bcc.service.system.user.UserRoleService;
import cn.ac.bcc.service.system.user.UserService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    private UserRoleService userRoleService;

    private static Log log = LogFactory.getLog(DeviceSpaceController.class);

    @RequestMapping(value = "device/{serialNumber}", produces = "text/html; charset=utf-8")
    public String index(@PathVariable String serialNumber,String openId,Model mode){
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
        ResponseData responseData = getCommentList(programId,1);
        mode.addAttribute("responseData",responseData);
        mode.addAttribute("program",program);
        mode.addAttribute("openId",openId);
        mode.addAttribute("serialNumber",serialNumber);
        int k = 0;
        return Common.BACKGROUND_PATH + "/business/devicespace/play";
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

//    private List<Comment> getCommentList(Integer programId,Integer pageNum,Integer pageSize){
//        List<Comment> commentList = new ArrayList<Comment>();
//        Example example = new Example(Comment.class);
//        Example.Criteria criteria = example.createCriteria();
//        criteria.andEqualTo("videoId",programId);
//        example.setOrderByClause("publishDate desc");
//        PageInfo<Comment> pageInfo = commentService.selectByPage(pageNum,pageSize);
//        return pageInfo.getList();// commentList;
//    }

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
