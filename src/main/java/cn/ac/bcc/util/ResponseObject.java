package cn.ac.bcc.util;

/**
 * Created by lifm on 2016/2/17.
 */
public class ResponseObject {

    public static final int SUCCESS = 1;
    public static final int ERROR = 0;

//    private String type;
    private DataObject data;
    private String message;
    private int status;
    private String id = null;
    private long total;

//
//    public String getType() {
//        return type;
//    }
//
//    public void setType(String type) {
//        this.type = type;
//    }

    public DataObject getData() {
        return data;
    }

    public void setData(DataObject data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }
}
