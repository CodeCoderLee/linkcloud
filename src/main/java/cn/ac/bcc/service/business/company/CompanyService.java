package cn.ac.bcc.service.business.company;

import cn.ac.bcc.mapper.business.CompanyMapper;
import cn.ac.bcc.model.business.Company;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bcc on 16/5/22.
 */
@Service
public class CompanyService extends BaseService<Company> {
    @Autowired
    private CompanyMapper companyMapper;
}
