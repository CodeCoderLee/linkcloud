package cn.ac.bcc.service.business.area;

import cn.ac.bcc.mapper.business.AreaMapper;
import cn.ac.bcc.model.business.Area;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bcc on 16/5/16.
 */
@Service
public class AreaService extends BaseService<Area> {

    @Autowired
    private AreaMapper areaMapper;
}
