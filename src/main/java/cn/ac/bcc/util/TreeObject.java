package cn.ac.bcc.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.ac.bcc.model.core.Resources;

/**
 * 这个是列表树形式显示的实体,
 * 这里的字段是在前台显示所有的,可修改
 * date：2014-11-20
 */
public class TreeObject implements Serializable{
	private Integer id;
	private Integer parentId;
	private String name;
	private String parentName;
	private String resKey;
	private String resUrl;
	private Integer level;
	private String type;
	private String description;
	private String icon;
	private Integer ishide;
	private List<TreeObject> children = new ArrayList<TreeObject>();

	public TreeObject() {
	}

	public TreeObject(Resources r) {
		super();
		this.id = r.getId();
		this.parentId = r.getParentid();
		this.name = r.getName();
		this.parentName = r.getParentname();
		this.resKey = r.getReskey();
		this.resUrl = r.getResurl();
		this.level = r.getLevel();
		this.type = r.getType();
		this.description = r.getDescription();
		this.icon = r.getIcon();
		this.ishide = r.getIshide();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public List<TreeObject> getChildren() {
		return children;
	}
	public void setChildren(List<TreeObject> children) {
		this.children = children;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public String getResKey() {
		return resKey;
	}
	public void setResKey(String resKey) {
		this.resKey = resKey;
	}
	public String getResUrl() {
		return resUrl;
	}
	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getIshide() {
		return ishide;
	}
	public void setIshide(Integer ishide) {
		this.ishide = ishide;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
