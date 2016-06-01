package cn.ac.bcc.util;

/**
 * Created by lenovo on 2016-05-23.
 */
public class HelperUtils {
    public static final String KEY_TIME = "time";
    public static final String KEY_TOKEN = "token";

    public static final String KEY_ID = "id";
    public static final String KEY_KEY = "key";
    public static final String KEY_IP1 = "ip1";
    public static final String KEY_IP2 = "ip2";
    public static final String KEY_MAC1 = "mac1";
    public static final String KEY_MAC2 = "mac2";
    public static final String KEY_VERSION1 = "version1";
    public static final String KEY_VERSION2 = "version2";
    public static final String KEY_RESULT = "result";
    public static final String KEY_COMMAND = "command";
    public static final String KEY_DESCRIPTION = "description";
    public static final String KEY_FRQ = "frq";
    public static final String KEY_PROGRAMS = "programs";
    public static final String KEY_DEVICE_STATUS = "dstat";         //设备状态 0 正常 其他为错误码
    public static final String KEY_DEVICE_TEMPER = "temper";        //设备状态
    public static final String KEY_DEVICE_SSTAT = "sstat";          //dtmb状态
    public static final String KEY_DEVICE_FRQ = "frq";               //dtmb工作频点
    public static final String KEY_DEVICE_SSTREN = "sstren";        //dtmb信号强度
    public static final String KEY_DEVICE_SQUA = "squa";             //dtmb信号质量
    public static final String KEY_DEVICE_DS = "ds";                //dtmb节目数量
    public static final String KEY_DEVICE_VS = "vs";                //网盘数量
    public static final String KEY_DEVICE_CS = "cs";                //摄像头数量
    public static final String KEY_SCAN_STM = "stm";                //开始时间
    public static final String KEY_SCAN_CTM = "ctm";                //用户正在观看的视频数量
    public static final String KEY_SCAN_PROGRESS = "progress";     //用户正在观看的视频数量
    public static final String KEY_SCAN_NUMBER = "number";         //用户正在观看的视频数量
    public static final String KEY_SCAN_FRQLIST = "frqlist";       //可锁定的频点列表

    public static final String KEY_RP_SCRNUMBER = "srcnumber";     //信源数量
    public static final String KEY_RP_SRCLIST = "srclist";          //信源列表
    public static final String KEY_RP_SRCID = "srcid";              //信源标识
    public static final String KEY_RP_STYPE = "stype";              //信源分类
    public static final String KEY_RP_PNUMBER = "pnumber";          //节目数量
    public static final String KEY_RP_PLIST = "plist";              //节目列表
    public static final String KEY_RP_PID = "pid";                  //节目标识
    public static final String KEY_RP_PNAME = "pname";              //节目名称
    public static final String KEY_RP_PTYPE = "ptype";              //节目分类，规划用于点播节目的组织
    public static final String KEY_RP_PURL = "purl";                //表示流媒体服务的本地连接地址，用于播放

    public static final String RESULT_FAIL = "1";                        //失败
    public static final String RESULT_SUCCESS = "0";                     //成功

    public static final String CMD_NOTHING = "nothing";
    public static final String CMD_SHOCK = "shock";
    public static final String CMD_SCANFRQ = "scanfrq";
    public static final String CMD_SETFRQ = "setfrq";
    public static final String CMD_UPDATEAD = "updatead";
    public static final String CMD_REMOTEWATCH = "remotewatch";

    private  String result;
    private String command;
    private String description;
    private String time;
    private String token ;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = String.valueOf(time);
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
