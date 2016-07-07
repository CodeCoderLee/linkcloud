package cn.ac.bcc.util;


import cn.ac.bcc.model.wechat.WechatButton;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bcc on 16/4/17.
 */
public class WechatUtil {
//    private static final String APP_ID = "wxe98ab8ed7aa9d5fd";
//    private static final String APP_SECRET = "6f552046c2b55b9da5287c4a410afb57";
    private static final String APP_ID = "wx17d50b2c25786690";
    private static final String APP_SECRET = "d237d3fc0ecd175ee1d3a0bdb6adda9d";
    private static final String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token";
    private static final String MENU_CREATE_URL = "https://api.weixin.qq.com/cgi-bin/menu/create";
    private static final String GET_USER_INFO_URL = "https://api.weixin.qq.com/cgi-bin/user/info";
    private static final String OAUTH_AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize";
    private static final String REDIRECT_URL = "http://linkedcloud.com.cn/wechat/getOpenId.shtml";
    private static final String PRODUCT_SHOW_REDIRECT_URL = "http://linkedcloud.com.cnn/wechat/getOpenId.shtml?type=1";
    private static final String PERSONAL_SPACE_REDIRECT_URL = "http://linkedcloud.com.cn/wechat/getOpenId.shtml?type=2";
    //    private static final String REDIRECT_URL = "http://linkedcloud.com.cn/wechat/getOpenId.shtml";
//    private static final String PRODUCT_SHOW_REDIRECT_URL = "http://linkedcloud.com.cn/wechat/getOpenId.shtml?type=1";
//    private static final String PERSONAL_SPACE_REDIRECT_URL = "http://linkedcloud.com.cn/wechat/getOpenId.shtml?type=2";
    private static final String GET_OAUTH_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token";
    private static final String GET_OAUTH_USER_INFO_URL = "https://api.weixin.qq.com/sns/userinfo";

    public static String getAppId(){
        return APP_ID;
    }

    public static String getAccessToken() {
        HttpResponse response = HttpRequest.get(GET_ACCESS_TOKEN_URL)
                .query("grant_type", "client_credential",
                        "appid", APP_ID,
                        "secret", APP_SECRET
                ).send();
        System.out.println(response.body());
        JSONObject jsonObject = JSONObject.fromObject(response.body());
        return jsonObject.getString("access_token");
    }

    public static JSONObject getOauthAccessToken(String code) {
        HttpResponse response = HttpRequest.get(GET_OAUTH_ACCESS_TOKEN_URL)
                .query(
                        "appid", APP_ID,
                        "secret", APP_SECRET,
                        "code", code,
                        "grant_type", "authorization_code"
                ).send();
        System.out.println(response.body());
        JSONObject jsonObject = JSONObject.fromObject(response.body());
        return jsonObject;
    }

    public void createMenu() {
        String accessToken = getAccessToken();
        List<WechatButton> buttons = new ArrayList<WechatButton>();
        /*凌云平台菜单*/
        WechatButton button = new WechatButton();
        button.setType("view");
        button.setName("个人空间");
        button.setUrl(OAUTH_AUTHORIZE_URL + "?appid=" + APP_ID + "&redirect_uri=" + PERSONAL_SPACE_REDIRECT_URL + "&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
        List<WechatButton> list = new ArrayList<WechatButton>();
        list.add(button);
        button = new WechatButton();
        button.setType("view");
        button.setName("产品演示");
        button.setUrl(OAUTH_AUTHORIZE_URL + "?appid=" + APP_ID + "&redirect_uri=" + PRODUCT_SHOW_REDIRECT_URL + "&response_type=code&scope=snsapi_userinfo&state=1#wechat_redirect");
        list.add(button);
        button = new WechatButton();
        button.setName("凌云平台");
        button.setSub_button(list);
        buttons.add(button);

        /*连慧商店菜单*/
        button = new WechatButton();
        button.setType("view");
        button.setName("进店逛逛");
        button.setUrl("https://www.baidu.com");
        list = new ArrayList<WechatButton>();
        list.add(button);
        button = new WechatButton();
        button.setType("view");
        button.setName("LinkedTV");
        button.setUrl("https://www.hao123.com");
        list.add(button);
        button = new WechatButton();
        button.setName("连慧商店");
        button.setSub_button(list);
        buttons.add(button);

        /*连慧服务菜单*/
        button = new WechatButton();
        button.setType("view");
        button.setName("去官网");
        button.setUrl("http://www.qq.com");
        list = new ArrayList<WechatButton>();
        list.add(button);
        button = new WechatButton();
        button.setType("view");
        button.setName("微信电视");
        button.setUrl("http://www.letv.com");
        list.add(button);
        button = new WechatButton();
        button.setName("连慧服务");
        button.setSub_button(list);
        buttons.add(button);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("button", JSONArray.fromObject(buttons));
        HttpResponse response = HttpRequest.post(MENU_CREATE_URL).header("Content-Type", "text/html; charset=UTF-8").query("access_token", accessToken)
                .bodyText(jsonObject.toString()).send();
        System.out.println(response.body());

    }

    public static void main(String[] args) {
        WechatUtil wechatUtil = new WechatUtil();
        wechatUtil.createMenu();
//        WechatUtil.getUserInfo("oSsKswShYo48Mmq4s94mRuLCewaY");
    }

    public static JSONObject getUserInfo(String openId) {
        String accessToken = getAccessToken();
        HttpResponse response = HttpRequest.get(GET_USER_INFO_URL)
                .query("access_token", accessToken,
                        "openid", openId,
                        "lang", "zh_CN")
                .send();
        try {
            return JSONObject.fromObject(new String(response.body().getBytes("iso-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static JSONObject getOauthUserInfo(String accessToken, String openId) {
        HttpResponse response = HttpRequest.get(GET_OAUTH_USER_INFO_URL)
                .query("access_token", accessToken,
                        "openid", openId,
                        "lang", "zh_CN")
                .send();
        try {
            return JSONObject.fromObject(new String(response.body().getBytes("iso-8859-1"), "utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }


}
