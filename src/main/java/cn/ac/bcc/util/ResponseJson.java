package cn.ac.bcc.util;

/**
 * Created by lenovo on 2016-05-23.
 */
public class ResponseJson {
    private  int result;
    private String command;
    private String description;
    private long time;
    private String token ;

    public enum Command{
        Nothing("nothing"),Shock("shock"),ScanFrq("scanfrq"),SetFrq("setfrq"),Updatead("updatedad"),RemoteWatch("remotewatch");
        private final String cmd;
        private Command(String cmd){
            this.cmd = cmd;
        }

        public String toString(){
            return cmd;
        }
    }
    public String getCommand() {
        return command;
    }

    public void setCommand(Command cmd) {
        this.command = cmd.toString();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }
}
