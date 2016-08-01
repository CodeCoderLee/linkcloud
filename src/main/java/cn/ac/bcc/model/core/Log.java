package cn.ac.bcc.model.core;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

import cn.ac.bcc.annotation.Model;
import cn.ac.bcc.annotation.OnlySearch;

@Table(name = "bcc_log")
@OnlySearch(value = true)
public class Log implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Model(name="Id")
    private Integer id;

    @Column(name = "accountName")
    @Model(name="账号")
    private String accountname;

    @Model(name="模块")
    private String module;

    @Model(name="操作")
    private String methods;

    @Column(name = "actionTime")
    @Model(name="响应时间")
    private Integer actiontime;

    @Column(name = "userIP")
    @Model(name="Ip地址")
    private String userip;

    @Column(name = "operTime")
    @Model(name="执行时间")
    private Date opertime;

    @Model(name="描述")
    private String description;

    @Column(name = "operate_obj")
    @Model(name = "操作的设备号")
    private String operateObj;



    @Column(name = "nick_name")
    @Model(name = "昵称")
    private String nickName;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getOperateObj() {
        return operateObj;
    }

    public void setOperateObj(String operateObj) {
        this.operateObj = operateObj;
    }

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
     * @return module
     */
    public String getModule() {
        return module;
    }

    /**
     * @param module
     */
    public void setModule(String module) {
        this.module = module;
    }

    /**
     * @return methods
     */
    public String getMethods() {
        return methods;
    }

    /**
     * @param methods
     */
    public void setMethods(String methods) {
        this.methods = methods;
    }

    /**
     * @return actionTime
     */
    public Integer getActiontime() {
        return actiontime;
    }

    /**
     * @param actiontime
     */
    public void setActiontime(Integer actiontime) {
        this.actiontime = actiontime;
    }

    /**
     * @return userIP
     */
    public String getUserip() {
        return userip;
    }

    /**
     * @param userip
     */
    public void setUserip(String userip) {
        this.userip = userip;
    }

    /**
     * @return operTime
     */
    public Date getOpertime() {
        return opertime;
    }

    /**
     * @param opertime
     */
    public void setOpertime(Date opertime) {
        this.opertime = opertime;
    }

    /**
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
}