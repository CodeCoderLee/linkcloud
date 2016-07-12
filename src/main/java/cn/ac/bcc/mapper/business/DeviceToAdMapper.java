package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceToAd;
import tk.mybatis.mapper.common.Mapper;
import java.util.List;

public interface DeviceToAdMapper extends Mapper<DeviceToAd> {
    List<DeviceToAd> searchList(DeviceToAd deviceToAd);
}