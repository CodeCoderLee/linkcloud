package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_industry")
public class Industry {
    /**
     * 流水号
     */
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Long id;

    /**
     * 行业代码
     */
    private String code;

    /**
     * 行业类别名称
     */
    private String name;

    /**
     * 上一级行业代码
     */
    @Column(name = "parent_code")
    private String parentCode;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更改时间
     */
    @Column(name = "update_Time")
    private Date updateTime;

    /**
     * 版本号
     */
    private Integer version;

    /**
     * 行业描述
     */
    private String descrition;

    /**
     * 获取流水号
     *
     * @return id - 流水号
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置流水号
     *
     * @param id 流水号
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取行业代码
     *
     * @return code - 行业代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置行业代码
     *
     * @param code 行业代码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 获取行业类别名称
     *
     * @return name - 行业类别名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置行业类别名称
     *
     * @param name 行业类别名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取上一级行业代码
     *
     * @return parent_code - 上一级行业代码
     */
    public String getParentCode() {
        return parentCode;
    }

    /**
     * 设置上一级行业代码
     *
     * @param parentCode 上一级行业代码
     */
    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更改时间
     *
     * @return update_Time - 更改时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更改时间
     *
     * @param updateTime 更改时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取版本号
     *
     * @return version - 版本号
     */
    public Integer getVersion() {
        return version;
    }

    /**
     * 设置版本号
     *
     * @param version 版本号
     */
    public void setVersion(Integer version) {
        this.version = version;
    }

    /**
     * 获取行业描述
     *
     * @return descrition - 行业描述
     */
    public String getDescrition() {
        return descrition;
    }

    /**
     * 设置行业描述
     *
     * @param descrition 行业描述
     */
    public void setDescrition(String descrition) {
        this.descrition = descrition;
    }
}