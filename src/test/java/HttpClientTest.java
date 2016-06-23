import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lenovo on 2016-05-31.
 */
public class HttpClientTest {

    public static void main(String[] args){
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        HttpClientTest.get("http://101.201.38.228:8080/ws/device/linkHello.shtml",params);

        String json = "{}";
        HttpClientTest.post("http://101.201.38.228:8080/ws/device/authen.shtml",json);
    }

    private static HttpClient httpClient = new DefaultHttpClient();

    /**
     * 发送Get请求
     * @param url
     * @param params
     * @return
     */
    public static String get(String url, List<NameValuePair> params) {
        String body = null;
        try {
            // Get请求
            HttpGet httpget = new HttpGet(url);
            httpget.addHeader("Connection", "Keep-Alive");
            // 设置参数
            String str = EntityUtils.toString(new UrlEncodedFormEntity(params));
            httpget.setURI(new URI(httpget.getURI().toString() + "?" + str));
            // 发送请求
            HttpResponse httpresponse = httpClient.execute(httpget);
            // 获取返回数据
            HttpEntity entity = httpresponse.getEntity();
            body = EntityUtils.toString(entity);
            if (entity != null) {
                entity.consumeContent();
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return body;
    }

    /**
     * 发送 Post请求
     * @param url
     * @param reqXml
     * @return
     */
    public static String post(String url, String reqXml) {
        String body = null;
        try {
            httpClient.getParams().setParameter("http.protocol.content-charset", HTTP.UTF_8);
            httpClient.getParams().setParameter(HTTP.CONTENT_ENCODING, HTTP.UTF_8);
            httpClient.getParams().setParameter(HTTP.CHARSET_PARAM, HTTP.UTF_8);
            httpClient.getParams().setParameter(HTTP.DEFAULT_PROTOCOL_CHARSET,HTTP.UTF_8);
            // Post请求
            HttpPost httppost = new HttpPost(url);
            httppost.addHeader("Connection", "Keep-Alive");
            //设置post编码
            httppost.getParams().setParameter("http.protocol.content-charset",HTTP.UTF_8);
            httppost.getParams().setParameter(HTTP.CONTENT_ENCODING, HTTP.UTF_8);
            httppost.getParams().setParameter(HTTP.CHARSET_PARAM, HTTP.UTF_8);
            httppost.getParams().setParameter(HTTP.DEFAULT_PROTOCOL_CHARSET, HTTP.UTF_8);

            // 设置参数
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            params.add(new BasicNameValuePair("$xmldata", reqXml));
            httppost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
//          StringEntity entity1 = new StringEntity(getUTF8XMLString(reqXml), "UTF-8");
//          entity1.setContentType("text/xml;charset=UTF-8");
//          entity1.setContentEncoding("UTF-8");
//          httppost.setEntity(entity1);
            //设置报文头
            httppost.setHeader("Content-Type", "text/xml;charset=UTF-8");
            // 发送请求
            HttpResponse httpresponse = httpClient.execute(httppost);
            // 获取返回数据
            HttpEntity entity = httpresponse.getEntity();
            body = EntityUtils.toString(entity);
            if (entity != null) {
                entity.consumeContent();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return body;
    }

    /**
     * 根据样式格式化时间
     * "yyyyMMdd"
     * "yyyyMMddHHmmss"
     * "yyyyMMddHHmmssssssss"
     * @param dateFormat
     * @return
     */
    public static String getnowDate(String dateFormat)
    {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(new Date());
    }
}
