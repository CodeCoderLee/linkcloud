package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.Video;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface VideoMapper extends Mapper<Video> {

    List<Video> searchVideo(@Param("video") Video video, @Param("sortOrder") String sortOrder, @Param("sortName") String sortName);
}