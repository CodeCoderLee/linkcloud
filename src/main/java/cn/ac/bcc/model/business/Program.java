package cn.ac.bcc.model.business;

import javax.persistence.*;

@Table(name = "bcc_program")
public class Program {
    /**
     * 主键，自增id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 节目号
     */
    @Column(name = "program_num")
    private String programNum;

    /**
     * 节目名称
     */
    @Column(name = "program_name")
    private String programName;

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
     * 获取节目号
     *
     * @return program_num - 节目号
     */
    public String getProgramNum() {
        return programNum;
    }

    /**
     * 设置节目号
     *
     * @param programNum 节目号
     */
    public void setProgramNum(String programNum) {
        this.programNum = programNum;
    }

    /**
     * 获取节目名称
     *
     * @return program_name - 节目名称
     */
    public String getProgramName() {
        return programName;
    }

    /**
     * 设置节目名称
     *
     * @param programName 节目名称
     */
    public void setProgramName(String programName) {
        this.programName = programName;
    }
}