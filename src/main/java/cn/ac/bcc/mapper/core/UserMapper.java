package cn.ac.bcc.mapper.core;

import cn.ac.bcc.model.core.User;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectKey;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {

    int insertUser(@Param("user")User user);
}