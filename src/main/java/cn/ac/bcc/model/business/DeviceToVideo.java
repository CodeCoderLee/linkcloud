package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.util.Date;

@Table(name = "bcc_device_to_video")
public class DeviceToVideo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /**
     * 序列号
     */
    @Column(name = "serial_number")
    private String serialNumber;

    /**
     * 设备绑定广告信息
     */
    @Column(name = "self_video_info")
    private String selfVideoInfo;

    @Column(name = "company_video_info")
    private String companyVideoInfo;

    @Column(name = "custom_video_info")
    private String customVideoInfo;

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
     * 获取序列号
     *
     * @return serial_number - 序列号
     */
    public String getSerialNumber() {
        return serialNumber;
    }

    /**
     * 设置序列号
     *
     * @param serialNumber 序列号
     */
    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    /**
     * 获取设备绑定广告信息
     *
     * @return self_video_info - 设备绑定广告信息
     */
    public String getSelfVideoInfo() {
        return selfVideoInfo;
    }

    /**
     * 设置设备绑定广告信息
     *
     * @param selfVideoInfo 设备绑定广告信息
     */
    public void setSelfVideoInfo(String selfVideoInfo) {
        this.selfVideoInfo = selfVideoInfo;
    }

    /**
     * @return company_video_info
     */
    public String getCompanyVideoInfo() {
        return companyVideoInfo;
    }

    /**
     * @param companyVideoInfo
     */
    public void setCompanyVideoInfo(String companyVideoInfo) {
        this.companyVideoInfo = companyVideoInfo;
    }

    /**
     * @return custom_video_info
     */
    public String getCustomVideoInfo() {
        return customVideoInfo;
    }

    /**
     * @param customVideoInfo
     */
    public void setCustomVideoInfo(String customVideoInfo) {
        this.customVideoInfo = customVideoInfo;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}