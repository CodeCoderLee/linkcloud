package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_company")
public class Company {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    @Column(name = "full_name")
    private String fullName;

    /**
     * 区域
     */
    @Column(name = "area_id")
    private Integer areaId;

    /**
     * 所属行业
     */
    @Column(name = "industry_code")
    private String industryCode;

    /**
     * 备注
     */
    private String remark;

    @Column(name = "area_name")
    private String areaName;

    @Column(name = "industry_name")
    private String industryName;

    /**
     * @return ID
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
     * @return full_name
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * 获取区域
     *
     * @return area_id - 区域
     */
    public Integer getAreaId() {
        return areaId;
    }

    /**
     * 设置区域
     *
     * @param areaId 区域
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    /**
     * 获取所属行业
     *
     * @return industry_code - 所属行业
     */
    public String getIndustryCode() {
        return industryCode;
    }

    /**
     * 设置所属行业
     *
     * @param industryCode 所属行业
     */
    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return area_name
     */
    public String getAreaName() {
        return areaName;
    }

    /**
     * @param areaName
     */
    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    /**
     * @return industry_name
     */
    public String getIndustryName() {
        return industryName;
    }

    /**
     * @param industryName
     */
    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }
}