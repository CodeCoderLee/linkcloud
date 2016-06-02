package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceApplyMapper;
import cn.ac.bcc.model.business.DeviceApply;
import cn.ac.bcc.service.base.BaseService;
import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bcc on 16/6/2.
 */
@Service
public class DeviceApplyService extends BaseService<DeviceApply>{

    @Autowired
    private DeviceApplyMapper deviceApplyMapper;
}
