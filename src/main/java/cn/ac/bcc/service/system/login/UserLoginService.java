package cn.ac.bcc.service.system.login;

import cn.ac.bcc.mapper.core.UserLoginMapper;
import cn.ac.bcc.model.core.UserLogin;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lifm on 2016/2/1.
 */
@Service("userLoginService")
public class UserLoginService extends BaseService<UserLogin>{
    @Autowired
    private UserLoginMapper userLoginMapper;

}
