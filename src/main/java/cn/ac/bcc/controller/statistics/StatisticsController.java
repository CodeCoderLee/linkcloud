package cn.ac.bcc.controller.statistics;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.VideoReport;
import cn.ac.bcc.service.business.statistics.StatisticsService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
 * Created by lifm on 16/7/13.
 */
@Controller
@RequestMapping("/statistics/")
public class StatisticsController extends BaseController<Object> {
    @Autowired
    private StatisticsService statisticsService;

    @RequestMapping("videoList")
    public String videoList(Model model){
        Map<String, Object> map = videoTotalStatistics(null, null);
        model.addAttribute("map", map);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
        model.addAttribute("day", simpleDateFormat.format(new Date()));
        return Common.BACKGROUND_PATH + "/business/statistics/videoList";
    }

    @ResponseBody
    @RequestMapping("videoStatistics")
    public ResponseData videoStatistics(Integer limit, Integer offset,Integer dateType, String date){

        if (dateType == null) {//初始化为按天查询
            dateType = 1;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
            date = simpleDateFormat.format(new Date());
        }
        PageHelper.offsetPage(offset, limit);
        List<VideoReport> list;
        if (dateType == 1) {
            list = statisticsService.statisticsVideoByDay(date);
        } else if (dateType == 2) {
            list = statisticsService.statisticsVideoByMonth(date);
        } else {
            list = statisticsService.statisticsVideoByYear(date);
        }
        PageInfo<VideoReport> pageInfo = new PageInfo<VideoReport>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }

    @ResponseBody
    @RequestMapping("videoTotalStatistics")
    public Map<String,Object> videoTotalStatistics(Integer dateType, String date){
        if (dateType == null) {//初始化为按天查询
            dateType = 1;
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
            date = simpleDateFormat.format(new Date());
        }
        List<Map<String,Object>> list;
        if (dateType == 1) {
            list = statisticsService.statisticsAllVideoByDay(date);
        } else if (dateType == 2) {
            list = statisticsService.statisticsAllVideoByMonth(date);
        } else {
            list = statisticsService.statisticsAllVideoByYear(date);
        }
        return list.get(0);
    }

}
