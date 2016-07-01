package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.VideoPublish;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface VideoPublishMapper extends Mapper<VideoPublish> {

    void batchInsert(@Param("videoPublishes") List<VideoPublish> videoPublishes);
}