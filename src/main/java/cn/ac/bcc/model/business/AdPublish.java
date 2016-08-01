package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_ad_publish")
public class AdPublish implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /**
     * 对应素材ID
     */
    @Column(name = "ad_id")
    private Integer adId;

    /**
     * 对应设备序列号
     */
    @Column(name = "serial_number")
    private String serialNumber;

    /**
     * 广告位置
     */
    private Integer position;

    @Column(name = "publish_time")
    private Date publishTime;

    @Column(name = "type")
    private Integer type;

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
     * 获取对应设备序列号
     *
     * @return serial_number - 对应设备序列号
     */
    public String getSerialNumber() {
        return serialNumber;
    }

    /**
     * 设置对应设备序列号
     *
     * @param serialNumber 对应设备序列号
     */
    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
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

    /**
     * @return type
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type
     */
    public void setType(Integer type) {
        this.type = type;
    }
}