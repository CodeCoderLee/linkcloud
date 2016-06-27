package cn.ac.bcc.service.business.version;

import cn.ac.bcc.mapper.business.VersionMapper;
import cn.ac.bcc.model.business.Version;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bcc on 16/6/21.
 */
@Service
public class VersionService extends BaseService<Version> {
    @Autowired
    private VersionMapper versionMapper;

    public List<Version> searchVersionList(){
        return versionMapper.searchVersionList();
    }
}
