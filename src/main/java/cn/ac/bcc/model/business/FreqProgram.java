package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_freq_program")
public class FreqProgram implements Serializable {
    /**
     * 频点Id
     */
    @Id
    @Column(name = "freq_id")
    private Integer freqId;

    /**
     * 可用节目id
     */
    @Id
    @Column(name = "program_id")
    private Integer programId;

    /**
     * 获取频点Id
     *
     * @return freq_id - 频点Id
     */
    public Integer getFreqId() {
        return freqId;
    }

    /**
     * 设置频点Id
     *
     * @param freqId 频点Id
     */
    public void setFreqId(Integer freqId) {
        this.freqId = freqId;
    }

    /**
     * 获取可用节目id
     *
     * @return program_id - 可用节目id
     */
    public Integer getProgramId() {
        return programId;
    }

    /**
     * 设置可用节目id
     *
     * @param programId 可用节目id
     */
    public void setProgramId(Integer programId) {
        this.programId = programId;
    }
}