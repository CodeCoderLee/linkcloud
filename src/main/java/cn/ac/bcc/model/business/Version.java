package cn.ac.bcc.model.business;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_version")
public class Version implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    /**
     * 模块名称
     */
    @Column(name = "name")
    private String name;

    /**
     * 1引导模块，2转码模块，3流媒体模块
     */
    @Column(name = "type")
    private Integer type;

    /**
     * 文件保存地址
     */
    @Column(name = "url")
    private String url;

    /**
     * 版本
     */
    @Column(name = "version")
    private String version;

    /**
     * 添加版本信息时间
     */
    @Column(name = "add_time")
    private Date addTime;

    @Column(name = "file_path")
    private String filePath;

    @Column(name = "file_name")
    private String fileName;

    @Column(name = "remarks")
    private String remarks;


    @Transient
    private String modelName;

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

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * 获取模块名称
     *
     * @return name - 模块名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置模块名称
     *
     * @param name 模块名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取1引导模块，2转码模块，3流媒体模块
     *
     * @return type - 1引导模块，2转码模块，3流媒体模块
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置1引导模块，2转码模块，3流媒体模块
     *
     * @param type 1引导模块，2转码模块，3流媒体模块
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取文件保存地址
     *
     * @return url - 文件保存地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置文件保存地址
     *
     * @param url 文件保存地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取版本
     *
     * @return version - 版本
     */
    public String getVersion() {
        return version;
    }

    /**
     * 设置版本
     *
     * @param version 版本
     */
    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * 获取添加版本信息时间
     *
     * @return add_time - 添加版本信息时间
     */
    public Date getAddTime() {
        return addTime;
    }

    /**
     * 设置添加版本信息时间
     *
     * @param addTime 添加版本信息时间
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
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

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }
}