package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Device;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceMapper extends Mapper<Device> {
    /*查询可调试的设备*/
    List<Device> selectDebugDevice(@Param("device") Device device);

    /*根据设备序号修改设备类型*/
    int updateStatusByNum(String serialNumber,int status);

}