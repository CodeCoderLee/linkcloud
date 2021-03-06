package cn.ac.bcc.service.business.device;

import cn.ac.bcc.mapper.business.DeviceAuthenMapper;
import cn.ac.bcc.model.business.DeviceAuthen;
import cn.ac.bcc.service.base.BaseService;
import cn.ac.bcc.util.HelperUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lenovo on 2016-05-30.
 */
@Service
public class DeviceAuthenService extends BaseService<DeviceAuthen>{
    @Autowired
    private DeviceAuthenMapper  deviceAuthenMapper;

    public DeviceAuthen findDeviceByToken(String token){
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setToken(token);
        return deviceAuthenMapper.selectOne(deviceAuthen);
    }

    public int updateOnOffLineByNum(String serialNumber,Integer onOffLine){
        return deviceAuthenMapper.updateOnOffLineByNum(serialNumber,onOffLine);
    }

    public int updateOnOffLineAll(Integer onOffLine){
        return deviceAuthenMapper.updateOnOffLineAll(onOffLine);
    }

    public DeviceAuthen findDeviceBySerialNumber(String serialNumber){
        DeviceAuthen deviceAuthen = new DeviceAuthen();
        deviceAuthen.setSerialNumber(serialNumber);
        deviceAuthen = deviceAuthenMapper.selectOne(deviceAuthen);
        return deviceAuthen;
    }
}
