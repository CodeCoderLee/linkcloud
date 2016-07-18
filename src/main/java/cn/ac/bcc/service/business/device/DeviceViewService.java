package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceViewMapper;
import cn.ac.bcc.model.business.DeviceView;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by lifm on 16/7/8.
 */
@Service
public class DeviceViewService extends BaseService<DeviceView> {
    @Autowired
    private DeviceViewMapper deviceViewMapper;

    public List<DeviceView> selectDeviceView(DeviceView deviceView) {
        return deviceViewMapper.selectDeviceView(deviceView);
    }
}
