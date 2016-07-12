package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.DeviceToAdMapper;
import cn.ac.bcc.model.business.AdPublish;
import cn.ac.bcc.model.business.DeviceToAd;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * Created by lifm on 16/7/11.
 */
@Service
public class DeviceToAdService extends BaseService<DeviceToAd> {
    @Autowired
    private DeviceToAdMapper deviceToAdMapper;

    public List<DeviceToAd> searchList(DeviceToAd deviceToAd) {
        return deviceToAdMapper.searchList(deviceToAd);
    }
}
