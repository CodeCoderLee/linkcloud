package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Area;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AreaMapper extends Mapper<Area> {
    List<Area> searchArea(@Param("area") Area area);
}