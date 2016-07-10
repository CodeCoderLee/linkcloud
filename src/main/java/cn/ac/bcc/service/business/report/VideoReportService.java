package cn.ac.bcc.service.business.report;

import cn.ac.bcc.mapper.business.VideoReportMapper;
import cn.ac.bcc.model.business.VideoReport;
import cn.ac.bcc.service.base.BaseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.logging.Log;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.Date;

/**
 * Created by Lisy on 2016-07-10.
 */
@Service
public class VideoReportService extends BaseService<VideoReport> {
    Logger logger = Logger.getLogger(VideoReportService.class);
    @Autowired
    private VideoReportMapper videoReportMapper;

    @Transactional
    public boolean addReportData(JSONArray array){
        boolean ret = false;
        try {
            for (int i = 0; i < array.size(); i++) {
                JSONObject object = array.getJSONObject(i);
                String serialNumber = object.getString("devid");
                String userId = object.getString("userid");
                String stimeStr = object.getString("stime");
                String ctimeStr = object.getString("ctime");
                String ptype = object.getString("ptype");
                String pid = object.getString("pid");
                String pname = object.getString("pname");

                VideoReport videoReport = new VideoReport();
                videoReport.setCtime(TimeStamp2Date(ctimeStr));
                videoReport.setPid(Integer.parseInt(pid));
                videoReport.setPname(pname);
                videoReport.setPtype(ptype);
                videoReport.setSerialNumber(serialNumber);
                videoReport.setUserId(Integer.parseInt(userId));
                videoReport.setStime(TimeStamp2Date(stimeStr));
                int space = (int) ((videoReport.getCtime().getTime() - videoReport.getStime().getTime())/1000);
                videoReport.setSpaceTime(space);
                videoReportMapper.insertSelective(videoReport);
            }
            ret = true;
        }catch (Exception e){
            logger.error("error",e);
        }
        return ret;
    }

    //Convert Unix timestamp to normal date style
    public String TimeStamp2DateStr(String timestampString){
       Long timestamp = Long.parseLong(timestampString)*1000;
       String date = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date(timestamp));
       return date;
    }

    public Date TimeStamp2Date(String timestampString){
        Long timestamp = Long.parseLong(timestampString)*1000;
        return new java.util.Date(timestamp);
    }
}
