package cn.ac.bcc.mapper.core;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ac.bcc.model.core.Resources;
import tk.mybatis.mapper.common.Mapper;

public interface ResourcesMapper extends Mapper<Resources> {
	public List<Resources> findChildlists(Resources record);

	public void updateSortOrder(List<Resources> list);
	
	public List<Resources> findUserResourcess(String userId);
	
	public List<Resources> findChildResourcesByUser(@Param("parentId")String parentId, @Param("userId")String userId, @Param("roleId")String roleId);
	
	public List<Resources> selectResourcesByUser(@Param("userId")String userId, @Param("roleId")String roleId, @Param("res")Resources res);

	List<Resources> selectResourceByRoleId(@Param("roleId")Integer roleId);

	int getMaxLevel();
}