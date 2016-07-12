package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.AdPublishMapper;
import cn.ac.bcc.model.business.AdPublish;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lifm on 16/7/11.
 */
@Service
public class AdvertisementPublishService extends BaseService<AdPublish>{
    @Autowired
    private AdPublishMapper adPublishMapper;

    public void batchInsert(List<AdPublish> adPublishes){
        adPublishMapper.batchInsert(adPublishes);
    }
}
