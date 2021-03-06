package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_area")
public class Area implements Serializable {
    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /**
     * 区域名称
     */
    @Column(name = "area_name")
    private String areaName;

    /**
     * 父Id
     */
    @Column(name = "parent_id")
    private Integer parentId;

    /**
     * 区域简称
     */
    @Column(name = "short_name")
    private String shortName;

    /**
     * 区号
     */
    @Column(name = "area_code")
    private Integer areaCode;

    /**
     * 邮政编码
     */
    @Column(name = "post_code")
    private Integer postCode;

    /**
     * 等级
     */
    @Column(name = "level")
    private Integer level;

    /**
     * 排序
     */
    @Column(name = "sort_order")
    private Byte sortOrder;

    @Column(name = "default_frequency")
    private String defaultFrequency;

    @Column(name = "select_program")
    private String selectProgram;

    @Column(name = "available_program")
    private String availableProgram;

    @Transient
    private String city;

    @Transient
    private String province;

    /**
     * 获取ID
     *
     * @return id - ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置ID
     *
     * @param id ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取区域名称
     *
     * @return area_name - 区域名称
     */
    public String getAreaName() {
        return areaName;
    }

    /**
     * 设置区域名称
     *
     * @param areaName 区域名称
     */
    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    /**
     * 获取父Id
     *
     * @return parent_id - 父Id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * 设置父Id
     *
     * @param parentId 父Id
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * 获取区域简称
     *
     * @return short_name - 区域简称
     */
    public String getShortName() {
        return shortName;
    }

    /**
     * 设置区域简称
     *
     * @param shortName 区域简称
     */
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    /**
     * 获取区号
     *
     * @return area_code - 区号
     */
    public Integer getAreaCode() {
        return areaCode;
    }

    /**
     * 设置区号
     *
     * @param areaCode 区号
     */
    public void setAreaCode(Integer areaCode) {
        this.areaCode = areaCode;
    }

    /**
     * 获取邮政编码
     *
     * @return post_code - 邮政编码
     */
    public Integer getPostCode() {
        return postCode;
    }

    /**
     * 设置邮政编码
     *
     * @param postCode 邮政编码
     */
    public void setPostCode(Integer postCode) {
        this.postCode = postCode;
    }

    /**
     * 获取等级
     *
     * @return level - 等级
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * 设置等级
     *
     * @param level 等级
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * 获取排序
     *
     * @return sort_order - 排序
     */
    public Byte getSortOrder() {
        return sortOrder;
    }

    /**
     * 设置排序
     *
     * @param sortOrder 排序
     */
    public void setSortOrder(Byte sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getDefaultFrequency() {
        return defaultFrequency;
    }

    public void setDefaultFrequency(String defaultFrequency) {
        this.defaultFrequency = defaultFrequency;
    }

    public String getSelectProgram() {
        return selectProgram;
    }

    public void setSelectProgram(String selectProgram) {
        this.selectProgram = selectProgram;
    }

    public String getAvailableProgram() {
        return availableProgram;
    }

    public void setAvailableProgram(String availableProgram) {
        this.availableProgram = availableProgram;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }
}