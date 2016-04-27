package cn.ac.bcc.service.interfaces;

import java.util.List;

import cn.ac.bcc.model.core.Resources;

public interface IResourcesService {
	public List<Resources> findChildlists(Resources record);

	public void updateSortOrder(List<Resources> list);
	
	public List<Resources> findUserResourcess(String userId);
	
	public List<Resources> findChildResourcesByUser(String roleId,String parentId, String userId);
	
	public List<Resources> selectResourcesByUser(String userId, String roleId, Resources res);

	List<Resources> selectResourceByRoleId(Integer roleId);

	int getMaxLevel();
}
