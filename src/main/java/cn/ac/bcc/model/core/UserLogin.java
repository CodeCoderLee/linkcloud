package cn.ac.bcc.model.core;

import cn.ac.bcc.annotation.Model;
import cn.ac.bcc.annotation.OnlySearch;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_userlogin")
@OnlySearch(value = true)
public class UserLogin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Model(name = "ID")
    @Column(name = "id")
    private Integer id;

    @Column(name = "userId")
    @Model(name = "用户ID",readable = false)
    private Integer userid;

    @Column(name = "accountName")
    @Model(name = "账户名")
    private String accountname;

    @Column(name = "loginTime")
    @Model(name = "登录时间")
    private Date logintime;

    @Column(name = "loginIP")
    @Model(name = "登录IP")
    private String loginip;

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
     * @return userId
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * @param userid
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
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
     * @return loginTime
     */
    public Date getLogintime() {
        return logintime;
    }

    /**
     * @param logintime
     */
    public void setLogintime(Date logintime) {
        this.logintime = logintime;
    }

    /**
     * @return loginIP
     */
    public String getLoginip() {
        return loginip;
    }

    /**
     * @param loginip
     */
    public void setLoginip(String loginip) {
        this.loginip = loginip;
    }
}