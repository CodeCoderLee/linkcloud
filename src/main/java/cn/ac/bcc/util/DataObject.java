/**
 * @Title: DataObject.java
 * @Package com.bcc.rnd.billing.rest
 * @Description: TODO(用一句话描述该文件做什么)
 * @author xck bcc.cn
 * @date 2014-7-8 上午11:02:16
 * @version V1.0
 */
package cn.ac.bcc.util;

import net.sf.json.JSONObject;

import java.util.List;

/**
 * @ClassName: DataObject
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author xck bcc.cn
 * @date 2014-7-8 上午11:02:16 
 *
 */
public class DataObject<T> {
    private List<String> headersEN;
    private List<String> headers;
    private List<T> rows;
    private JSONObject form;

    public JSONObject getForm() {
        return form;
    }

    public void setForm(JSONObject form) {
        this.form = form;
    }

    public List<String> getHeadersEN() {
        return headersEN;
    }

    public void setHeadersEN(List<String> headersEN) {
        this.headersEN = headersEN;
    }

    public List<String> getHeaders() {
        return headers;
    }

    public void setHeaders(List<String> headers) {
        this.headers = headers;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
