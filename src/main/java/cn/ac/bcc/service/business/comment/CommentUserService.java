package cn.ac.bcc.service.business.comment;

import cn.ac.bcc.mapper.business.CommentMapper;
import cn.ac.bcc.mapper.business.CommentUserMapper;
import cn.ac.bcc.model.business.Comment;
import cn.ac.bcc.model.business.CommentUser;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lenovo on 2016-06-07.
 */
@Service
public class CommentUserService extends BaseService<CommentUser> {
    @Autowired
    private CommentUserMapper commentUserMapper;
}
