package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceMapper;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 设备管理service
 * Created by bcc on 16/5/28.
 */
@Service
public class DeviceService extends BaseService<Device> {
    @Autowired
    private DeviceMapper deviceMapper;
}