package cn.ac.bcc.model.core;

import cn.ac.bcc.annotation.Model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;
import javax.persistence.*;

@Table(name = "bcc_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Model(name = "ID")
    private Integer id;

    @Column(name = "userName")
    @Model(name = "姓名")
    private String username;

    @Column(name = "accountName")
    @Model(name = "账户名")
    private String accountname;

    @Model(name = "密码")
    private String password;

    @Column(name = "credentialsSalt")
    @Model(name = "盐",readable = false)
    private String credentialssalt;

    @Column(name = "email")
    @Model(name = "邮箱")
    private String email;

    @Column(name = "telephone")
    @Model(name = "电话")
    private String telephone;

    @Model(name = "描述")
    private String description;

    @Model(name = "锁")
    private String locked;

    @Model(name = "管理单位ID",readable = false)
    private Integer unitId;

    @Column(name = "createTime")
    @Model(name = "创建时间")
    private Date createtime;

    @Model(name = "性别")
    private Integer sex;



    /**
     * 逻辑删除状态0:存在1:删除
     */
    @Model(name="逻辑状态",readable = false)
    @Column(name = "delete_status")
    private Integer deleteStatus = 0;

    @Transient
    @Model(name = "角色")
    private String role;

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
     * @return userName
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
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
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return credentialsSalt
     */
    public String getCredentialssalt() {
        return credentialssalt;
    }

    /**
     * @param credentialssalt
     */
    public void setCredentialssalt(String credentialssalt) {
        this.credentialssalt = credentialssalt;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
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

    /**
     * @return locked
     */
    public String getLocked() {
        return locked;
    }

    /**
     * @param locked
     */
    public void setLocked(String locked) {
        this.locked = locked;
    }


    public Integer getUnitId() {
        return unitId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    /**
     * @return createTime
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * @param createtime
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public void setCreatetime(String createtime) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (createtime!=null && !createtime.equals("")) {
            try {
                this.createtime = simpleDateFormat.parse(createtime);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * 获取逻辑删除状态0:存在1:删除
     *
     * @return deleteStatus - 逻辑删除状态0:存在1:删除
     */
    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    /**
     * 设置逻辑删除状态0:存在1:删除
     *
     * @param deleteStatus 逻辑删除状态0:存在1:删除
     */
    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }



    @Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", accountname=" + accountname + ", password=" + password
				+ ", credentialssalt=" + credentialssalt + ", description=" + description + ", locked=" + locked
				+ ", createtime=" + createtime + ", deleteStatus=" + deleteStatus + "]";
	}
    
}