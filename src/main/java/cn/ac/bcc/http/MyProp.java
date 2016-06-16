package cn.ac.bcc.http;

/**
 * Created by lenovo on 2016-06-16.
 */
public class MyProp {
    private String key;
    private Integer parentId;

    public boolean equals(Object obj) {
        if(this == obj)return  true;
        if(obj instanceof MyProp){
            MyProp other = (MyProp)obj;
            return  key.equals(other.getKey());
        }else{
            return false;
        }
    }

    public  int hashCode(){
        return key.hashCode();
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}
