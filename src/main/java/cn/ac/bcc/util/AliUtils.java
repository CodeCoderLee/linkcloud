package cn.ac.bcc.util;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.CreateBucketRequest;
import com.aliyun.oss.model.PolicyConditions;
import org.apache.commons.codec.binary.Base64;

import java.io.File;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Lisy on 2016-07-29.
 */
public class AliUtils {
    private static String domain = "oss-cn-beijing.aliyuncs.com";
    public static String endpoint = "http://oss-cn-beijing.aliyuncs.com";  //外网访问
    //String endpoint = "http://oss-cn-beijing-internal.aliyuncs.com";  //内网访问

    public static String accessKeyId = "D2A0B7qClRxEy75N";
    public static String accessKeySecret = "bF1Xp21EjNAURQAxWEtsSggk58IzkO";
    public static String bucketName = "linkedtvosslinkedtv";
    static String securityToken = "<yourSecurityToken>";
    private static AliUtils aliUtils = new AliUtils();
    private static OSSClient client = null;
    private AliUtils(){

    }

//    public static AliUtils getInstance(){
//        return aliUtils;
//    }

    public static OSSClient getOSSClient(){
        if(client == null){
            client = new OSSClient(endpoint, accessKeyId, accessKeySecret);
        }
        return  client;
    }

    public static String uploadVideo(InputStream inputStream,int id){
        OSSClient client = getOSSClient();
        String key = "video/id/" + id ;
        client.putObject(bucketName,key,inputStream);

        StringBuilder downUrl = new StringBuilder();
        downUrl.append("http://").append(bucketName).append(".").append(domain).append("/").append(key);
        return downUrl.toString();
    }

    public static String uploadImage(InputStream inputStream,String id){
        OSSClient client = getOSSClient();
        String key = "image/id/" + id ;
        client.putObject(bucketName,key,inputStream);

        StringBuilder downUrl = new StringBuilder();
        downUrl.append("http://").append(bucketName).append(".").append(domain).append("/").append(key);
        return downUrl.toString();
    }

    public static String uploadVersionFile(InputStream inputStream,int id){
        OSSClient client = getOSSClient();
        String key = "version/id/" + id ;
        client.putObject(bucketName,key,inputStream);

        StringBuilder downUrl = new StringBuilder();
        downUrl.append("http://").append(bucketName).append(".").append(domain).append("/").append(key);
        return downUrl.toString();
    }

    public static void closeOSSClient(){
        if(client != null){
            client.shutdown();
        }
    }

    public static void main(String[] args){
        OSSClient client = getOSSClient();
        CreateBucketRequest createBucketRequest= new CreateBucketRequest(bucketName);
        // 设置bucket权限
        createBucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
        client.createBucket(createBucketRequest);
        client.putObject(bucketName,"test/lisy0",new File("F:\\临时文件\\面试快推荐人选 （徐先生）-猎聘网简历.doc"));
    }

    public static String getPolicy(){
        PolicyConditions conditions = new PolicyConditions();
        conditions.addConditionItem("content-length-range",0,1024*1024*100);
        String policyStr = client.generatePostPolicy(AliUtils.getPolicyDate(),conditions);
        String encodePolicy = new String(Base64.encodeBase64(policyStr.getBytes()));
        return encodePolicy;
    }

    public static String getSignature(String policy){
        String signature = com.aliyun.oss.common.auth.ServiceSignature.create().computeSignature(accessKeySecret, policy);
        return signature;
    }

    private static Date getPolicyDate(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.HOUR,2);
        return cal.getTime();
    }
}
