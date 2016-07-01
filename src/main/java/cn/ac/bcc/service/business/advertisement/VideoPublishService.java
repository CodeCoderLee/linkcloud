package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.VideoPublishMapper;
import cn.ac.bcc.model.business.VideoPublish;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 16/7/1.
 */
@Service
public class VideoPublishService extends BaseService<VideoPublish> {
    @Autowired
    private VideoPublishMapper videoPublishMapper;

    public void batchInsert(List<VideoPublish> videoPublishes){
        videoPublishMapper.batchInsert(videoPublishes);
    }
}
