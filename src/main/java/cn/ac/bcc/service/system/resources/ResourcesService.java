package cn.ac.bcc.service.system.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.ac.bcc.mapper.core.ResRoleMapper;
import cn.ac.bcc.mapper.core.ResourcesMapper;
import cn.ac.bcc.model.core.ResRole;
import cn.ac.bcc.model.core.Resources;
import cn.ac.bcc.service.base.BaseService;
import cn.ac.bcc.service.interfaces.IResourcesService;

@Service("ResourcesService")
public class ResourcesService extends BaseService<Resources>implements IResourcesService {
	@Autowired
    private ResourcesMapper resourcesMapper;
	@Autowired
    private ResRoleMapper resRoleMapper;

	public List<Resources> findChildlists(Resources record) {
		// TODO Auto-generated method stub
		return this.resourcesMapper.findChildlists(record);
	}

	public void updateSortOrder(List<Resources> list) {
		// TODO Auto-generated method stub
		this.resourcesMapper.updateSortOrder(list);
	}

	public List<Resources> findUserResourcess(String userId) {
		// TODO Auto-generated method stub
		return this.resourcesMapper.findUserResourcess(userId);
	}

	public List<Resources> findChildResourcesByUser(String parentId, String userId, String roleId) {
		// TODO Auto-generated method stub
		return this.resourcesMapper.findChildResourcesByUser(parentId, userId, roleId);
	}

	public List<Resources> selectResourcesByUser(String userId, String roleId, Resources res) {
		// TODO Auto-generated method stub
		return this.resourcesMapper.selectResourcesByUser(userId, roleId, res);
	}

	public List<Resources> selectResourceByRoleId(Integer roleId) {
		return this.resourcesMapper.selectResourceByRoleId(roleId);
	}

	public int getMaxLevel() {
		return resourcesMapper.getMaxLevel();
	}

	public int deleteResRole(ResRole record){
		return this.resRoleMapper.delete(record);
	}
	public int addResRole(ResRole record){
		return this.resRoleMapper.insertSelective(record);
	}


}
