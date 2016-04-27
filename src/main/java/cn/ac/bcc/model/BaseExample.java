package cn.ac.bcc.model;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

public class BaseExample{
	public static Example getOrderByExample(Class<?> entityClass,String orderByClause){
		Example ex = new Example(entityClass);
		ex.setOrderByClause(orderByClause);
		return ex;
	}
	public static Example getOrExample(Class<?> entityClass,Map<String,Object> condition){
		Example ex = new Example(entityClass);
		Set<Entry<String, Object>> cond = condition.entrySet();
		for(Entry<String, Object> e:cond)
			ex.or().andEqualTo(e.getKey(), e.getValue());
		return ex;
	}

}
