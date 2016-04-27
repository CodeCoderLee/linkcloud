package cn.ac.bcc.mapper.core;

import cn.ac.bcc.model.core.Role;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RoleMapper extends Mapper<Role> {
    /*根据role的id查询*/
    List<Role> findRoleListByRoleIds(int[] ids);
}