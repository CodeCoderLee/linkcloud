package cn.ac.bcc.controller.system.resources;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import cn.ac.bcc.model.core.ResRole;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

import cn.ac.bcc.annotation.SystemLog;
import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Resources;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.util.Common;
import cn.ac.bcc.util.TreeObject;
import cn.ac.bcc.util.TreeUtil;

/**
 * 
 * @author sunqi 2016-2-2
 */
@Controller
@RequestMapping("/resources/")
public class ResourcesController extends BaseController {
	/**
	 * @param model
	 *            存放返回界面的model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("treelists")
	public JSONObject findByPage(HttpServletRequest request, Model model) {
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String nms = en.nextElement().toString();
			System.out.println(nms);
		}
		String name = getPara("resFormMap.name");
		System.out.println(name);
		User user = (User)Common.findUserSession(request);
		// user id
		String userId = user.getId()+"";
		//String order = " order by level asc";
		//resFormMap.put("$orderby", order);
		Resources res = new Resources();
		res.setName(name);
		List<Resources> rs = resourcesService.selectResourcesByUser(userId, null, res);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (Resources r : rs) {
			TreeObject ts = new TreeObject(r);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, list.size()==0?0:list.get(0).getParentId());
		JSONObject json = new JSONObject();
		json.put("treelists", ns);
		System.out.println(json);
		return json;
	}

	@ResponseBody
	@RequestMapping("reslists")
	public List<TreeObject> reslists(Model model) throws Exception {
//		Resources resFormMap = getFormMap(ResFormMap.class);
		List<Resources> rs = resourcesService.select(null);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (Resources r : rs) {
			TreeObject ts = new TreeObject(r);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0, "　");
		return ns;
	}

	/**
	 * @param model
	 *            存放返回界面的model
	 * @return
	 */
	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("res", findByRes());
		System.out.println("res list");
		return Common.BACKGROUND_PATH + "/system/resources/list";
	}

	/**
	 * 跳转到修改界面
	 * 
	 * @param model
	 * @param
	 *
	 * @return
	 */
	@RequestMapping("modifyUI")
	public String editUI(Model model) {
		String id = getPara("id");
		if(Common.isNotEmpty(id)){
			int resid = Integer.parseInt(id);
			model.addAttribute("resources", resourcesService.selectByPrimaryKey(resid));
		}
		return Common.BACKGROUND_PATH + "/system/resources/edit";
	}

	/**
	 * 跳转到新增界面
	 * 
	 * @return
	 */
	@RequestMapping("addUI")
	public String addUI(Model model) {
		return Common.BACKGROUND_PATH + "/system/resources/add";
	}

	/**
	 * 权限分配页面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("permissions")
	public String permissions(Model model) {
		List<Resources> rs = resourcesService.select(null);
		List<TreeObject> list = new ArrayList<TreeObject>();
		for (Resources r : rs) {
			TreeObject ts = new TreeObject(r);
			list.add(ts);
		}
		TreeUtil treeUtil = new TreeUtil();
		List<TreeObject> ns = treeUtil.getChildTreeObjects(list, 0);
		model.addAttribute("permissions", ns);
		model.addAttribute("roleId", getPara("roleId"));
		return Common.BACKGROUND_PATH + "/system/resources/permissions";
	}

	/**
	 * 添加菜单
	 * 
	 * @param
	 * @return Map
	 * @throws Exception
	 */
	@RequestMapping("addEntity")
	@ResponseBody
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="资源管理-新增资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addEntity(HttpServletRequest request) throws Exception {
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String nms = en.nextElement().toString();
			System.out.println(nms);
		}
		String name = getPara("name");
		String resKey = getPara("resKey");
		String resUrl = getPara("resUrl");
		String parentId = getPara("parentId");
		String type = getPara("type");
		String icon = getPara("icon");
		String description = getPara("description");
		Resources r = new Resources();
		r.setName(name);
		r.setReskey(resKey);
		r.setResurl(resUrl);
		r.setParentid(Integer.parseInt(parentId));
		r.setType(type);
		r.setIcon(icon);
		r.setDescription(description);
