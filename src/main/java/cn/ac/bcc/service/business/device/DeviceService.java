package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceMapper;
import cn.ac.bcc.model.business.Device;
import cn.ac.bcc.service.base.BaseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 设备管理service
 * Created by bcc on 16/5/28.
 */
@Service
public class DeviceService extends BaseService<Device> {
    @Autowired
    private DeviceMapper deviceMapper;

    public List<Device> selectDebugDevice(Device device){

        return deviceMapper.selectDebugDevice(device);
    }

    public int updateStatusByNum(String serialNumber,int status, int areaId){

        return deviceMapper.updateStatusByNum(serialNumber,status, areaId);
    }


    public List<Device> selectSettingDevice(Integer userId, Device device) {
        return deviceMapper.selectSettingDevice(userId, device);
    }

    public void updateWorkFrequencyAndProgramIds(String serialNumber, String frequency, String programIds){
        deviceMapper.updateWorkFrequencyAndProgramIds(frequency,programIds,serialNumber);
    }
}
