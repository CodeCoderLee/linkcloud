package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_device_update")
public class DeviceUpdate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "serial_number")
    private String serialNumber;

    /**
     * 升级信息，json串
     */
    @Column(name = "update_info")
    private String updateInfo;

    @Column(name = "is_update")
    private Integer isUpdate;

    public Integer getIsUpdate() {
        return isUpdate;
    }

    public void setIsUpdate(Integer isUpdate) {
        this.isUpdate = isUpdate;
    }

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
     * 获取升级信息，json串
     *
     * @return update_info - 升级信息，json串
     */
    public String getUpdateInfo() {
        return updateInfo;
    }

    /**
     * 设置升级信息，json串
     *
     * @param updateInfo 升级信息，json串
     */
    public void setUpdateInfo(String updateInfo) {
        this.updateInfo = updateInfo;
    }
}