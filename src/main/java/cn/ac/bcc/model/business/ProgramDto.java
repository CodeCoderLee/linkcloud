package cn.ac.bcc.model.business;

import java.io.Serializable;

/**
 * Created by lifm on 16/7/7.
 */
public class ProgramDto implements Serializable {
    private String pid;
    private String name;
    private boolean select;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSelect() {
        return select;
    }

    public void setSelect(boolean select) {
        this.select = select;
    }
}
