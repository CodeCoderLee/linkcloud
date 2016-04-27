package cn.ac.bcc.service.system.log;

import cn.ac.bcc.mapper.core.LogMapper;
import cn.ac.bcc.model.core.Log;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogService extends BaseService<Log> {
    @Autowired
    public LogMapper logMapper;

	public int insertLog(Log log){
        return logMapper.insertLog(log);
    }
}
