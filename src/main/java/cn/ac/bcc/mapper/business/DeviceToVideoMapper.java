package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.DeviceToVideo;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DeviceToVideoMapper extends Mapper<DeviceToVideo> {

    List<DeviceToVideo> searchList(DeviceToVideo deviceToVideo);
}