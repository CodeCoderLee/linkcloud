package cn.ac.bcc.controller.business.area;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.business.Area;
import cn.ac.bcc.model.business.ProgramDto;
import cn.ac.bcc.service.business.area.AreaService;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.ResponseData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bcc on 16/5/16.
 */
@Controller
@RequestMapping("/area/")
public class AreaController extends BaseController<Area>{

    @Autowired
    private AreaService areaService;


    @RequestMapping("list")
    public String listUI() throws Exception {
        return Common.BACKGROUND_PATH + "/business/area/list";
    }

    @ResponseBody
    @RequestMapping("getPrograms")
    public List<ProgramDto> getPrograms(String id){
        List<ProgramDto> programs = new ArrayList<ProgramDto>();
        if (Common.isNotEmpty(id)) {
            Area area = new Area();
            area.setId(Integer.valueOf(id));
            List<Area> areas = areaService.searchArea(area);
//            model.addAttribute("area", areas.get(0));
            String selectProgram = areas.get(0).getSelectProgram();
            JSONArray jsonSelect = new JSONArray();
            if (!Common.isEmpty(selectProgram)) {
                jsonSelect = JSONArray.fromObject(selectProgram);
            }
            String availableProgram = areas.get(0).getAvailableProgram();
            JSONArray jsonAvailable = new JSONArray();
            if (!Common.isEmpty(availableProgram)) {
                jsonAvailable = JSONArray.fromObject(availableProgram);
            }
            for (int i = 0; i < jsonAvailable.size(); i++) {
                ProgramDto program = new ProgramDto();
                program.setPid(jsonAvailable.getJSONObject(i).getString("pid"));
                program.setName(jsonAvailable.getJSONObject(i).getString("name"));
                program.setSelect(false);
                for (int j=0;j<jsonSelect.size();j++) {
                    if (jsonAvailable.getJSONObject(i).getString("pid").equals(jsonSelect.getJSONObject(j).getString("pid"))) {
                        program.setSelect(true);
                        break;
                    }
                }
                programs.add(program);
            }
        }
        return programs;
    }

//    @RequestMapping("modifyUI")
//    public String modifyUI(Model model) {
//        String id = getPara("id");
//        List<ProgramDto> programs = new ArrayList<ProgramDto>();
//        if (Common.isNotEmpty(id)) {
//            Area area = new Area();
//            area.setId(Integer.valueOf(id));
//            List<Area> areas = areaService.searchArea(area);
//            model.addAttribute("area", areas.get(0));
//            String selectProgram = areas.get(0).getSelectProgram();
//            JSONArray jsonSelect = new JSONArray();
//            if (!Common.isEmpty(selectProgram)) {
//               jsonSelect = JSONArray.fromObject(selectProgram);
//            }
//            String availableProgram = areas.get(0).getAvailableProgram();
//            JSONArray jsonAvailable = new JSONArray();
//            if (!Common.isEmpty(availableProgram)) {
//                jsonAvailable = JSONArray.fromObject(availableProgram);
//            }
//            for (int i = 0; i < jsonAvailable.size(); i++) {
//                ProgramDto program = new ProgramDto();
//                program.setPid(jsonAvailable.getJSONObject(i).getString("pid"));
//                program.setName(jsonAvailable.getJSONObject(i).getString("name"));
//                program.setSelect(false);
//                for (int j=0;j<jsonSelect.size();j++) {
//                    if (jsonAvailable.getJSONObject(i).getString("pid").equals(jsonSelect.getJSONObject(j).getString("pid"))) {
//                        program.setSelect(true);
//                        break;
//                    }
//                }
//                programs.add(program);
//            }
//            model.addAttribute("programs", programs);
//        }
//
//        return Common.BACKGROUND_PATH + "/business/area/edit";
//    }

    @ResponseBody
    @RequestMapping("search")
    public ResponseData search(Area area, Integer limit, Integer offset) throws Exception {
        /*查询未删除的数据*/
        PageHelper.offsetPage(offset, limit);
        List<Area> list = areaService.searchArea(area);
        PageInfo<Area> pageInfo = new PageInfo<Area>(list);
        ResponseData responseData = new ResponseData();
        responseData.setTotal(pageInfo.getTotal());
        responseData.setRows(list);
        return responseData;
    }

    @ResponseBody
    @RequestMapping(value = "modify")
    @SystemLog(module = "频点管理", methods = "频点管理-修改频点信息")//凡需要处理业务逻辑的.都需要记录操作日志
    public String modify(Area area) {
        String select = getPara("select");
        JSONArray selectPrograms = new JSONArray();
        if (!Common.isEmpty(select)) {
            String[] program = select.split(",");
            for (int i=0;i<program.length;i++) {
                JSONObject selectObject = new JSONObject();
                selectObject.put("pid", program[i].split("&")[0]);
                selectObject.put("name", program[i].split("&")[1]);
                selectPrograms.add(selectObject);
            }
        }
        area.setSelectProgram(selectPrograms.toString());
        areaService.updateByPrimaryKeySelective(area);
        return SUCCESS;
    }

    /**
     * 获取市
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("getAreaCity")
    public JSONObject getAllArea(HttpServletRequest request){
        JSONObject jsonObject = new JSONObject();
        int parentId = Integer.parseInt(request.getParameter("id"));
        int type = Integer.parseInt(request.getParameter("type"));
        Area area = new Area();
        area.setParentId(parentId);

        Example example = getEqualsToExample(area);
        example.setOrderByClause("id asc");
        List<Area> areaList = areaService.selectByExample(example);
        jsonObject.put("areaCity",areaList);

        return jsonObject;
    }

    /**
     * 获取省
     * @return
     */
    @RequestMapping("getAreaProvince")
    @ResponseBody
    public JSONObject getAreaProvince(){
        JSONObject jsonObject = new JSONObject();
        Area area = new Area();
        area.setParentId(0);

        Example example = getEqualsToExample(area);
        example.setOrderByClause("id asc");
        List<Area> areaList = areaService.selectByExample(example);
        jsonObject.put("areaProvince",areaList);

        return jsonObject;

    }


    @ResponseBody
    @RequestMapping("setDefaultFrequency")
    public String setDefaultFrequency(Integer areaId, String frequency){
        Area area = new Area();
        area.setId(areaId);
        area.setDefaultFrequency(frequency);
        String programs = getPara("programs");
        String[] program = programs.split(",");
        JSONArray selectPrograms = new JSONArray();
        JSONArray availablePrograms = new JSONArray();
        for (int i = 0; i < program.length; i++) {
            JSONObject availableObject = new JSONObject();
            availableObject.put("pid", program[i].split("&")[0]);
            availableObject.put("name", program[i].split("&")[1]);
            availablePrograms.add(availableObject);

            if (program[i].split("&")[2].equals("true")) {
                JSONObject selectObject = new JSONObject();
                selectObject.put("pid", program[i].split("&")[0]);
                selectObject.put("name", program[i].split("&")[1]);
                selectPrograms.add(selectObject);
            }
        }
        area.setAvailableProgram(availablePrograms.toString());
        area.setSelectProgram(selectPrograms.toString());
        areaService.updateByPrimaryKeySelective(area);
        return SUCCESS;
    }
}




