package cn.ac.bcc.service.base;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

/**
 * Created by lifm on 2016/2/1.
 */
@Service
public abstract class BaseService<T> {
    @Autowired
    protected Mapper<T> mapper;


    public int insert(T entity) {
        return mapper.insert(entity);
    }

    public int insertSelective(T record) {
        return mapper.insertSelective(record);
    }

    public int delete(T record) {
        return mapper.delete(record);
    }

    public int deleteByExample(Object example) {
        return mapper.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Object key) {
        return mapper.deleteByPrimaryKey(key);
    }

    public List<T> select(T record) {
        return mapper.select(record);
    }

    public List<T> selectAll() {
        return mapper.selectAll();
    }

    public T selectByPrimaryKey(Object key) {
        return mapper.selectByPrimaryKey(key);
    }

    public List<T> selectByExample(Example example) {
        return mapper.selectByExample(example);
    }

    public List<T> selectByExampleAndRowBounds(Object example, RowBounds rowBounds) {
        return mapper.selectByExampleAndRowBounds(example, rowBounds);
    }

    public List<T> selectByRowBounds(T record, RowBounds rowBounds) {
        return mapper.selectByRowBounds(record, rowBounds);
    }

    public int selectCount(T record) {
        return mapper.selectCount(record);
    }

    public int selectCountByExample(Object example) {
        return mapper.selectCountByExample(example);
    }

    public T selectOne(T record){
        return mapper.selectOne(record);
    }

    public int updateByExample(T record, Object example){
        return mapper.updateByExample(record, example);
    }

    public int updateByExampleSelective(T record, Object example) {
        return mapper.updateByExampleSelective(record, example);
    }

    public int updateByPrimaryKey(T record) {
        return mapper.updateByPrimaryKey(record);
    }

    public int updateByPrimaryKeySelective(T record) {
        return mapper.updateByPrimaryKeySelective(record);
    }

    public PageInfo<T> selectByPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<T> list = mapper.selectAll();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return pageInfo;
    }

    public PageInfo<T> selectByPage(String pageNum, String pageSize) {
        return selectByPage(pageNum == null ? 1 : Integer.valueOf(pageNum), pageSize == null ? 10 : Integer.valueOf(pageSize));
    }


}
