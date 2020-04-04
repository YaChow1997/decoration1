package cn.jit.service;

import cn.jit.dao.MenuDao;
import cn.jit.dto.MenuDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuService {
    @Autowired
    private MenuDao menuDao;
    /**
     * 通过角色id查询菜单
     * @param roleId
     * @return
     */
    public List<MenuDto> queryMenuByRoleId(Integer roleId){
        /*一级菜单*//*
        List<MenuDto> menuDtoList=menuDao.queryMenuByRoleId(roleId);
        *//*一级菜单id*//*
        List<Integer> menu1IdList=new ArrayList<>();
        for(MenuDto menuDto:menuDtoList){

            menu1IdList.add(menuDto.getId());
        }
        *//*二级菜单*//*
        List<Menu> menu2DtoList=menuDao.queryMenuByMenu1Id(menu1IdList);
        for(MenuDto menuDto:menuDtoList){
            *//*每个一级菜单下的二级菜单*//*
            List<Menu> menuList=new ArrayList<>();
            for(Menu menu:menu2DtoList){
                *//*父菜单的子菜单*//*
                if(menu.getParentId().equals(menuDto.getId())){
                    menuList.add(menu);
                }
            }
            menuDto.setMenuList(menuList);
        }*/
        /*用户可访问的菜单*/
        List<MenuDto> menuDtoList=menuDao.queryMenuByRoleId(roleId);
        /*一级菜单*/
        List<MenuDto> parentsMenuList=new ArrayList<>();
        for(MenuDto menuDto:menuDtoList){
            if(menuDto.getParentId().equals(0)){
                parentsMenuList.add(menuDto);
            }
        }
        for(MenuDto parentMenu:parentsMenuList){
            List<MenuDto> menuDtos=new ArrayList<>();
            for(MenuDto menuDto:menuDtoList){
                if(menuDto.getParentId().equals(parentMenu.getId())){
                    menuDtos.add(menuDto);
                }
            }
            parentMenu.setMenuDtoList(menuDtos);
        }
        return parentsMenuList;
    }
}
