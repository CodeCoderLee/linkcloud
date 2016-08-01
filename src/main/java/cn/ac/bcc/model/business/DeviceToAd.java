package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Table(name = "bcc_device_to_ad")
public class DeviceToAd implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "self_ad_info")
    private String selfAdInfo;

    @Column(name = "company_ad_info")
    private String companyAdInfo;

    @Column(name = "custom_ad_info")
    private String customAdInfo;

    @Column(name = "update_time")
    private Date updateTime;

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

    /**
     * @return self_ad_info
     */
    public String getSelfAdInfo() {
        return selfAdInfo;
    }

    /**
     * @param selfAdInfo
     */
    public void setSelfAdInfo(String selfAdInfo) {
        this.selfAdInfo = selfAdInfo;
    }

    /**
     * @return company_ad_info
     */
    public String getCompanyAdInfo() {
        return companyAdInfo;
    }

    /**
     * @param companyAdInfo
     */
    public void setCompanyAdInfo(String companyAdInfo) {
        this.companyAdInfo = companyAdInfo;
    }

    /**
     * @return custom_ad_info
     */
    public String getCustomAdInfo() {
        return customAdInfo;
    }

    /**
     * @param customAdInfo
     */
    public void setCustomAdInfo(String customAdInfo) {
        this.customAdInfo = customAdInfo;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}