package cn.ac.bcc.model.wechat;

/**
 * Created by bcc on 16/4/17.
 */
public class AccessToken {
    public String accessToken;
    public Integer expiresIn;

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public Integer getExpiresIn() {
        return expiresIn;
    }

    public void setExpiresIn(Integer expiresIn) {
        this.expiresIn = expiresIn;
    }
}
