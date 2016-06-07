package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_device")
public class Device {
    /**
     * 主键
     */
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
     * 私钥
     */
    @Column(name = "private_key")
    private String privateKey;

    /**
     * 注册时间
     */
    @Column(name = "register_time")
    private Date registerTime;

    /**
     * 注册帐号
     */
    @Column(name = "register_account")
    private Integer registerAccount;

    /**
     * 绑定帐号
     */
    @Column(name = "bind_account")
    private Integer bindAccount;

    /**
     * 绑定电话
     */
    @Column(name = "bind_phone")
    private String bindPhone;

    /**
     * 设备状态
     */
    @Column(name = "status")
    private Integer status;

    /**
     * 区域id
     */
    @Column(name = "area_id")
    private Integer areaId;

    /**
     * 调试账户
     */
    @Column(name = "debug_account")
    private Integer debugAccount;

    @Column(name = "work_frequency")
    private String workFrequency;

    @Transient
    private String registerName;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
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
     * 获取私钥
     *
     * @return private_key - 私钥
     */
    public String getPrivateKey() {
        return privateKey;
    }

    /**
     * 设置私钥
     *
     * @param privateKey 私钥
     */
    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    /**
     * 获取注册时间
     *
     * @return register_time - 注册时间
     */
    public Date getRegisterTime() {
        return registerTime;
    }

    /**
     * 设置注册时间
     *
     * @param registerTime 注册时间
     */
    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    /**
     * 获取注册帐号
     *
     * @return register_account - 注册帐号
     */
    public Integer getRegisterAccount() {
        return registerAccount;
    }

    /**
     * 设置注册帐号
     *
     * @param registerAccount 注册帐号
     */
    public void setRegisterAccount(Integer registerAccount) {
        this.registerAccount = registerAccount;
    }

    /**
     * 获取绑定帐号
     *
     * @return bind_account - 绑定帐号
     */
    public Integer getBindAccount() {
        return bindAccount;
    }

    /**
     * 设置绑定帐号
     *
     * @param bindAccount 绑定帐号
     */
    public void setBindAccount(Integer bindAccount) {
        this.bindAccount = bindAccount;
    }

    /**
     * 获取绑定电话
     *
     * @return bind_phone - 绑定电话
     */
    public String getBindPhone() {
        return bindPhone;
    }

    /**
     * 设置绑定电话
     *
     * @param bindPhone 绑定电话
     */
    public void setBindPhone(String bindPhone) {
        this.bindPhone = bindPhone;
    }

    /**
     * 获取设备状态
     *
     * @return status - 设备状态
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置设备状态
     *
     * @param status 设备状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取区域id
     *
     * @return area_id - 区域id
     */
    public Integer getAreaId() {
        return areaId;
    }

    /**
     * 设置区域id
     *
     * @param areaId 区域id
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }

    /**
     * 获取调试账户
     *
     * @return debug_account - 调试账户
     */
    public Integer getDebugAccount() {
        return debugAccount;
    }

    /**
     * 设置调试账户
     *
     * @param debugAccount 调试账户
     */
    public void setDebugAccount(Integer debugAccount) {
        this.debugAccount = debugAccount;
    }

    public String getRegisterName() {
        return registerName;
    }

    public void setRegisterName(String registerName) {
        this.registerName = registerName;
    }

    public String getWorkFrequency() {
        return workFrequency;
    }

    public void setWorkFrequency(String workFrequency) {
        this.workFrequency = workFrequency;
    }
}