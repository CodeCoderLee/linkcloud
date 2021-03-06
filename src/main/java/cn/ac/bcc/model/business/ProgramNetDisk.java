package cn.ac.bcc.model.business;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_program_netdisk")
public class ProgramNetDisk implements Serializable {
    /**
     * 主键，自增id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 设备序列号
     */
    @Column(name = "device_serial_number")
    private String deviceSerialNumber;

    /**
     * 信源数量
     */
    @Column(name = "src_number")
    private Integer srcNumber;

    /**
     * 信源标识
     */
    @Column(name = "src_id")
    private String srcId;


    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Column(name = "parent_id")
    private Integer parentId;
    /**
     * 信源分类
     */
    private String stype;

    /**
     * 节目数量
     */
    private Integer pnumber;

    /**
     * 节目标识
     */
    private String pid;

    /**
     * 节目名称
     */
    private String pname;

    /**
     * 节目分类
     */
    private String ptype;

    /**
     * 节目url
     */
    private String purl;

    private String pimg;

    /**
     * 但stype为netdisk时，di_id 表明是哪个目录下面的文件。
     */
    private Integer level;

    /**
     * 1  dir
0 file
     */
    @Column(name = "is_dir")
    private Integer isDir;

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
     * 获取信源数量
     *
     * @return src_number - 信源数量
     */
    public Integer getSrcNumber() {
        return srcNumber;
    }

    /**
     * 设置信源数量
     *
     * @param srcNumber 信源数量
     */
    public void setSrcNumber(Integer srcNumber) {
        this.srcNumber = srcNumber;
    }

    /**
     * 获取信源标识
     *
     * @return src_id - 信源标识
     */
    public String getSrcId() {
        return srcId;
    }

    /**
     * 设置信源标识
     *
     * @param srcId 信源标识
     */
    public void setSrcId(String srcId) {
        this.srcId = srcId;
    }

    /**
     * 获取信源分类
     *
     * @return stype - 信源分类
     */
    public String getStype() {
        return stype;
    }

    /**
     * 设置信源分类
     *
     * @param stype 信源分类
     */
    public void setStype(String stype) {
        this.stype = stype;
    }

    /**
     * 获取节目数量
     *
     * @return pnumber - 节目数量
     */
    public Integer getPnumber() {
        return pnumber;
    }

    /**
     * 设置节目数量
     *
     * @param pnumber 节目数量
     */
    public void setPnumber(Integer pnumber) {
        this.pnumber = pnumber;
    }

    /**
     * 获取节目标识
     *
     * @return pid - 节目标识
     */
    public String getPid() {
        return pid;
    }

    /**
     * 设置节目标识
     *
     * @param pid 节目标识
     */
    public void setPid(String pid) {
        this.pid = pid;
    }

    /**
     * 获取节目名称
     *
     * @return pname - 节目名称
     */
    public String getPname() {
        return pname;
    }

    /**
     * 设置节目名称
     *
     * @param pname 节目名称
     */
    public void setPname(String pname) {
        this.pname = pname;
    }

    /**
     * 获取节目分类
     *
     * @return ptype - 节目分类
     */
    public String getPtype() {
        return ptype;
    }

    /**
     * 设置节目分类
     *
     * @param ptype 节目分类
     */
    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    /**
     * 获取节目url
     *
     * @return purl - 节目url
     */
    public String getPurl() {
        return purl;
    }

    /**
     * 设置节目url
     *
     * @param purl 节目url
     */
    public void setPurl(String purl) {
        this.purl = purl;
    }

    /**
     * @return pimg
     */
    public String getPimg() {
        return pimg;
    }

    /**
     * @param pimg
     */
    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    /**
     * 获取但stype为netdisk时，di_id 表明是哪个目录下面的文件。
     *
     * @return level - 但stype为netdisk时，di_id 表明是哪个目录下面的文件。
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * 设置但stype为netdisk时，di_id 表明是哪个目录下面的文件。
     *
     * @param level 但stype为netdisk时，di_id 表明是哪个目录下面的文件。
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * 获取1  dir
0 file
     *
     * @return is_dir - 1  dir
0 file
     */
    public Integer getIsDir() {
        return isDir;
    }

    /**
     * 设置1  dir
0 file
     *
     * @param isDir 1  dir
0 file
     */
    public void setIsDir(Integer isDir) {
        this.isDir = isDir;
    }


}