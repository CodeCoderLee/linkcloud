package cn.ac.bcc.service.business.industry;

import cn.ac.bcc.mapper.business.IndustryMapper;
import cn.ac.bcc.model.business.Industry;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bcc on 16/5/22.
 */
@Service
public class IndustryService extends BaseService<Industry> {
    @Autowired
    private IndustryMapper industryMapper;
}
