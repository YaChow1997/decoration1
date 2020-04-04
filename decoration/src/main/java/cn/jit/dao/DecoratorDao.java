package cn.jit.dao;

import cn.jit.po.Decorator;

import java.util.List;
import java.util.Map;

public interface DecoratorDao {
    public int addDecorator(Decorator decorator);

    public int updateDecorator(Decorator decorator);

    public int updateDecoratorByUserId(Decorator decorator);

    public Decorator queryDecoratorByName(String name);

    public List<Decorator> queryDecorators(Map<String, Object> params);

    public List<Decorator> queryAllDecorators(Decorator decorator);

    public Decorator queryDecoratorById(Integer id);

    public Decorator queryDecoratorByUserId(Integer userId);
}
