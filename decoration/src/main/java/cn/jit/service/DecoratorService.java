package cn.jit.service;

import cn.jit.dao.DecoratorDao;
import cn.jit.po.Decorator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DecoratorService {
    @Autowired
    private DecoratorDao decoratorDao;

    @Transactional
    public Decorator addDecorator(Decorator decorator){
        decoratorDao.addDecorator(decorator);
        return decorator;
    }

    @Transactional
    public int updateDecorator(Decorator decorator){
        return decoratorDao.updateDecorator(decorator);
    }
    public Decorator queryDecoratorByName(String name){
        return decoratorDao.queryDecoratorByName(name);
    }

    /**
     * 查询装修团队信息
     * @param params
     * @return
     */
    public Map<String, Object> queryDecorators(Map<String,Object> params){
        Integer pageNumber=(Integer) params.get("pageNumber");
        Integer pageSize=(Integer) params.get("pageSize");
        params.put("isDelete","0");
        PageHelper.startPage(pageNumber,pageSize);
        List<Decorator> DecoratorList=decoratorDao.queryDecorators(params);
        PageInfo pageInfo=new PageInfo(DecoratorList);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("size",pageInfo.getSize());
        map.put("data",DecoratorList);
        return map;
    }
    @Transactional
    public List<Decorator> queryAllDecorators(){
        return decoratorDao.queryAllDecorators(null);
    }

    @Transactional
    public Decorator queryDecoratorById(int id){
        return decoratorDao.queryDecoratorById(id);
    }

    @Transactional
    public Decorator queryDecoratorByUserId(int userId){
        return decoratorDao.queryDecoratorByUserId(userId);
    }

    @Transactional
    public int updateDecoratorByUserId(Decorator decorator){return decoratorDao.updateDecoratorByUserId(decorator);};
}
