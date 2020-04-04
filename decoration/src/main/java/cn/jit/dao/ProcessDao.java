package cn.jit.dao;

import cn.jit.dto.ProcessDto;
import cn.jit.po.Process;

import java.util.List;

public interface ProcessDao {
    public int addProcess(Process process);
    public int updateProcess(Process process);
    public int updateByClientId(Process process);
    public List<ProcessDto> queryProcessesByDecoratorId(Integer decoratorId);

    public Process queryByDecoratorId(Integer id);
    public Process queryByDecoratorId1(Integer id);

    public Process queryByClientId(Integer id);
}
