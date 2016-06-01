package cn.ac.bcc.service.business.program;

import cn.ac.bcc.mapper.business.ProgramMapper;
import cn.ac.bcc.model.business.Program;
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
public class ProgramService extends BaseService<Program> {
    private static final String STYPE_DTMB = "dtmb";
    private static final String STYPE_NETDISK = "netdisk";
    private static final String STYPE_CAMERA = "camera";
    @Autowired
    private ProgramMapper programMapper;

    public Map<String,List<Program>> findTop3Program(String deviceSerialNumber){
        Map<String,List<Program>> map = new HashMap<String,List<Program>>();
        Example example = new Example(Program.class);
        example.createCriteria().andEqualTo("deviceSerialNumber",deviceSerialNumber);
        example.createCriteria().andEqualTo("stype",STYPE_DTMB);
        RowBounds rowBounds = new RowBounds(0,4);
        List<Program> tvList = programMapper.selectByExampleAndRowBounds(example,rowBounds);
        map.put("tv",tvList);

        example = new Example(Program.class);
        example.createCriteria().andEqualTo("deviceSerialNumber",deviceSerialNumber);
        example.createCriteria().andEqualTo("stype",STYPE_NETDISK);
        rowBounds = new RowBounds(0,4);
        List<Program> vedioList = programMapper.selectByExampleAndRowBounds(example,rowBounds);
        map.put("vedio",vedioList);

        example = new Example(Program.class);
        example.createCriteria().andEqualTo("deviceSerialNumber",deviceSerialNumber);
        example.createCriteria().andEqualTo("stype",STYPE_CAMERA);
        rowBounds = new RowBounds(0,4);
        List<Program> cameraList = programMapper.selectByExampleAndRowBounds(example,rowBounds);
        map.put("camera",cameraList);
        return  map;
    }
}
