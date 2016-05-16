package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_video_report")
public class VideoReport {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    @Column(name = "publish_id")
    private Integer publishId;

    @Column(name = "user_id")
    private Integer userId;

    private String ip;

    /**
     * 浏览时间
     */
    private Date time;

    /**
     * 0 直播
1 点播
2 摄像
3 远程
     */
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
     * @return publish_id
     */
    public Integer getPublishId() {
        return publishId;
    }

    /**
     * @param publishId
     */
    public void setPublishId(Integer publishId) {
        this.publishId = publishId;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * @return ip
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param ip
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     * 获取浏览时间
     *
     * @return time - 浏览时间
     */
    public Date getTime() {
        return time;
    }

    /**
     * 设置浏览时间
     *
     * @param time 浏览时间
     */
    public void setTime(Date time) {
        this.time = time;
    }

    /**
     * 获取0 直播
1 点播
2 摄像
3 远程
     *
     * @return type - 0 直播
1 点播
2 摄像
3 远程
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置0 直播
1 点播
2 摄像
3 远程
     *
     * @param type 0 直播
1 点播
2 摄像
3 远程
     */
    public void setType(Integer type) {
        this.type = type;
    }
}