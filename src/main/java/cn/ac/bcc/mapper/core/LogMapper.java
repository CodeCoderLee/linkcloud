package cn.ac.bcc.mapper.core;

import cn.ac.bcc.model.core.Log;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface LogMapper extends Mapper<Log> {
    int insertLog(@Param("log") Log log);
}