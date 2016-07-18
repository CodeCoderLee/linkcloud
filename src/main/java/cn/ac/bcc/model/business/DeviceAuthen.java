package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_device_authen")
public class DeviceAuthen {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "private_key")
    private String privateKey;

    private String heartbeat;

    private String programs;

    private String ip1;

    private String ip2;

    private String mac1;

    private String mac2;

    private String version1;

    private String version2;

    private String token;

    @Column(name="on_off_line")
    private Integer onOffLine;

    public Integer getOnOffLine() {
        return onOffLine;
    }

    public void setOnOffLine(Integer onOffLine) {
        this.onOffLine = onOffLine;
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
     * @return ip1
     */
    public String getIp1() {
        return ip1;
    }

    /**
     * @param ip1
     */
    public void setIp1(String ip1) {
        this.ip1 = ip1;
    }

    /**
     * @return ip2
     */
    public String getIp2() {
        return ip2;
    }

    /**
     * @param ip2
     */
    public void setIp2(String ip2) {
        this.ip2 = ip2;
    }

    /**
     * @return mac1
     */
    public String getMac1() {
        return mac1;
    }

    /**
     * @param mac1
     */
    public void setMac1(String mac1) {
        this.mac1 = mac1;
    }

    /**
     * @return mac2
     */
    public String getMac2() {
        return mac2;
    }

    /**
     * @param mac2
     */
    public void setMac2(String mac2) {
        this.mac2 = mac2;
    }

    /**
     * @return version1
     */
    public String getVersion1() {
        return version1;
    }

    /**
     * @param version1
     */
    public void setVersion1(String version1) {
        this.version1 = version1;
    }

    /**
     * @return version2
     */
    public String getVersion2() {
        return version2;
    }

    /**
     * @param version2
     */
    public void setVersion2(String version2) {
        this.version2 = version2;
    }

    /**
     * @return token
     */
    public String getToken() {
        return token;
    }

    /**
     * @param token
     */
    public void setToken(String token) {
        this.token = token;
    }


    public String getHeartbeat() {
        return heartbeat;
    }

    public void setHeartbeat(String heartbeat) {
        this.heartbeat = heartbeat;
    }

    public String getPrograms() {
        return programs;
    }

    public void setPrograms(String programs) {
        this.programs = programs;
    }
}