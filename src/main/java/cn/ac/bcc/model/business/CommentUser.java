package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "comment_user_view")
public class CommentUser implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "video_id")
    private Integer videoId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "publish_date")
    private Date publishDate;

    @Column(name = "accountName")
    private String accountname;

    @Transient
    private boolean update;

    @Transient
    private String publishDateStr;

    public boolean isUpdate() {
        return update;
    }

    public void setUpdate(boolean update) {
        this.update = update;
    }

    public String getPublishDateStr() {
        return publishDateStr;
    }

    public void setPublishDateStr(String publishDateStr) {
        this.publishDateStr = publishDateStr;
    }

    private String comment;

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
     * @return video_id
     */
    public Integer getVideoId() {
        return videoId;
    }

    /**
     * @param videoId
     */
    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
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
     * @return publish_date
     */
    public Date getPublishDate() {
        return publishDate;
    }

    /**
     * @param publishDate
     */
    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    /**
     * @return accountName
     */
    public String getAccountname() {
        return accountname;
    }

    /**
     * @param accountname
     */
    public void setAccountname(String accountname) {
        this.accountname = accountname;
    }

    /**
     * @return comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment
     */
    public void setComment(String comment) {
        this.comment = comment;
    }
}