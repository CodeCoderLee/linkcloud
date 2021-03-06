package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_video_publish")
public class VideoPublish implements Serializable {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 发布的广告素材ID
     */
    @Column(name = "video_id")
    private Integer videoId;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "publish_time")
    private Date publishTime;

    @Column(name = "type")
    private Integer type;

    /**
     * 0 下线
1 上线
     */
    private Integer status;

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
     * 获取发布的广告素材ID
     *
     * @return video_id - 发布的广告素材ID
     */
    public Integer getVideoId() {
        return videoId;
    }

    /**
     * 设置发布的广告素材ID
     *
     * @param videoId 发布的广告素材ID
     */
    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
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
     * 获取0 下线
1 上线
     *
     * @return status - 0 下线
1 上线
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置0 下线
1 上线
     *
     * @param status 0 下线
1 上线
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}