package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_frequency")
public class Frequency implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 频点
     */
    @Column(name = "freq_port")
    private String freqPort;

    @Column(name = "area_id")
    private Integer areaId;

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
     * 获取频点
     *
     * @return freq_port - 频点
     */
    public String getFreqPort() {
        return freqPort;
    }

    /**
     * 设置频点
     *
     * @param freqPort 频点
     */
    public void setFreqPort(String freqPort) {
        this.freqPort = freqPort;
    }

    /**
     * @return area_id
     */
    public Integer getAreaId() {
        return areaId;
    }

    /**
     * @param areaId
     */
    public void setAreaId(Integer areaId) {
        this.areaId = areaId;
    }
}