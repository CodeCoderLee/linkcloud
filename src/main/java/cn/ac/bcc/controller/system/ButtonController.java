package cn.ac.bcc.controller.system;

import cn.ac.bcc.controller.base.BaseController;
import cn.ac.bcc.model.core.Button;
import cn.ac.bcc.service.system.ButtonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/button/")
public class ButtonController extends BaseController<Button> {

    @Autowired
    private ButtonService buttonService;

    @ResponseBody
    @RequestMapping(value = "search")
    public JSONObject search(Button button,String pageNum, String pageSize) {
        return null;
    }

    @ResponseBody
    @RequestMapping(value = "modify")
    public JSONObject modify(Button button, String pageNum, String pageSize) {
        return super.modify(buttonService,button,pageNum,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "add")
    public JSONObject add(Button button, String pageNum, String pageSize) {
        return super.add(buttonService,button,pageNum,pageSize);
    }

    @ResponseBody
    @RequestMapping(value = "delete")
    public JSONObject delete() {
        return super.delete(buttonService,new Button());

    }
    
}
