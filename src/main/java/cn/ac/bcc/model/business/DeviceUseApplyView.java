package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_device_use_apply_view")
public class DeviceUseApplyView implements Serializable {
    /**
     * 主键，自增
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 区域id
     */
    @Column(name = "area_id")
    private Integer areaId;

    /**
     * 行业编码，关联bcc_industry的full_code
     */
    @Column(name = "industry_code")
    private String industryCode;

    /**
     * 企业id
     */
    @Column(name = "company_id")
    private Integer companyId;

    /**
     * 联系人
     */
    @Column(name = "contact_name")
    private String contactName;

    /**
     * 联系电话
     */
    @Column(name = "contact_phone")
    private String contactPhone;

    /**
     * 申请时间
     */
    @Column(name = "apply_time")
    private Date applyTime;

    /**
     * 申请用途，用来更新设备状态，正式2，演示3
     */
    private Integer status;

    /**
     * 是否出库，1是，0否
     */
    @Column(name = "is_stock_out")
    private Integer isStockOut;

    @Column(name = "stock_out_time")
    private Date stockOutTime;

    /**
     * 区域名称
     */
    @Column(name = "area_name")
    private String areaName;

    /**
     * ID
     */
    @Column(name = "city_id")
    private Integer cityId;

    /**
     * 区域名称
     */
    private String city;

    /**
     * ID
     */
    @Column(name = "province_id")
    private Integer provinceId;

    /**
     * 区域名称
     */
    private String province;

    /**
     * 国民经济行业名称
     */
    @Column(name = "industry_full_name")
    private String industryFullName;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_full_name")
    private String companyFullName;

    @Column(name = "serial_number")
    private String serialNumber;

    @Transient
    private String serialNumbers;

    /**
     * 获取主键，自增
     *
     * @return id - 主键，自增
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键，自增
     *
     * @param id 主键，自增
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取区域id
     *
     * @return area_id - 区域id
     */
    public Integer getAreaId() {
        return areaId;
    }

    /**
     * 设置区域id
     *
     * @param areaId 区域id
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    /**
     * 获取行业编码，关联bcc_industry的full_code
     *
     * @return industry_code - 行业编码，关联bcc_industry的full_code
     */
    public String getIndustryCode() {
        return industryCode;
    }

    /**
     * 设置行业编码，关联bcc_industry的full_code
     *
     * @param industryCode 行业编码，关联bcc_industry的full_code
     */
    public void setIndustryCode(String industryCode) {
        this.industryCode = industryCode;
    }

    /**
     * 获取企业id
     *
     * @return company_id - 企业id
     */
    public Integer getCompanyId() {
        return companyId;
    }

    /**
     * 设置企业id
     *
     * @param companyId 企业id
     */
    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    /**
     * 获取联系人
     *
     * @return contact_name - 联系人
     */
    public String getContactName() {
        return contactName;
    }

    /**
     * 设置联系人
     *
     * @param contactName 联系人
     */
    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    /**
     * 获取联系电话
     *
     * @return contact_phone - 联系电话
     */
    public String getContactPhone() {
        return contactPhone;
    }

    /**
     * 设置联系电话
     *
     * @param contactPhone 联系电话
     */
    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    /**
     * 获取申请时间
     *
     * @return apply_time - 申请时间
     */
    public Date getApplyTime() {
        return applyTime;
    }

    /**
     * 设置申请时间
     *
     * @param applyTime 申请时间
     */
    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    /**
     * 获取申请用途，用来更新设备状态，正式2，演示3
     *
     * @return status - 申请用途，用来更新设备状态，正式2，演示3
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置申请用途，用来更新设备状态，正式2，演示3
     *
     * @param status 申请用途，用来更新设备状态，正式2，演示3
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取是否出库，1是，0否
     *
     * @return is_stock_out - 是否出库，1是，0否
     */
    public Integer getIsStockOut() {
        return isStockOut;
    }

    /**
     * 设置是否出库，1是，0否
     *
     * @param isStockOut 是否出库，1是，0否
     */
    public void setIsStockOut(Integer isStockOut) {
        this.isStockOut = isStockOut;
    }

    /**
     * @return stock_out_time
     */
    public Date getStockOutTime() {
        return stockOutTime;
    }

    /**
     * @param stockOutTime
     */
    public void setStockOutTime(Date stockOutTime) {
        this.stockOutTime = stockOutTime;
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

    /**
     * 获取国民经济行业名称
     *
     * @return industry_full_name - 国民经济行业名称
     */
    public String getIndustryFullName() {
        return industryFullName;
    }

    /**
     * 设置国民经济行业名称
     *
     * @param industryFullName 国民经济行业名称
     */
    public void setIndustryFullName(String industryFullName) {
        this.industryFullName = industryFullName;
    }

    /**
     * @return company_name
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * @param companyName
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * @return company_full_name
     */
    public String getCompanyFullName() {
        return companyFullName;
    }

    /**
     * @param companyFullName
     */
    public void setCompanyFullName(String companyFullName) {
        this.companyFullName = companyFullName;
    }

    /**
     * @return serial_number
     */
    public String getSerialNumber() {
        return serialNumber;
    }

    /**
     * @param serialNumber
     */
    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public String getSerialNumbers() {
        return serialNumbers;
    }

    public void setSerialNumbers(String serialNumbers) {
        this.serialNumbers = serialNumbers;
    }
}