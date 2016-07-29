package cn.ac.bcc.util;

import org.apache.commons.codec.binary.Base64;

import javax.activation.MimetypesFileTypeMap;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 * This sample demonstrates how to post object under specfied bucket from Aliyun
 * OSS using the OSS SDK for Java.
 */
public class AliFormUplaod {

    // 需要上传的本地文件，确保该文件存在
    private String localFilePath = "F:\\临时文件\\面试快推荐人选 （徐先生）-猎聘网简历.doc";
    // OSS域名，如http://oss-cn-hangzhou.aliyuncs.com
    private String endpoint = AliUtils.endpoint;
    // AccessKey请登录https://ak-console.aliyun.com/#/查看
    private String accessKeyId = AliUtils.accessKeyId;
    private String accessKeySecret = AliUtils.accessKeySecret;
    // 你之前创建的bucket，确保这个bucket已经创建
    private String bucketName = "linkedtvosslinkedtv";
    // 上传文件后的object名称
//    private String key = "test/lisy";


    private void PostObject(String key) throws Exception {
        // 提交表单的URL为bucket域名
        String urlStr = endpoint.replace("http://", "http://" + bucketName + ".");
        // 表单域
        Map<String, String> textMap = new LinkedHashMap<String, String>();

        // key
        textMap.put("key", key);
        // Content-Disposition
        textMap.put("Content-Disposition", "attachment;filename="
                + localFilePath);

        File file = new File(localFilePath);
        long filesize = file.length();
        // OSSAccessKeyId
        textMap.put("OSSAccessKeyId", accessKeyId);
        // policy
        String policy = "{\"expiration\": \"2120-01-01T12:00:00.000Z\",\"conditions\": [[\"content-length-range\", 0, " + filesize + "]]}";
        String encodePolicy = new String(Base64.encodeBase64(policy.getBytes()));
        textMap.put("policy", encodePolicy);
        // Signature
        String signaturecom = com.aliyun.oss.common.auth.ServiceSignature.create().computeSignature(accessKeySecret, encodePolicy);
        textMap.put("Signature", signaturecom);

        Map<String, String> fileMap = new HashMap<String, String>();
        fileMap.put("file", localFilePath);

        String ret = formUpload(urlStr, textMap, fileMap, filesize);

        System.out.println("Post Object [" + key + "] to bucket [" + bucketName + "]");
        System.out.println("post reponse:" + ret);
    }

    private static String formUpload(String urlStr, Map<String, String> textMap,
                                     Map<String, String> fileMap, long filesize) throws Exception {
        String res = "";
        HttpURLConnection conn = null;
        String boundary = "" + filesize;

        try {
            URL url = new URL(urlStr);
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(30000);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent",
                    "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)");
            conn.setRequestProperty("Content-Type",
                    "multipart/form-data; boundary=" + boundary);
            OutputStream out = new DataOutputStream(conn.getOutputStream());

            // text
            if (textMap != null) {
                StringBuffer strBuf = new StringBuffer();
                Iterator<Entry<String, String>> iter = textMap.entrySet().iterator();
                int i = 0;

                while (iter.hasNext()) {
                    Entry<String, String> entry = iter.next();
                    String inputName = entry.getKey();
                    String inputValue = entry.getValue();

                    if (inputValue == null) {
                        continue;
                    }

                    if (i == 0) {
                        strBuf.append("--").append(boundary).append("\r\n");
                        strBuf.append("Content-Disposition: form-data; name=\""
                                + inputName + "\"\r\n\r\n");
                        strBuf.append(inputValue);
                    } else {
                        strBuf.append("\r\n").append("--").append(boundary).append("\r\n");
                        strBuf.append("Content-Disposition: form-data; name=\""
                                + inputName + "\"\r\n\r\n");
                        strBuf.append(inputValue);
                    }

                    i++;
                }
                out.write(strBuf.toString().getBytes());
            }

            // file
            if (fileMap != null) {
                Iterator<Entry<String, String>> iter = fileMap.entrySet().iterator();

                while (iter.hasNext()) {
                    Entry<String, String> entry = iter.next();
                    String inputName = (String) entry.getKey();
                    String inputValue = (String) entry.getValue();

                    if (inputValue == null) {
                        continue;
                    }

                    File file = new File(inputValue);
                    String filename = file.getName();
                    String contentType = new MimetypesFileTypeMap().getContentType(file);
                    if (contentType == null || contentType.equals("")) {
                        contentType = "application/octet-stream";
                    }

                    StringBuffer strBuf = new StringBuffer();
                    strBuf.append("\r\n").append("--").append(boundary)
                            .append("\r\n");
                    strBuf.append("Content-Disposition: form-data; name=\""
                            + inputName + "\"; filename=\"" + filename
                            + "\"\r\n");
                    strBuf.append("Content-Type: " + contentType + "\r\n\r\n");

                    out.write(strBuf.toString().getBytes());

                    DataInputStream in = new DataInputStream(new FileInputStream(file));
                    int bytes = 0;
                    byte[] bufferOut = new byte[1024];
                    while ((bytes = in.read(bufferOut)) != -1) {
                        out.write(bufferOut, 0, bytes);
                    }
                    in.close();
                }

                StringBuffer strBuf = new StringBuffer();
                out.write(strBuf.toString().getBytes());
            }

            byte[] endData = ("\r\n--" + boundary + "--\r\n").getBytes();
            out.write(endData);
            out.flush();
            out.close();

            // 读取返回数据
            StringBuffer strBuf = new StringBuffer();
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                strBuf.append(line).append("\n");
            }
            res = strBuf.toString();
            reader.close();
            reader = null;
        } catch (Exception e) {
            System.err.println("Send post request exception: " + e);
            throw e;
        } finally {
            if (conn != null) {
                conn.disconnect();
                conn = null;
            }
        }

        return res;
    }

    public static void main(String[] args) throws Exception {
        AliFormUplaod ossPostObject = new AliFormUplaod();
        //ossPostObject.PostObject();
    }

}