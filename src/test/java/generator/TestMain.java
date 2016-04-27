package generator;

import cn.ac.bcc.model.core.User;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lifm on 2016/2/1.
 */
public class TestMain {

    public static void main(String[] args) {
//        SqlSession sqlSession = MybatisHelper.getSqlSession();
//        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        List<User> bccUser = mapper.selectAll();
//        System.out.println("finish");
        List<String> list = getHeaders(User.class);
        System.out.println(list.toString());

    }


    public static List<String> getHeaders(Object object){
        Field[] fields = object.getClass().getDeclaredFields();
        Field[] fields1 = object.getClass().getFields();
        List<String> list = new ArrayList<String>();
        for (int i=0; i < fields.length; i++)
        {
           list.add(fields[i].getName());
//            list.add(fields1[i].getName());
        }
        return list;
    }
}
