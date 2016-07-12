package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_ad_report")
public class AdReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "publish_id")
    private Integer publishId;

    /**
     * 谁点击的
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 点击的IP
     */
    private String ip;

    /**
     * 0  展播 
1 点击
     */
    private Integer type;

    /**
     * 浏览时间
     */
    private Date time;

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
     * 获取谁点击的
     *
     * @return user_id - 谁点击的
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置谁点击的
     *
     * @param userId 谁点击的
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取点击的IP
     *
     * @return ip - 点击的IP
     */
    public String getIp() {
        return ip;
    }

    /**
     * 设置点击的IP
     *
     * @param ip 点击的IP
     */
    public void setIp(String ip) {
        this.ip = ip;
    }

    /**
     * 获取0  展播 
1 点击
     *
     * @return type - 0  展播 
1 点击
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置0  展播 
1 点击
     *
     * @param type 0  展播 
1 点击
     */
    public void setType(Integer type) {
        this.type = type;
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
}