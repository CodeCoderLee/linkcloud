package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceUseApplyMapper;
import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bcc on 16/5/30.
 */
@Service
public class DeviceUseApplyService extends BaseService<DeviceUseApply> {
    @Autowired
    private DeviceUseApplyMapper deviceUseApplyMapper;

    public List<DeviceUseApply> selectDeviceUseApply(DeviceUseApply deviceUseApply){
        return deviceUseApplyMapper.selectDeviceUseApply(deviceUseApply);
    }
}
