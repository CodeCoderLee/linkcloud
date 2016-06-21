package cn.ac.bcc.model.wechat;

import java.util.List;

/**
 * Created by bcc on 16/4/17.
 */
public class WechatButton {
    private String type;
    private String name;
    private String key;
    private String url;
    private List<WechatButton> sub_button;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {

        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<WechatButton> getSub_button() {
        return sub_button;
    }

    public void setSub_button(List<WechatButton> sub_button) {
        this.sub_button = sub_button;
    }
}
