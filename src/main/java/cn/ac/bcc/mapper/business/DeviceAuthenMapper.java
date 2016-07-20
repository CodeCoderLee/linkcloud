package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceAuthen;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface DeviceAuthenMapper extends Mapper<DeviceAuthen> {

    int updateOnOffLineByNum(@Param("serialNumber") String serialNumber, @Param("onOffLine") Integer onOffLine);

    int updateOnOffLineAll(@Param("onOffLine") Integer onOffLine);

}