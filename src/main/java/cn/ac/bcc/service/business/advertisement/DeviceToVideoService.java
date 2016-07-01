package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.DeviceToVideoMapper;
import cn.ac.bcc.model.business.DeviceToVideo;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lifm on 16/7/1.
 */
@Service
public class DeviceToVideoService extends BaseService<DeviceToVideo> {
    @Autowired
    private DeviceToVideoMapper deviceToVideoMapper;
}
