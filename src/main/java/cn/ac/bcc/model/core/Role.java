package cn.ac.bcc.model.core;

import cn.ac.bcc.annotation.Model;

import javax.persistence.*;

@Table(name = "bcc_role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Model(name = "ID")
    private Integer id;

    @Model(name = "名称")
    private String name;

    @Column(name = "roleKey")
    @Model(name = "roleKey")
    private String rolekey;

    @Model(name = "状态")
    private String state;

    @Model(name = "描述")
    private String description;

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
     * @return state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return roleKey
     */
    public String getRolekey() {
        return rolekey;
    }

    /**
     * @param rolekey
     */
    public void setRolekey(String rolekey) {
        this.rolekey = rolekey;
    }

    /**
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
}