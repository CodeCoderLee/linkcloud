package cn.ac.bcc.controller.system.log;


import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Log;
import cn.ac.bcc.service.system.log.LogService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.OGNL;

import java.util.List;

/**
 *
 */
@Controller
@RequestMapping("/logs/")
public class LogController extends BaseController<Log> {
	@Autowired
	private LogService logService;



	@RequestMapping("list")
	public String logUI(){
		return Common.BACKGROUND_PATH + "/system/logs/list";
	}

	@ResponseBody
	@RequestMapping("search")
	public ResponseData search(Log log, Integer limit, Integer offset) throws Exception {
		PageHelper.startPage(offset + 1, limit);
		Example example = getEqualsToExample(log);
		List<Log> list = logService.selectByExample(example);
		PageInfo<Log> pageInfo = new PageInfo<Log>(list);
		ResponseData responseData = new ResponseData();
		responseData.setTotal(pageInfo.getTotal());
		responseData.setRows(list);
		return responseData;
	}


}