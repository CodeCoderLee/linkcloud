package cn.ac.bcc.util;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TreeHelper {
	

	public static List<TreeObject> sort2TreeObject(List<TreeObject> temp,boolean isall){
		List<TreeObject> result = new ArrayList<TreeObject>();
		if(isall){
			TreeObject all = new TreeObject();
			all.setId(0);
			all.setParentId(0);
			String url = temp.get(0).getResUrl();
			url = url.substring(0, url.indexOf("?"));
			all.setResUrl(url);
			all.setName("全部");
			result.add(all);
		}
		for(TreeObject t:temp){
			if(t.getParentId().equals(0)){
				result.add(t);
			}
			for (TreeObject tt:temp) {
                if(tt.getParentId().equals(t.getId())){
                    if(t.getChildren() == null){
                        List<TreeObject> myChildrens = new ArrayList<TreeObject>();
                        myChildrens.add(tt);
                        t.setChildren(myChildrens);
                    }else{
                        t.getChildren().add(tt);
                    }
                }
            }
        }
		return result;
	}
	
	public static List<TreeBean> sort(List<TreeBean> temp,boolean istop){
		List<TreeBean> result = new ArrayList<TreeBean>();
		if(istop){
			TreeBean top = new TreeBean();
			top.setLabel("顶级");
			top.setValue("0");
			top.setKey("0");
			top.setParentid("0");
			result.add(top);
		}
		for(TreeBean t:temp){
			if(t.getParentid().equals("0")){
				result.add(t);
			}
			for (TreeBean tt:temp) {
                if(tt.getParentid().equals(t.getKey())){
                    if(t.getChildren() == null){
                        List<TreeBean> myChildrens = new ArrayList<TreeBean>();
                        myChildrens.add(tt);
                        t.setChildren(myChildrens);
                    }else{
                        t.getChildren().add(tt);
                    }
                }
            }
        }
		return result;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Category c1 = new Category();
//		c1.setId(1);
//		c1.setCatname("c1");
//		c1.setParentid(0);
//		Category c2 = new Category();
//		c2.setId(2);
//		c2.setCatname("c2");
//		c2.setParentid(1);
//		Category c3 = new Category();
//		c3.setId(3);
//		c3.setCatname("c3");
//		c3.setParentid(2);
//		Category c4 = new Category();
//		c4.setId(4);
//		c4.setCatname("c4");
//		c4.setParentid(1);
//		Category c5 = new Category();
//		c5.setId(5);
//		c5.setCatname("c5");
//		c5.setParentid(0);
//		Category c6 = new Category();
//		c6.setId(6);
//		c6.setCatname("c6");
//		c6.setParentid(5);
//		List<Category> cl = new ArrayList<Category>();
//		cl.add(c1);
//		cl.add(c2);
//		cl.add(c3);
//		cl.add(c4);
//		cl.add(c5);
//		cl.add(c6);
//		JSONObject json = new JSONObject();
//		json.put("treeData",JSONArray.fromObject(sortCat2TreeBean(cl)));
//		System.out.println(json);

	}
	

}
