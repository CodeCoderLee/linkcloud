package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_ad_publish")
public class AdPublish {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    /**
     * 对应素材ID
     */
    @Column(name = "ad_id")
    private Integer adId;

    /**
     * 对应设备ID
     */
    @Column(name = "device_id")
    private Integer deviceId;

    /**
     * 广告位置
     */
    private Integer position;

    @Column(name = "publish_time")
    private Date publishTime;

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
     * 获取对应素材ID
     *
     * @return ad_id - 对应素材ID
     */
    public Integer getAdId() {
        return adId;
    }

    /**
     * 设置对应素材ID
     *
     * @param adId 对应素材ID
     */
    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    /**
     * 获取对应设备ID
     *
     * @return device_id - 对应设备ID
     */
    public Integer getDeviceId() {
        return deviceId;
    }

    /**
     * 设置对应设备ID
     *
     * @param deviceId 对应设备ID
     */
    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    /**
     * 获取广告位置
     *
     * @return position - 广告位置
     */
    public Integer getPosition() {
        return position;
    }

    /**
     * 设置广告位置
     *
     * @param position 广告位置
     */
    public void setPosition(Integer position) {
        this.position = position;
    }

    /**
     * @return publish_time
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * @param publishTime
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
}