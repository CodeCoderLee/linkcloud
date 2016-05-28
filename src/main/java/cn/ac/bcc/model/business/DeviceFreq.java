package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_device_freq")
public class DeviceFreq {
    /**
     * 设备id
     */
    @Id
    @Column(name = "device_id")
    private Integer deviceId;

    /**
     * 频点id
     */
    @Id
    @Column(name = "freq_id")
    private Integer freqId;

    /**
     * 获取设备id
     *
     * @return device_id - 设备id
     */
    public Integer getDeviceId() {
        return deviceId;
    }

    /**
     * 设置设备id
     *
     * @param deviceId 设备id
     */
    public void setDeviceId(Integer deviceId) {
        this.deviceId = deviceId;
    }

    /**
     * 获取频点id
     *
     * @return freq_id - 频点id
     */
    public Integer getFreqId() {
        return freqId;
    }

    /**
     * 设置频点id
     *
     * @param freqId 频点id
     */
    public void setFreqId(Integer freqId) {
        this.freqId = freqId;
    }
}