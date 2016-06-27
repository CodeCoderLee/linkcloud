package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceUpdateMapper;
import cn.ac.bcc.model.business.DeviceUpdate;
import cn.ac.bcc.service.base.BaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 16/6/27.
 */
@Service
public class DeviceUpdateService extends BaseService<DeviceUpdate> {
    @Autowired
    private DeviceUpdateMapper deviceUpdateMapper;


    public List<DeviceUpdate> searchList(String serialNumber){
        return deviceUpdateMapper.searchList(serialNumber);
    }
}
