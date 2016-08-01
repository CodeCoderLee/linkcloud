package cn.ac.bcc.model.core;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_res_role")
public class ResRole implements Serializable {
    @Id
    @Column(name = "roleId")
    private Integer roleid;

    @Id
    @Column(name = "resId")
    private Integer resid;

    /**
     * @return roleId
     */
    public Integer getRoleid() {
        return roleid;
    }

    /**
     * @param roleid
     */
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    /**
     * @return resId
     */
    public Integer getResid() {
        return resid;
    }

    /**
     * @param resid
     */
    public void setResid(Integer resid) {
        this.resid = resid;
    }
}