package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_frequency")
public class Frequency {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    /**
     * 频点
     */
    @Column(name = "freq_port")
    private Integer freqPort;

    /**
     * 可用节目号
     */
    @Column(name = "available_program")
    private String availableProgram;

    /**
     * 节目名称
     */
    @Column(name = "progarm_name")
    private String progarmName;

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
    public Integer getFreqPort() {
        return freqPort;
    }

    /**
     * 设置频点
     *
     * @param freqPort 频点
     */
    public void setFreqPort(Integer freqPort) {
        this.freqPort = freqPort;
    }

    /**
     * 获取可用节目号
     *
     * @return available_program - 可用节目号
     */
    public String getAvailableProgram() {
        return availableProgram;
    }

    /**
     * 设置可用节目号
     *
     * @param availableProgram 可用节目号
     */
    public void setAvailableProgram(String availableProgram) {
        this.availableProgram = availableProgram;
    }

    /**
     * 获取节目名称
     *
     * @return progarm_name - 节目名称
     */
    public String getProgarmName() {
        return progarmName;
    }

    /**
     * 设置节目名称
     *
     * @param progarmName 节目名称
     */
    public void setProgarmName(String progarmName) {
        this.progarmName = progarmName;
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