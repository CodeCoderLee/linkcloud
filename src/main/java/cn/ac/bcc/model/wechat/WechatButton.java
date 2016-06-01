package cn.ac.bcc.model.wechat;

/**
 * Created by bcc on 16/4/17.
 */
public class WechatButton {
    private String type;
    private String name;
    private String key;
    private String url;

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
}
