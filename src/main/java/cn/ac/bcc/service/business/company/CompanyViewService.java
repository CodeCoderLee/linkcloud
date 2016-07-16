package cn.ac.bcc.service.business.company;

import cn.ac.bcc.mapper.business.CompanyViewMapper;
import cn.ac.bcc.model.business.CompanyView;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 16/7/16.
 */
@Service
public class CompanyViewService extends BaseService<CompanyView> {
    @Autowired
    private CompanyViewMapper companyViewMapper;

    public List<CompanyView> searchCompany(CompanyView companyView, String sortName, String sortOrder){
        return companyViewMapper.searchCompany(companyView, sortName, sortOrder);
    }
}
