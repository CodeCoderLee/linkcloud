package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceUseApply;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceUseApplyMapper extends Mapper<DeviceUseApply> {
    List<DeviceUseApply> selectDeviceUseApply(@Param("deviceUseApply") DeviceUseApply deviceUseApply);
}