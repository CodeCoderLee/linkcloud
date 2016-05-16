package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_area")
public class Area {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    @Column(name = "parent_id")
    private Integer parentId;

    private String name;

    /**
     * 邮编
     */
    @Column(name = "post_code")
    private String postCode;

    /**
     * 区号
     */
    @Column(name = "area_code")
    private String areaCode;

    /**
     * 排序用
     */
    @Column(name = "sort_order")
    private Integer sortOrder;

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
     * @return parent_id
     */
    public Integer getParentId() {
        return parentId;
    }

    /**
     * @param parentId
     */
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取邮编
     *
     * @return post_code - 邮编
     */
    public String getPostCode() {
        return postCode;
    }

    /**
     * 设置邮编
     *
     * @param postCode 邮编
     */
    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    /**
     * 获取区号
     *
     * @return area_code - 区号
     */
    public String getAreaCode() {
        return areaCode;
    }

    /**
     * 设置区号
     *
     * @param areaCode 区号
     */
    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    /**
     * 获取排序用
     *
     * @return sort_order - 排序用
     */
    public Integer getSortOrder() {
        return sortOrder;
    }

    /**
     * 设置排序用
     *
     * @param sortOrder 排序用
     */
    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
}