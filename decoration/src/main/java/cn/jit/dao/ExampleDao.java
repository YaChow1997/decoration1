package cn.jit.dao;

import cn.jit.po.Example;

import java.util.List;
import java.util.Map;

public interface ExampleDao {
    public int updateExample(Example example);
    public List<Example> queryExamples(Map<String,Object> params);

    public List<Example> queryAllExamples(Example example);

    public Example getContent(int id);
}
