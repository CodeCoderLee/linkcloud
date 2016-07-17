package cn.ac.bcc.util;

/**
 * Created by lifm on 16/7/17.
 */
/*封装页面间跳转传递信息*/
public class Messenger {
    private String msgUrl;
    private Integer msgPageSize;
    private Integer msgPageNumber;
    private String msgSerialNumber;
    private String msgEntrance;

    public String getMsgUrl() {
        return msgUrl;
    }

    public void setMsgUrl(String msgUrl) {
        this.msgUrl = msgUrl;
    }

    public Integer getMsgPageSize() {
        return msgPageSize;
    }

    public void setMsgPageSize(Integer msgPageSize) {
        this.msgPageSize = msgPageSize;
    }

    public Integer getMsgPageNumber() {
        return msgPageNumber;
    }

    public void setMsgPageNumber(Integer msgPageNumber) {
        this.msgPageNumber = msgPageNumber;
    }

    public String getMsgSerialNumber() {
        return msgSerialNumber;
    }

    public void setMsgSerialNumber(String msgSerialNumber) {
        this.msgSerialNumber = msgSerialNumber;
    }

    public String getMsgEntrance() {
        return msgEntrance;
    }

    public void setMsgEntrance(String msgEntrance) {
        this.msgEntrance = msgEntrance;
    }
}
