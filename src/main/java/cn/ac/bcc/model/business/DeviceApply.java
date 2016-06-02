package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_device_apply")
public class DeviceApply {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    @Column(name = "apply_id")
    private Integer applyId;

    @Column(name = "serial_number")
    private String serialNumber;

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
     * @return apply_id
     */
    public Integer getApplyId() {
        return applyId;
    }

    /**
     * @param applyId
     */
    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    /**
     * @return serial_number
     */
    public String getSerialNumber() {
        return serialNumber;
    }

    /**
     * @param serialNumber
     */
    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }
}