package cn.ac.bcc.model.core;

import cn.ac.bcc.annotation.Model;
import javax.persistence.*;

@Table(name = "bcc_button")
public class Button {
    /**
     * id
     */
    @Model(name = "id")
    @Id
    @SequenceGenerator(name="",sequenceName="SELECT LAST_INSERT_ID()")
    private Integer id;

    /**
     * 名称
     */
    @Model(name = "名称")
    private String name;

    /**
     * 按钮
     */
    @Model(name = "按钮")
    private String button;

    /**
     * 描述
     */
    @Model(name = "描述")
    private String description;

    /**
     * 获取id
     *
     * @return id - id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置id
     *
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取按钮
     *
     * @return button - 按钮
     */
    public String getButton() {
        return button;
    }

    /**
     * 设置按钮
     *
     * @param button 按钮
     */
    public void setButton(String button) {
        this.button = button;
    }

    /**
     * 获取描述
     *
     * @return description - 描述
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置描述
     *
     * @param description 描述
     */
    public void setDescription(String description) {
        this.description = description;
    }
}