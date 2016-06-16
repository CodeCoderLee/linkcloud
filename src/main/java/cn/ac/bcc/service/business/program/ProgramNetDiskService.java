package cn.ac.bcc.service.business.program;

import cn.ac.bcc.mapper.business.ProgramMapper;
import cn.ac.bcc.mapper.business.ProgramNetDiskMapper;
import cn.ac.bcc.model.business.Program;
import cn.ac.bcc.model.business.ProgramNetDisk;
import cn.ac.bcc.service.base.BaseService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016-05-30.
 */
@Service
public class ProgramNetDiskService extends BaseService<ProgramNetDisk> {
    private static final String STYPE_DTMB = "dtmb";
    private static final String STYPE_NETDISK = "netdisk";
    private static final String STYPE_CAMERA = "camera";
    @Autowired
    private ProgramNetDiskMapper programNetDiskMapper;

    public List<ProgramNetDisk> findProgram(String deviceSerialNumber,int level,boolean notAll){
        Example example = new Example(ProgramNetDisk.class);
        example = new Example(ProgramNetDisk.class);
        example.createCriteria().andEqualTo("deviceSerialNumber",deviceSerialNumber).andEqualTo("stype",STYPE_NETDISK)
                .andEqualTo("level",0);
        List<ProgramNetDisk> retList = null;
        if(notAll){
            RowBounds rowBounds = new RowBounds(0,4);
            retList = programNetDiskMapper.selectByExampleAndRowBounds(example,rowBounds);
        }else{
            retList = programNetDiskMapper.selectByExample(example);
        }
        return  retList;
    }
}
