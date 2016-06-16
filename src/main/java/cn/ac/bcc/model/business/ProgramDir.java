package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_program_dir")
public class ProgramDir {
    /**
     * 主键，自增id
     */
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 设备序列号
     */
    @Column(name = "device_serial_number")
    private String deviceSerialNumber;

    /**
     * 层级结构

     */
    private String level;

    @Column(name = "dir_name")
    private String dirName;

    /**
     * 获取主键，自增id
     *
     * @return id - 主键，自增id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键，自增id
     *
     * @param id 主键，自增id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取设备序列号
     *
     * @return device_serial_number - 设备序列号
     */
    public String getDeviceSerialNumber() {
        return deviceSerialNumber;
    }

    /**
     * 设置设备序列号
     *
     * @param deviceSerialNumber 设备序列号
     */
    public void setDeviceSerialNumber(String deviceSerialNumber) {
        this.deviceSerialNumber = deviceSerialNumber;
    }

    /**
     * 获取层级结构

     *
     * @return level - 层级结构

     */
    public String getLevel() {
        return level;
    }

    /**
     * 设置层级结构

     *
     * @param level 层级结构

     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * @return dir_name
     */
    public String getDirName() {
        return dirName;
    }

    /**
     * @param dirName
     */
    public void setDirName(String dirName) {
        this.dirName = dirName;
    }
}