package cn.ac.bcc.controller.base;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.ac.bcc.service.base.BaseService;
import cn.ac.bcc.util.DataObject;
import cn.ac.bcc.util.ResponseObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.ac.bcc.model.core.Resources;
import cn.ac.bcc.model.core.User;
import cn.ac.bcc.service.system.resources.ResourcesService;
import cn.ac.bcc.service.system.role.RoleService;
import cn.ac.bcc.util.Common;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

/**
 * 公共的controller类，包含对model的增删改查等公共方法
 * Created by lifm on 2016/2/1.
 */
public abstract class BaseController<T> {
    public static final String SUCCESS = "success";
    public static final String ERROR = "error";

    @Autowired
    public RoleService roleService;

    @Autowired
    public ResourcesService resourcesService;

    public String readRequestInputStream() {
        String content = null;
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(getRequest().getInputStream()));
            String line = null;
            StringBuffer sb = new StringBuffer();
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            content = sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return content;
    }


    /**
     * 获取返回某一页面的按扭组
     */
    protected List<Resources> findByRes() {
        // 资源ID
        String id = getPara("id");
        // 获取request
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 通过工具类获取当前登录的bean
        User user = (User) Common.findUserSession(request);
        // user id
        String userId = user.getId() + "";
        List<Resources> rs = resourcesService.findChildResourcesByUser(id, userId, null);
        for (Resources r : rs) {
            Object o = r.getDescription();
            if (o != null && !Common.isEmpty(o.toString())) {
                r.setDescription(Common.stringtohtml(o.toString()));
            }
        }
        System.out.println("rs");
        return rs;
    }

    /**
     * 获取request
     *
     * @return HttpServletRequest 对象
     */
    protected HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * 获取response
     *
     * @return HttpServletResponse 对象
     */
    protected HttpServletResponse getResponse() {
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
    }

    /**
     * 获取session
     *
     * @return
     */
    protected HttpSession getSession() {
        return getRequest().getSession();
    }

    /**
     * 获取页面传递的某一个参数值,
     */
    protected String getPara(String key) {
        return getRequest().getParameter(key);
    }

    /**
     * 获取页面传递的某一个数组值
     * date：2015-04-01
     * version：3.0v
     *
     * @return Class
     */
    protected String[] getParaValues(String key) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getParameterValues(key);
    }

    /**
     * 添加model公共方法
     *
     * @param baseService，实际由不同的Controller层传入不同的service
     * @param object，对应的model
     * @param pageNum，第几页
     * @param pageSize，每页数量
     * @return 以json形式返回给前端
     */
    public JSONObject add(BaseService<T> baseService, T object, String pageNum, String pageSize) {
        baseService.insert(object);
//        return search(baseService, pageNum, pageSize);
        Example example = new Example(object.getClass());
        String order = getPara("order");
        if (order == null || order.equals("")) {
            example.setOrderByClause("id desc");
        } else {
            example.setOrderByClause(order);
        }
        PageHelper.startPage(pageNum == null ? 1 : Integer.valueOf(pageNum), pageSize == null ? 10 : Integer.valueOf(pageSize));
        List<T> list = baseService.selectByExample(example);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return commonResponse(pageInfo, object);
    }

    /**
     * 删除model的公共方法，参数形式为｛jsonStr:{id:[1,2,3,xxx],pageNum:num,pageSize:size}｝
     *
     * @param baseService，实际由不同的Controller层传入不同的service
     * @param object，对应的model,此处的对象传递new                T()即可，目的是为了commonResponse方法中获取到对象的中英文属性名
     * @return 以json形式返回给前端
     */
    public JSONObject delete(BaseService<T> baseService, T object) {
        String jsonStr = getPara("jsonStr");
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);
        JSONArray jsonArray = jsonObject.getJSONArray("id");
        for (int i = 0; i < jsonArray.size(); i++) {
            baseService.deleteByPrimaryKey(jsonArray.getInt(i));
        }
        int pageNum = jsonObject.getInt("pageNum");
        int pageSize = jsonObject.getInt("pageSize");
        Example example = new Example(object.getClass());
        String order = getPara("order");
        if (order == null || order.equals("")) {
            example.setOrderByClause("id desc");
        } else {
            example.setOrderByClause(order);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<T> list = baseService.selectByExample(example);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return commonResponse(pageInfo, object);
    }

    /**
     * 修改model的公共方法
     *
     * @param baseService，实际由不同的Controller层传入不同的service
     * @param object，对应的model
     * @param pageNum，第几页
     * @param pageSize，每页数量
     * @return 以json形式返回给前端
     */
    public JSONObject modify(BaseService<T> baseService, T object, String pageNum, String pageSize) {
        baseService.updateByPrimaryKeySelective(object);
        Example example = new Example(object.getClass());
        String order = getPara("order");
        if (order == null || order.equals("")) {
            example.setOrderByClause("id desc");
        } else {
            example.setOrderByClause(order);
        }
        PageHelper.startPage(pageNum == null ? 1 : Integer.valueOf(pageNum), pageSize == null ? 10 : Integer.valueOf(pageSize));
        List<T> list = baseService.selectByExample(example);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return commonResponse(pageInfo, object);
    }

    /**
     * 分页查询的公共方法
     *
     * @param baseService，实际由不同的Controller层传入不同的service
     * @param object，对应的model，object中不为空的属性为查询条件，判等
     * @param offset，第几页
     * @param limit，每页数量
     * @return 以json形式返回给前端
     */
    public JSONObject search(BaseService<T> baseService, T object, Integer limit, Integer offset) {
        Example example = getEqualsToExample(object);
        PageHelper.startPage(offset, limit);
        List<T> list = baseService.selectByExample(example);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return commonResponse(pageInfo, object);
    }

    public JSONObject searchAll(BaseService<T> baseService, T object, String pageNum, String pageSize) {
        Example example = new Example(object.getClass());
        example.setOrderByClause("id desc");
        PageHelper.startPage(pageNum == null ? 1 : Integer.valueOf(pageNum), pageSize == null ? 10 : Integer.valueOf(pageSize));
        List<T> list = baseService.selectByExample(example);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return commonResponse(pageInfo, object);
    }

    /**
     * 获取object中不为空的属性相等的查询条件及order规则的Example
     *
     * @param object Object包含的不为空的属性为查询条件，判等
     * @return 返回带有查询条件约束和排序规则的Example
     */
    public Example getEqualsToExample(T object) {
        Example example = new Example(object.getClass());
        List<String> attributes = Common.getClassFieldsNameEn(object.getClass());
        Example.Criteria criteria = example.createCriteria();
        Field[] fields = object.getClass().getDeclaredFields();//获得属性
        try {
            for (Field field : fields) {
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(),
                        object.getClass());
                Method getMethod = pd.getReadMethod();//获得get方法
                Object attr = getMethod.invoke(object);//执行get方法返回一个Object
                if (attr != null && !attr.equals("")) {
                    criteria.andEqualTo(field.getName(), attr);
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /*增加排序*/
        String sortOrder = getPara("order");
        String sortName = getPara("sort");
        if (Common.isNotEmpty(sortOrder)) {
            if (Common.isNotEmpty(sortName)) {
                String columnName = Common.getClassFieldColumnName(object.getClass(), sortName);
                if (columnName != null) {
                    example.setOrderByClause(columnName + " " + sortOrder);
                } else
                    example.setOrderByClause("id " + sortOrder);
            } else
                example.setOrderByClause("id " + sortOrder);
        } else {
            example.setOrderByClause("id desc");
        }
        return example;
    }


    /**
     * 获取object中不为空的属性相等的查询条件及order规则的Example
     *
     * @param object Object包含的不为空的属性为查询条件，判等
     * @return 返回带有查询条件约束和排序规则的Example
     */
    public Example getEqualsToExample(Object object, Class<?> clazz) {
        Example example = new Example(clazz);
        List<String> attributes = Common.getClassFieldsNameEn(object.getClass());
        Example.Criteria criteria = example.createCriteria();
        Field[] fields = clazz.getDeclaredFields();//获得属性
        try {
            for (Field field : fields) {
                PropertyDescriptor pd = new PropertyDescriptor(field.getName(),
                        clazz);
                Method getMethod = pd.getReadMethod();//获得get方法
                Object attr = getMethod.invoke(object);//执行get方法返回一个Object
                if (attr != null && !attr.equals("")) {
                    criteria.andEqualTo(field.getName(), attr);
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (IntrospectionException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        /*增加排序*/
        String sortOrder = getPara("order");
        String sortName = getPara("sort");
        if (Common.isNotEmpty(sortOrder)) {
            if (Common.isNotEmpty(sortName)) {
                String columnName = Common.getClassFieldColumnName(clazz, sortName);
                if (columnName != null) {
                    example.setOrderByClause(columnName + " " + sortOrder);
                } else
                    example.setOrderByClause("id " + sortOrder);
            } else
                example.setOrderByClause("id " + sortOrder);
        } else {
            example.setOrderByClause("id desc");
        }
        return example;
    }


    /**
     * 对返回结果进行封装
     *
     * @param pageInfo，                           返回的页面数据，包括页面的基本信息和页面中的数据
     * @param object，表明返回的model类型，用于获取model的中英文属性
     * @return 以json返回封装的好的ResponseObject
     */
    public JSONObject commonResponse(PageInfo<T> pageInfo, T object) {
        List<String> headersEN = Common.getClassFieldsNameEn(object.getClass());
        List<String> headers = Common.getClassFieldsName(object.getClass());
        DataObject<T> dataObject = new DataObject<T>();
        dataObject.setHeadersEN(headersEN);
        dataObject.setHeaders(headers);
        dataObject.setRows(pageInfo.getList());

        String formJsonPath = getRequest().getServletContext().getRealPath("/framejson/" + object.getClass().getSimpleName().toLowerCase() + ".json");
        String jsonData = readFileDataToString(formJsonPath);
        if (jsonData == null) {/*不存在json文件的情况*/
            dataObject.setForm(JSONObject.fromObject("{}"));
        } else {
            JSONObject formJson = JSONObject.fromObject(jsonData);
            dataObject.setForm(formJson);
        }
        ResponseObject responseObject = new ResponseObject();
        responseObject.setData(dataObject);
        responseObject.setStatus(ResponseObject.SUCCESS);
        responseObject.setTotal(pageInfo.getTotal());
        System.out.println(JSONObject.fromObject(responseObject).toString());
        return JSONObject.fromObject(responseObject);
    }


    public String readFileDataToString(String filePath) {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), "UTF-8"));
            StringBuilder stringBuilder = new StringBuilder();
            String temp;
            while ((temp = bufferedReader.readLine()) != null) {
                stringBuilder.append(temp);
            }
            return stringBuilder.toString();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String saveFile(MultipartFile file, String rootPath) {
        if (!file.isEmpty()) {
            try {

                File filepath = new File(rootPath);
                if (!filepath.exists())
                    filepath.mkdirs();
                UUID uuid = UUID.randomUUID();
                FileCopyUtils.copy(file.getBytes(), new File(filepath + "/" + uuid.toString()));

                return filepath + "/" + uuid.toString();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        return null;
    }

    public String saveImage(MultipartFile file, String rootPath) {
        if (!file.isEmpty()) {
            try {
                String fileName = file.getOriginalFilename();
                File filepath = new File(rootPath);
                if (!filepath.exists())
                    filepath.mkdirs();
                UUID uuid = UUID.randomUUID();
                String newFilePath = filepath + "/" + uuid.toString() + fileName.substring(fileName.lastIndexOf("."));
                file.transferTo(new File(newFilePath));
                return newFilePath;
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        return null;
    }

    public void download(String fileName, String filePath, Integer id) {
        File file = new File(filePath);
        HttpServletResponse response = getResponse();
        try {
            BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
            response.reset();
            // 设置响应头，控制浏览器下载该文件
            response.setHeader("Content-Disposition", "attachment;filename="
                    + new String(fileName.replaceAll(" ", "").getBytes("utf-8"), "iso8859-1") + ";id=" + id);
            // 设置下载文件的大小
            response.addHeader("Content-Length", "" + file.length());
            // 设置文件ContentType类型，这样设置，会自动判断下载文件类型
            response.setContentType("application/octet-stream");
            //		response.setContentType("multipart/form-data");
            // 创建文件输入流
            FileInputStream in = new FileInputStream(file);
            // 创建文件输出流
            OutputStream out = response.getOutputStream(); // 浏览器下载
            //		out = new FileOutputStream("E:\\file\\out\\" + realName); // 本地下载
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            // 循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            // 刷新
            out.flush();
            //关闭文件输入流
            //关闭输出流
            out.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
