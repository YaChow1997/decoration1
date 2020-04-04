package cn.jit.dao;

import cn.jit.dto.MenuDto;
import cn.jit.po.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuDao {
    /*查询一级菜单*/
    public List<MenuDto> queryMenuByRoleId(@Param("roleId") Integer roleId);
    /*查询二级菜单根据以及菜单id*/
    public List<Menu> queryMenuByMenu1Id(List<Integer> menuIdList);
}