//		r.setLevel(resourcesService.getMaxLevel() + 1);

		if("2".equals(r.getType())){
			r.setDescription(Common.htmltoString(r.getDescription()+""));
		}
		Object o = r.getIshide();
		if(null==o){
			r.setIshide(0);
		}
		
		resourcesService.insertSelective(r);
		return "success";
	}

	/**
	 * 更新菜单
	 * 
	 * @param
	 * @param
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("editEntity")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="资源管理-修改资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String editEntity(HttpServletRequest request) throws Exception {
		Enumeration<String> en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String nms = en.nextElement().toString();
			System.out.println(nms);
		}
		int id = Integer.parseInt(getPara("id"));
		String name = getPara("name");
		String resKey = getPara("resKey");
		String resUrl = getPara("resUrl");
		String parentId = getPara("parentId");
		String type = getPara("type");
		String icon = getPara("icon");
		String description = getPara("description");
		Resources r = new Resources();
		r.setId(id);
		r.setName(name);
		r.setReskey(resKey);
		r.setResurl(resUrl);
		r.setParentid(Integer.parseInt(parentId));
		r.setType(type);
		r.setIcon(icon);
		r.setDescription(description);
		if("2".equals(r.getType())){
			r.setDescription(Common.htmltoString(r.getDescription()+""));
		}
		Object o = r.getIshide();
		if(null==o){
			r.setIshide(0);
		}
		resourcesService.updateByPrimaryKeySelective(r);
		return "success";
	}

	/**
	 * 根据ID删除菜单
	 * 
	 * @param model
	 * @param
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("deleteEntity")
	@SystemLog(module="系统管理",methods="资源管理-删除资源")//凡需要处理业务逻辑的.都需要记录操作日志
	public String deleteEntity(Model model) throws Exception {
		String[] ids = getParaValues("ids");
		for (String id : ids) {
			if(resourcesService.deleteByPrimaryKey(Integer.parseInt(id))>0){
				ResRole rr = new ResRole();
				rr.setResid(Integer.parseInt(id));
				resourcesService.deleteResRole(rr);
			}
		}
		return "success";
	}

//	@RequestMapping("sortUpdate")
//	@ResponseObject
//	@Transactional(readOnly=false)//需要事务操作必须加入此注解
//	public String sortUpdate(Params params) throws Exception {
//		List<String> ids = params.getId();
//		List<String> es = params.getRowId();
//		List<ResFormMap> maps = new ArrayList<ResFormMap>();
//		for (int i = 0; i < ids.size(); i++) {
//			ResFormMap map = new ResFormMap();
//			map.put("id", ids.get(i));
//			map.put("level", es.get(i));
//			maps.add(map);
//		}
//		resourcesMapper.updateSortOrder(maps);
//		return "success";
//	}
//
	@ResponseBody
	@RequestMapping("searchByRoleId")
	public List<Resources> searchByRoleId() {
		int roleId = Integer.parseInt(getPara("roleId"));
		List<Resources> resourcesList = resourcesService.selectResourceByRoleId(roleId);
		return resourcesList;
	}

	@ResponseBody
	@RequestMapping("addResRole")
	@Transactional(readOnly=false)//需要事务操作必须加入此注解
	@SystemLog(module="系统管理",methods="角色管理/组管理-修改权限")//凡需要处理业务逻辑的.都需要记录操作日志
	public String addResRole() throws Exception {
		int roleId;
		String r = getPara("roleId");
		if (null != r && !Common.isEmpty(r.toString())) {
			roleId = Integer.parseInt(r);
			ResRole rr = new ResRole();
			rr.setRoleid(roleId);
			resourcesService.deleteResRole(rr);
			String[] s = getParaValues("resId[]");
			for (String rid : s) {
				ResRole resRole = new ResRole();
				resRole.setResid(Integer.parseInt(rid));
				resRole.setRoleid(roleId);
				resourcesService.addResRole(resRole);
			}
			return "success";
		}
		return "faild";
		
	}
//
//	@ResponseObject
//	@RequestMapping("findByButtom")
//	public List<ButtomFormMap> findByButtom(){
//		return resourcesMapper.findByWhere(new ButtomFormMap());
//	}
//	
	/**
	 * 验证菜单是否存在
	 * 
	 * @param name
	 * @return
	 */
	@RequestMapping("isExist")
	@ResponseBody
	public boolean isExist(String name,String resKey) {
//		Map<String,Object> condition = new HashMap<String,Object>();
//		condition.put("name", name);
//		condition.put("reskey", resKey);
		Resources record = new Resources();
		record.setName(name);
		record.setReskey(resKey);
		List<Resources> r = resourcesService.select(record);
//		List<Resources> r = resourcesService.selectByExample(BaseExample.getOrExample(Resources.class, condition));
		if (r.size()==0) {
			return true;
		} else {
			return false;
		}
	}
}