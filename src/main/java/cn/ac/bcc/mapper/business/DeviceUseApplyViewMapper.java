package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceUseApply;
import cn.ac.bcc.model.business.DeviceUseApplyView;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceUseApplyViewMapper extends Mapper<DeviceUseApplyView> {

    List<DeviceUseApplyView> selectDeviceUseApply(@Param("deviceUseApply") DeviceUseApplyView deviceUseApply);
}