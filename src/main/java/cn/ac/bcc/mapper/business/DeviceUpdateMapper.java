package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceUpdate;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceUpdateMapper extends Mapper<DeviceUpdate> {

    List<DeviceUpdate> searchList(@Param("serialNumber") String serialNumber);
}