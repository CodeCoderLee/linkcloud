package cn.ac.bcc.model.core;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "userName")
    private String username;

    @Column(name = "accountName")
    private String accountname;

    private String password;

    @Column(name = "credentialsSalt")
    private String credentialssalt;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 电话
     */
    private String telephone;

    private String description;

    private String locked;

    /**
     * 所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作
     */
    @Column(name = "unit_id")
    private String unitId;

    @Column(name = "createTime")
    private Date createtime;

    /**
     * 逻辑删除状态0:存在1:删除
     */
    @Column(name = "delete_status")
    private Integer deleteStatus;

    /**
     * 性别，1男，0女
     */
    private Integer sex;

    /**
     * 从微信端获取到的微信昵称
     */
    @Column(name = "nick_name")
    private String nickName;

    /**
     * 从微信端获取到的openId
     */
    @Column(name = "open_id")
    private String openId;

    /**
     * 从微信获取到的城市
     */
    private String city;

    /**
     * 从微信获取到的国家
     */
    private String country;

    /**
     * 从微信获取到省份
     */
    private String province;

    /**
     * 从微信处获取到的用户头像
     */
    @Column(name = "head_img_url")
    private String headImgUrl;

    /**
     * 微信获取到的用户的union_id,用一个开发者帐号下的不用应用，拥有同一union_id
     */
    @Column(name = "union_id")
    private String unionId;

    /**
     * 公众号对用户的备注
     */
    private String remark;

    /**
     * 从微信获取的用户的分组id
     */
    @Column(name = "group_id")
    private Integer groupId;

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

    /**
     * 获取邮箱
     *
     * @return email - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取电话
     *
     * @return telephone - 电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置电话
     *
     * @param telephone 电话
     */
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

    /**
     * 获取所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作
     *
     * @return unit_id - 所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作
     */
    public String getUnitId() {
        return unitId;
    }

    /**
     * 设置所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作
     *
     * @param unitId 所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作
     */
    public void setUnitId(String unitId) {
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

    /**
     * 获取逻辑删除状态0:存在1:删除
     *
     * @return delete_status - 逻辑删除状态0:存在1:删除
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

    /**
     * 获取性别，1男，0女
     *
     * @return sex - 性别，1男，0女
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * 设置性别，1男，0女
     *
     * @param sex 性别，1男，0女
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * 获取从微信端获取到的微信昵称
     *
     * @return nick_name - 从微信端获取到的微信昵称
     */
    public String getNickName() {
        return nickName;
    }

    /**
     * 设置从微信端获取到的微信昵称
     *
     * @param nickName 从微信端获取到的微信昵称
     */
    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    /**
     * 获取从微信端获取到的openId
     *
     * @return open_id - 从微信端获取到的openId
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * 设置从微信端获取到的openId
     *
     * @param openId 从微信端获取到的openId
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * 获取从微信获取到的城市
     *
     * @return city - 从微信获取到的城市
     */
    public String getCity() {
        return city;
    }

    /**
     * 设置从微信获取到的城市
     *
     * @param city 从微信获取到的城市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 获取从微信获取到的国家
     *
     * @return country - 从微信获取到的国家
     */
    public String getCountry() {
        return country;
    }

    /**
     * 设置从微信获取到的国家
     *
     * @param country 从微信获取到的国家
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * 获取从微信获取到省份
     *
     * @return province - 从微信获取到省份
     */
    public String getProvince() {
        return province;
    }

    /**
     * 设置从微信获取到省份
     *
     * @param province 从微信获取到省份
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * 获取从微信处获取到的用户头像
     *
     * @return head_img_url - 从微信处获取到的用户头像
     */
    public String getHeadImgUrl() {
        return headImgUrl;
    }

    /**
     * 设置从微信处获取到的用户头像
     *
     * @param headImgUrl 从微信处获取到的用户头像
     */
    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl;
    }

    /**
     * 获取微信获取到的用户的union_id,用一个开发者帐号下的不用应用，拥有同一union_id
     *
     * @return union_id - 微信获取到的用户的union_id,用一个开发者帐号下的不用应用，拥有同一union_id
     */
    public String getUnionId() {
        return unionId;
    }

    /**
     * 设置微信获取到的用户的union_id,用一个开发者帐号下的不用应用，拥有同一union_id
     *
     * @param unionId 微信获取到的用户的union_id,用一个开发者帐号下的不用应用，拥有同一union_id
     */
    public void setUnionId(String unionId) {
        this.unionId = unionId;
    }

    /**
     * 获取公众号对用户的备注
     *
     * @return remark - 公众号对用户的备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置公众号对用户的备注
     *
     * @param remark 公众号对用户的备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取从微信获取的用户的分组id
     *
     * @return group_id - 从微信获取的用户的分组id
     */
    public Integer getGroupId() {
        return groupId;
    }

    /**
     * 设置从微信获取的用户的分组id
     *
     * @param groupId 从微信获取的用户的分组id
     */
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}