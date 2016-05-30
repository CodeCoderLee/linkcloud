package cn.ac.bcc.service.business.program;

import cn.ac.bcc.mapper.business.ProgramMapper;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lenovo on 2016-05-30.
 */
@Service
public class ProgramService extends BaseService<Program> {
    @Autowired
    private ProgramMapper programMapper;
}
