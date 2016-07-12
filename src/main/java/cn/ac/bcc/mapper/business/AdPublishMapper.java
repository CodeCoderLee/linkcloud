package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.AdPublish;
import cn.ac.bcc.model.business.VideoPublish;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AdPublishMapper extends Mapper<AdPublish> {

    void batchInsert(List<AdPublish> adPublishes);
}