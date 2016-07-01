package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.VideoMapper;
import cn.ac.bcc.model.business.Video;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 16/6/30.
 */
@Service
public class VideoService extends BaseService<Video> {
    @Autowired
    private VideoMapper videoMapper;

    public List<Video> searchVideo(Video video, String sortOrder, String sortName){
        return videoMapper.searchVideo(video, sortOrder, sortName);
    }
}
