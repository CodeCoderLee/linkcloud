package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_advertisement")
public class Advertisement {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    /**
     * 文件路径
     */
    @Column(name = "file_path")
    private String filePath;

    /**
     * 文件名称
     */
    @Column(name = "file_name")
    private String fileName;

    /**
     * 来源
     */
    private Integer state;

    private String source;

    /**
     * 行业分类
     */
    @Column(name = "industry_id")
    private Integer industryId;

    /**
     * 是否来自第三方
     */
    @Column(name = "is_third_party")
    private String isThirdParty;

    /**
     * 广告主
     */
    @Column(name = "company_id")
    private String companyId;

    /**
     * 外链
     */
    private String url;

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
     * 获取文件路径
     *
     * @return file_path - 文件路径
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * 设置文件路径
     *
     * @param filePath 文件路径
     */
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * 获取文件名称
     *
     * @return file_name - 文件名称
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * 设置文件名称
     *
     * @param fileName 文件名称
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * 获取来源
     *
     * @return state - 来源
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置来源
     *
     * @param state 来源
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * @return source
     */
    public String getSource() {
        return source;
    }

    /**
     * @param source
     */
    public void setSource(String source) {
        this.source = source;
    }

    /**
     * 获取行业分类
     *
     * @return industry_id - 行业分类
     */
    public Integer getIndustryId() {
        return industryId;
    }

    /**
     * 设置行业分类
     *
     * @param industryId 行业分类
     */
    public void setIndustryId(Integer industryId) {
        this.industryId = industryId;
    }

    /**
     * 获取是否来自第三方
     *
     * @return is_third_party - 是否来自第三方
     */
    public String getIsThirdParty() {
        return isThirdParty;
    }

    /**
     * 设置是否来自第三方
     *
     * @param isThirdParty 是否来自第三方
     */
    public void setIsThirdParty(String isThirdParty) {
        this.isThirdParty = isThirdParty;
    }

    /**
     * 获取广告主
     *
     * @return company_id - 广告主
     */
    public String getCompanyId() {
        return companyId;
    }

    /**
     * 设置广告主
     *
     * @param companyId 广告主
     */
    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    /**
     * 获取外链
     *
     * @return url - 外链
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置外链
     *
     * @param url 外链
     */
    public void setUrl(String url) {
        this.url = url;
    }
}