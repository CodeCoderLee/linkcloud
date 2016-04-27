package cn.ac.bcc.service.system.role;

import cn.ac.bcc.mapper.core.RoleMapper;
import cn.ac.bcc.model.core.Role;
import cn.ac.bcc.service.base.BaseService;
import cn.ac.bcc.service.interfaces.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 2016/2/2.
 */
@Service
public class RoleService extends BaseService<Role> implements IRoleService{

    @Autowired
    private RoleMapper roleMapper;

    public List<Role> findRoleListByRoleIds(int[] ids) {
        return roleMapper.findRoleListByRoleIds(ids);
    }
}
