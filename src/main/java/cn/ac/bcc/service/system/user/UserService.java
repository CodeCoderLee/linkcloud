package cn.ac.bcc.service.system.user;

import cn.ac.bcc.mapper.core.UserMapper;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lifm on 2016/2/1.
 */
@Service
public class UserService extends BaseService<User> {
    @Autowired
    public UserMapper userMapper;

    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }
}
