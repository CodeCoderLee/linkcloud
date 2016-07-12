package cn.ac.bcc.service.business.advertisement;

import cn.ac.bcc.mapper.business.AdPublishMapper;
import cn.ac.bcc.mapper.business.DeviceToAdMapper;
import cn.ac.bcc.model.business.AdPublish;
import cn.ac.bcc.model.business.DeviceToAd;
import cn.ac.bcc.service.base.BaseService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lifm on 16/7/11.
 */
@Service
public class AdvertisementPublishService extends BaseService<AdPublish>{
    @Autowired
    private AdPublishMapper adPublishMapper;
    @Autowired
    private DeviceToAdMapper deviceToAdMapper;
    public static final String DOMAIN ="http://localhost:8000";// "http://www.linkedcloud.com.cn";
    public void batchInsert(List<AdPublish> adPublishes){
        adPublishMapper.batchInsert(adPublishes);
    }

    public JSONArray getAdList(String serialNumber){
        JSONArray array = new JSONArray();
        DeviceToAd deviceToAd = new DeviceToAd();
        deviceToAd.setSerialNumber(serialNumber);
        deviceToAd = deviceToAdMapper.selectOne(deviceToAd);
        if(deviceToAd != null) {
            String companyAdInfo = deviceToAd.getCompanyAdInfo();
            doProcessAd(companyAdInfo, array);

            String customAdInfo = deviceToAd.getCustomAdInfo();
            doProcessAd(customAdInfo, array);

            String selfAdInfo = deviceToAd.getSelfAdInfo();
            doProcessAd(selfAdInfo, array);
        }
        return array;
    }

    private int doProcessAd(String jsonStr,JSONArray array){
        JSONObject jsonObj = null;
        try{
            jsonObj = JSONObject.fromObject(jsonStr);
            JSONArray jsonArr = jsonObj.getJSONArray("ads");
            int size = jsonArr.size();
            for(int i = 0;i<size;i++){
                JSONObject obj = jsonArr.getJSONObject(i);
                String url = obj.getString("url");
                String id = obj.getString("id");
                JSONObject adObj = new JSONObject();
                adObj.put("url",DOMAIN + url);
                adObj.put("id",id);
                array.add(adObj);
            }
            return size;
        }catch (Exception e){
            //e.printStackTrace();
            return 0;
        }
    }
}
