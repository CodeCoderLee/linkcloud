package cn.ac.bcc.mapper.business;

import cn.ac.bcc.model.business.VideoReport;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

public interface VideoReportMapper extends Mapper<VideoReport> {

    List<VideoReport> statisticsVideoByDay(@Param("date") String date);

    List<VideoReport> statisticsVideoByMonth(@Param("date") String date);

    List<VideoReport> statisticsVideoByYear(@Param("date") String date);

    List<Map<String,Object>> statisticsAllVideoByDay(@Param("date") String date);

    List<Map<String,Object>> statisticsAllVideoByMonth(@Param("date") String date);

    List<Map<String,Object>> statisticsAllVideoByYear(@Param("date") String date);
}