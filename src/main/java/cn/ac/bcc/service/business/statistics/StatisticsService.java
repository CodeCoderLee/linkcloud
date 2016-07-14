package cn.ac.bcc.service.business.statistics;

import cn.ac.bcc.mapper.business.AdReportMapper;
import cn.ac.bcc.mapper.business.VideoReportMapper;
import cn.ac.bcc.model.business.VideoReport;
import cn.ac.bcc.service.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lifm on 16/7/13.
 */
@Service
public class StatisticsService extends BaseService<VideoReport> {
    @Autowired
    private VideoReportMapper videoReportMapper;

    @Autowired
    private AdReportMapper adReportMapper;

    public List<VideoReport> statisticsVideoByDay(String date){
        return videoReportMapper.statisticsVideoByDay(date);
    }

    public List<VideoReport> statisticsVideoByMonth(String date){
        return videoReportMapper.statisticsVideoByMonth(date);
    }

    public List<VideoReport> statisticsVideoByYear(String date){
        return videoReportMapper.statisticsVideoByYear(date);
    }

    public List<Map<String,Object>> statisticsAllVideoByDay(String date){
        return videoReportMapper.statisticsAllVideoByDay(date);
    }

    public List<Map<String,Object>> statisticsAllVideoByMonth(String date){
        return videoReportMapper.statisticsAllVideoByMonth(date);
    }

    public List<Map<String,Object>> statisticsAllVideoByYear(String date){
        return videoReportMapper.statisticsAllVideoByYear(date);
    }

}
