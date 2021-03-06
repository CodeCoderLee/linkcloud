package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceView;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceViewMapper extends Mapper<DeviceView> {

    List<DeviceView> selectDeviceView(@Param("deviceView") DeviceView deviceView);
}