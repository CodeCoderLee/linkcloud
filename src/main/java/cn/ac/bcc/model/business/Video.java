package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_video")
public class Video {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    @Column(name = "file_path")
    private String filePath;

    @Column(name = "file_name")
    private String fileName;

    private Integer state;

    @Column(name = "industry_id")
    private Integer industryId;

    @Column(name = "company_id")
    private Integer companyId;

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
     * @return file_path
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * @param filePath
     */
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * @return file_name
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * @param fileName
     */
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @return state
     */
    public Integer getState() {
        return state;
    }

    /**
     * @param state
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * @return industry_id
     */
    public Integer getIndustryId() {
        return industryId;
    }

    /**
     * @param industryId
     */
    public void setIndustryId(Integer industryId) {
        this.industryId = industryId;
    }

    /**
     * @return company_id
     */
    public Integer getCompanyId() {
        return companyId;
    }

    /**
     * @param companyId
     */
    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    /**
     * @return url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url
     */
    public void setUrl(String url) {
        this.url = url;
    }
}