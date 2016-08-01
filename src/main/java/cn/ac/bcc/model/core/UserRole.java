package cn.ac.bcc.model.core;

import javax.persistence.*;
import java.io.Serializable;

@Table(name = "bcc_user_role")
public class UserRole implements Serializable {
    @Id
    @Column(name = "userId")
    private Integer userid;

    @Id
    @Column(name = "roleId")
    private Integer roleid;

    /**
     * @return userId
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * @param userid
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

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
}