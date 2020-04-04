package cn.jit.service;

import cn.jit.dao.ExampleDao;
import cn.jit.po.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExampleService {
    @Autowired
    private ExampleDao exampleDao;
    @Transactional
    public int updateExample(Example example){
        return exampleDao.updateExample(example);
    }

    public Map<String,Object> queryExamples(Map<String,Object> params){
        Integer pageNumber=(Integer) params.get("pageNumber");
        Integer pageSize=(Integer) params.get("pageSize");
        params.put("isDelete","0");
        PageHelper.startPage(pageNumber,pageSize);
        List<Example> ExampleList=exampleDao.queryExamples(params);
        PageInfo pageInfo=new PageInfo(ExampleList);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("size",pageInfo.getSize());
        map.put("data",ExampleList);
        return map;
    }

    @Transactional
    public List<Example> queryAllExamples(){
        return exampleDao.queryAllExamples(null);
    }

    @Transactional
    public Example getContent(int id){
        return exampleDao.getContent(id);
    }
}
