package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.AdvertisementMapper;
import cn.ac.bcc.model.business.Advertisement;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 图文广告素材管理service
 * Created by bcc on 16/6/3.
 */
@Service
public class AdvertisementService extends BaseService<Advertisement> {
    @Autowired
    private AdvertisementMapper advertisementMapper;

    public List<Advertisement> selectAdvertisement(Advertisement advertisement){
        return advertisementMapper.selectAdvertisement(advertisement);
    }

    public List<Advertisement> searchAdvertisement(Advertisement advertisement, String sortOrder, String sortName){
        return advertisementMapper.searchAdvertisement(advertisement, sortOrder, sortName);
    }
}
