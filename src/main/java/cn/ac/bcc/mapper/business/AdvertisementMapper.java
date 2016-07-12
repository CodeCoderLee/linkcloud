package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Advertisement;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AdvertisementMapper extends Mapper<Advertisement> {

    List<Advertisement> selectAdvertisement(@Param("advertisement") Advertisement advertisement);

    List<Advertisement> searchAdvertisement(@Param("advertisement") Advertisement advertisement, @Param("sortOrder") String sortOrder, @Param("sortName") String sortName);
}