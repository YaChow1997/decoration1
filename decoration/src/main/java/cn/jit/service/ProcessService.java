package cn.jit.service;

import cn.jit.dao.ProcessDao;
import cn.jit.dto.ProcessDto;
import cn.jit.po.Process;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProcessService {
    @Autowired
    private ProcessDao processDao;

    @Transactional
    public int updateProcess(Process process){
        return processDao.updateProcess(process);
    };

    @Transactional
    public int updateByClientId(Process process){return processDao.updateByClientId(process);};

    @Transactional
    public Process queryByDecoratorId(Integer id){
        return processDao.queryByDecoratorId(id);
    };

    @Transactional
    public Process queryByDecoratorId1(Integer id){
        return processDao.queryByDecoratorId1(id);
    };

    @Transactional
    public Process queryByClientId(Integer id){
        return processDao.queryByClientId(id);
    };

    @Transactional
    public int addProcess(Process process){return processDao.addProcess(process);};

    @Transactional
    public Map<String, Object> queryProcessesByDecoratorId(Map<String,Object> params){
        Integer pageNumber=(Integer) params.get("pageNumber");
        Integer pageSize=(Integer) params.get("pageSize");
        Integer decoratorId=(Integer)params.get("decoratorId");
        PageHelper.startPage(pageNumber,pageSize);
        List<ProcessDto> ProcessList=processDao.queryProcessesByDecoratorId(decoratorId);
        PageInfo pageInfo=new PageInfo(ProcessList);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("size",pageInfo.getSize());
        map.put("data",ProcessList);
        return map;
    }

    @Transactional
    public Map<String, Object> queryProcessesByDecoratorId1(Map<String,Object> params){
        Integer pageNumber=(Integer) params.get("pageNumber");
        Integer pageSize=(Integer) params.get("pageSize");
        Integer decoratorId=(Integer)params.get("decoratorId");
        PageHelper.startPage(pageNumber,pageSize);
        List<ProcessDto> ProcessList=processDao.queryProcessesByDecoratorId1(decoratorId);
        PageInfo pageInfo=new PageInfo(ProcessList);
        Map<String,Object> map=new HashMap<>();
        map.put("total",pageInfo.getTotal());
        map.put("size",pageInfo.getSize());
        map.put("data",ProcessList);
        return map;
    }
}
