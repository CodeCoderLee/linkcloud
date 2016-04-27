package cn.ac.bcc.service.interfaces;

import cn.ac.bcc.model.core.Role;

import java.util.List;

/**
 * Created by bcc on 16/3/23.
 */
public interface IRoleService {
    /*根据role的id查询*/
    List<Role> findRoleListByRoleIds(int[] ids);
}
