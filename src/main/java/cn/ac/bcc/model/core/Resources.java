package cn.ac.bcc.model.core;

import cn.ac.bcc.annotation.Model;

import javax.persistence.*;

import cn.ac.bcc.annotation.Model;

import java.io.Serializable;

@Table(name = "bcc_resources")
public class Resources implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Model(name="名字")
    private String name;

    @Column(name = "parentId")
    private Integer parentid;
    
    @Transient
    private String parentname;

    @Column(name = "resKey")
    private String reskey;

    private String type;

    @Column(name = "resUrl")
    private String resurl;

    private Integer level;

    private String icon;

    private Integer ishide;

    private String description;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return parentId
     */
    public Integer getParentid() {
        return parentid;
    }

    /**
     * @param parentid
     */
    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }
    

    public String getParentname() {
		return parentname;
	}

	public void setParentname(String parentname) {
		this.parentname = parentname;
	}

	/**
     * @return resKey
     */
    public String getReskey() {
        return reskey;
    }

    /**
     * @param reskey
     */
    public void setReskey(String reskey) {
        this.reskey = reskey;
    }

    /**
     * @return type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return resUrl
     */
    public String getResurl() {
        return resurl;
    }

    /**
     * @param resurl
     */
    public void setResurl(String resurl) {
        this.resurl = resurl;
    }

    /**
     * @return level
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * @param level
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * @return icon
     */
    public String getIcon() {
        return icon;
    }

    /**
     * @param icon
     */
    public void setIcon(String icon) {
        this.icon = icon;
    }

    /**
     * @return ishide
     */
    public Integer getIshide() {
        return ishide;
    }

    /**
     * @param ishide
     */
    public void setIshide(Integer ishide) {
        this.ishide = ishide;
    }

    /**
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
}