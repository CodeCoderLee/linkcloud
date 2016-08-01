package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_company_view")
public class CompanyView implements Serializable {
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "full_name")
    private String fullName;

    /**
     * 区域
     */
    @Column(name = "area_id")
    private Integer areaId;

    /**
     * 所属行业，关联bcc_industry表中的full_code字段
     */
    @Column(name = "industry_code")
    private String industryCode;

    /**
     * 备注
     */
    @Column(name = "remark")
    private String remark;

    @Column(name = "area_name")
    private String areaName;

    @Column(name = "industry_name")
    private String industryName;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * ID
     */
    @Column(name = "city_id")
    private Integer cityId;

    /**
     * 区域名称
     */
    @Column(name = "city")
    private String city;

    /**
     * ID
     */
    @Column(name = "province_id")
    private Integer provinceId;

    /**
     * 区域名称
     */
    @Column(name = "province")
    private String province;

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
     * 获取所属行业，关联bcc_industry表中的full_code字段
     *
     * @return industry_code - 所属行业，关联bcc_industry表中的full_code字段
     */
    public String getIndustryCode() {
        return industryCode;
    }

    /**
     * 设置所属行业，关联bcc_industry表中的full_code字段
     *
     * @param industryCode 所属行业，关联bcc_industry表中的full_code字段
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

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取ID
     *
     * @return city_id - ID
     */
    public Integer getCityId() {
        return cityId;
    }

    /**
     * 设置ID
     *
     * @param cityId ID
     */
    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    /**
     * 获取区域名称
     *
     * @return city - 区域名称
     */
    public String getCity() {
        return city;
    }

    /**
     * 设置区域名称
     *
     * @param city 区域名称
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 获取ID
     *
     * @return province_id - ID
     */
    public Integer getProvinceId() {
        return provinceId;
    }

    /**
     * 设置ID
     *
     * @param provinceId ID
     */
    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    /**
     * 获取区域名称
     *
     * @return province - 区域名称
     */
    public String getProvince() {
        return province;
    }

    /**
     * 设置区域名称
     *
     * @param province 区域名称
     */
    public void setProvince(String province) {
        this.province = province;
    }
}