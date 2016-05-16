package cn.ac.bcc.model.business;

import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_device")
public class Device {
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "private_key")
    private String privateKey;

    @Column(name = "register_time")
    private Date registerTime;

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

    /**
     * @return private_key
     */
    public String getPrivateKey() {
        return privateKey;
    }

    /**
     * @param privateKey
     */
    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }

    /**
     * @return register_time
     */
    public Date getRegisterTime() {
        return registerTime;
    }

    /**
     * @param registerTime
     */
    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }
}