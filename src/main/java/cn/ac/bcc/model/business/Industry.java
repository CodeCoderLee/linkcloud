package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_industry")
public class Industry {
    /**
     * 主键
     */
    @Id
    @Column(name = "ID")
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    /**
     * 顶级代码
     */
    @Column(name = "grand_code")
    private String grandCode;

    /**
     * 顶级名称
     */
    @Column(name = "grand_name")
    private String grandName;

    /**
     * 上级代码
     */
    @Column(name = "parent_code")
    private String parentCode;

    /**
     * 上级名称
     */
    @Column(name = "parent_name")
    private String parentName;

    /**
     * 国民经济行业代码
     */
    @Column(name = "full_code")
    private String fullCode;

    /**
     * 国民经济行业名称
     */
    @Column(name = "full_name")
    private String fullName;

    /**
     * 描述
     */
    private String description;

    /**
     * 创建时间
     */
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 修改时间
     */
    @Column(name = "update_date")
    private Date updateDate;

    /**
     * 获取主键
     *
     * @return ID - 主键
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
     * 获取顶级代码
     *
     * @return grand_code - 顶级代码
     */
    public String getGrandCode() {
        return grandCode;
    }

    /**
     * 设置顶级代码
     *
     * @param grandCode 顶级代码
     */
    public void setGrandCode(String grandCode) {
        this.grandCode = grandCode;
    }

    /**
     * 获取顶级名称
     *
     * @return grand_name - 顶级名称
     */
    public String getGrandName() {
        return grandName;
    }

    /**
     * 设置顶级名称
     *
     * @param grandName 顶级名称
     */
    public void setGrandName(String grandName) {
        this.grandName = grandName;
    }

    /**
     * 获取上级代码
     *
     * @return parent_code - 上级代码
     */
    public String getParentCode() {
        return parentCode;
    }

    /**
     * 设置上级代码
     *
     * @param parentCode 上级代码
     */
    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    /**
     * 获取上级名称
     *
     * @return parent_name - 上级名称
     */
    public String getParentName() {
        return parentName;
    }

    /**
     * 设置上级名称
     *
     * @param parentName 上级名称
     */
    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    /**
     * 获取国民经济行业代码
     *
     * @return full_code - 国民经济行业代码
     */
    public String getFullCode() {
        return fullCode;
    }

    /**
     * 设置国民经济行业代码
     *
     * @param fullCode 国民经济行业代码
     */
    public void setFullCode(String fullCode) {
        this.fullCode = fullCode;
    }

    /**
     * 获取国民经济行业名称
     *
     * @return full_name - 国民经济行业名称
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * 设置国民经济行业名称
     *
     * @param fullName 国民经济行业名称
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * 获取描述
     *
     * @return description - 描述
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置描述
     *
     * @param description 描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取创建时间
     *
     * @return create_date - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改时间
     *
     * @return update_date - 修改时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置修改时间
     *
     * @param updateDate 修改时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}