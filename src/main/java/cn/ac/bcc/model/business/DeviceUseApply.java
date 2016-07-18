package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_device_use_apply")
public class DeviceUseApply {
    /**
     * 主键，自增
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 区域id
     */
    @Column(name = "area_id")
    private Integer areaId;

    @Transient
    private String areaName;

    /**
     * 行业id
     */
    @Column(name = "industry_code")
    private String industryCode;

    @Transient
    private String industryName;

    /**
     * 企业id
     */
    @Column(name = "company_id")
    private Integer companyId;

    @Transient
    private String companyName;

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


    @Column(name = "status")
    private Integer status;

    @Column(name = "is_stock_out")
    private Integer isStockOut;


    @Column(name = "stock_out_time")
    private Date stockOutTime;

    @Transient
    private String serialNumbers;

    @Transient
    private String city;

    @Transient
    private String province;

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
     * 获取行业id
     *
     * @return industry_code - 行业编码
     */
    public String getIndustryCode() {
        return industryCode;
    }

    /**
     * 设置行业id
     *
     * @param industryCode 行业id
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

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getIndustryName() {
        return industryName;
    }

    public void setIndustryName(String industryName) {
        this.industryName = industryName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }


    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getIsStockOut() {
        return isStockOut;
    }

    public void setIsStockOut(Integer isStockOut) {
        this.isStockOut = isStockOut;
    }

    public Date getStockOutTime() {
        return stockOutTime;
    }

    public void setStockOutTime(Date stockOutTime) {
        this.stockOutTime = stockOutTime;
    }

    public String getSerialNumbers() {
        return serialNumbers;
    }

    public void setSerialNumbers(String serialNumbers) {
        this.serialNumbers = serialNumbers;
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