package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_video_report")
public class VideoReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "user_id")
    private Integer userId;

    private Date stime;

    /**
     * æµè§ˆæ—¶é—´
     */
    private Date ctime;

    /**
     * 0 ç›´æ’­
1 ç‚¹æ’­
2 æ‘„åƒ
3 è¿œç¨‹
     */
    @Column(name = "space_time")
    private Integer spaceTime;

    private String ptype;

    private Integer pid;

    private String pname;

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
     * @return stime
     */
    public Date getStime() {
        return stime;
    }

    /**
     * @param stime
     */
    public void setStime(Date stime) {
        this.stime = stime;
    }

    /**
     * 获取æµè§ˆæ—¶é—´
     *
     * @return ctime - æµè§ˆæ—¶é—´
     */
    public Date getCtime() {
        return ctime;
    }

    /**
     * 设置æµè§ˆæ—¶é—´
     *
     * @param ctime æµè§ˆæ—¶é—´
     */
    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    /**
     * 获取0 ç›´æ’­
1 ç‚¹æ’­
2 æ‘„åƒ
3 è¿œç¨‹
     *
     * @return space_time - 0 ç›´æ’­
1 ç‚¹æ’­
2 æ‘„åƒ
3 è¿œç¨‹
     */
    public Integer getSpaceTime() {
        return spaceTime;
    }

    /**
     * 设置0 ç›´æ’­
1 ç‚¹æ’­
2 æ‘„åƒ
3 è¿œç¨‹
     *
     * @param spaceTime 0 ç›´æ’­
1 ç‚¹æ’­
2 æ‘„åƒ
3 è¿œç¨‹
     */
    public void setSpaceTime(Integer spaceTime) {
        this.spaceTime = spaceTime;
    }

    /**
     * @return ptype
     */
    public String getPtype() {
        return ptype;
    }

    /**
     * @param ptype
     */
    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    /**
     * @return pid
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * @param pid
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * @return pname
     */
    public String getPname() {
        return pname;
    }

    /**
     * @param pname
     */
    public void setPname(String pname) {
        this.pname = pname;
    }
}