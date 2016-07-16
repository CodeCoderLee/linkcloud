package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.CompanyView;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CompanyViewMapper extends Mapper<CompanyView> {
    List<CompanyView> searchCompany(@Param("companyView") CompanyView companyView, @Param("sortName") String sortName, @Param("sortOrder") String sortOrder);
}