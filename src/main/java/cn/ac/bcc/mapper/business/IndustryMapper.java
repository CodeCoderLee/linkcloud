package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Industry;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface IndustryMapper extends Mapper<Industry> {

    /*根据父级code获取本级行业*/
    List<Industry> getIndustryByParentCode(@Param("industry") Industry industry);
}