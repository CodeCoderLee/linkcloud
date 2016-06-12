package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Device;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceMapper extends Mapper<Device> {
    /*查询可调试的设备*/
    List<Device> selectDebugDevice(@Param("device") Device device);

    /*根据设备序号修改设备类型*/
    int updateStatusByNum(@Param("serialNumber") String serialNumber,@Param("status") Integer status, @Param("areaId") Integer areaId);

    /*查询可以进行设备配置的设备*/
    List<Device> selectSettingDevice(@Param("userId") Integer userId, @Param("device") Device device);

    void updateWorkFrequencyAndProgramIds(@Param("frequency") String frequency,@Param("programIds") String programIds, @Param("serialNumber") String serialNumber);
}