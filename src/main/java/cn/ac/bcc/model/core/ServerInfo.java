package cn.ac.bcc.model.core;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "bcc_server_info")
public class ServerInfo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "cpuUsage")
    private String cpuusage;

    @Column(name = "setCpuUsage")
    private String setcpuusage;

    @Column(name = "jvmUsage")
    private String jvmusage;

    @Column(name = "setJvmUsage")
    private String setjvmusage;

    @Column(name = "ramUsage")
    private String ramusage;

    @Column(name = "setRamUsage")
    private String setramusage;

    private String email;

    @Column(name = "operTime")
    private Date opertime;

    private String mark;

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
     * @return cpuUsage
     */
    public String getCpuusage() {
        return cpuusage;
    }

    /**
     * @param cpuusage
     */
    public void setCpuusage(String cpuusage) {
        this.cpuusage = cpuusage;
    }

    /**
     * @return setCpuUsage
     */
    public String getSetcpuusage() {
        return setcpuusage;
    }

    /**
     * @param setcpuusage
     */
    public void setSetcpuusage(String setcpuusage) {
        this.setcpuusage = setcpuusage;
    }

    /**
     * @return jvmUsage
     */
    public String getJvmusage() {
        return jvmusage;
    }

    /**
     * @param jvmusage
     */
    public void setJvmusage(String jvmusage) {
        this.jvmusage = jvmusage;
    }

    /**
     * @return setJvmUsage
     */
    public String getSetjvmusage() {
        return setjvmusage;
    }

    /**
     * @param setjvmusage
     */
    public void setSetjvmusage(String setjvmusage) {
        this.setjvmusage = setjvmusage;
    }

    /**
     * @return ramUsage
     */
    public String getRamusage() {
        return ramusage;
    }

    /**
     * @param ramusage
     */
    public void setRamusage(String ramusage) {
        this.ramusage = ramusage;
    }

    /**
     * @return setRamUsage
     */
    public String getSetramusage() {
        return setramusage;
    }

    /**
     * @param setramusage
     */
    public void setSetramusage(String setramusage) {
        this.setramusage = setramusage;
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return operTime
     */
    public Date getOpertime() {
        return opertime;
    }

    /**
     * @param opertime
     */
    public void setOpertime(Date opertime) {
        this.opertime = opertime;
    }

    /**
     * @return mark
     */
    public String getMark() {
        return mark;
    }

    /**
     * @param mark
     */
    public void setMark(String mark) {
        this.mark = mark;
    }
}