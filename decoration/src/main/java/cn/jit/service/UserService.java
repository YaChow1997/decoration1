package cn.jit.service;

import cn.jit.dao.UserDao;
import cn.jit.dto.UserDto;
import cn.jit.po.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public User queryPhone(String phone){
        return userDao.queryPhone(phone);
    }


    public UserDto loginFind (String password, String name){
        UserDto user=userDao.queryByName(name);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }else{
            return null;
        }
    }


    @Transactional
    public int addUser(User user){
        return userDao.addUser(user);
    }

    /**
     * 查询所有客户
     * @param user
     * @return
     */
    public Map<String,Object> queryAll(User user, Integer pageNumber, Integer pageSize){
        PageHelper.startPage(pageNumber, pageSize);
        List<UserDto> userDtoList=userDao.queryAll(user);
        PageInfo pageInfo=new PageInfo(userDtoList);
        Map<String,Object> result=new HashMap<>();
        result.put("data",userDtoList);
        result.put("total",pageInfo.getTotal());
        result.put("size",userDtoList.size());
        return result;
    }

    /**
     * 删除员工信息
     * @param email
     * @return
     */
    @Transactional
    public int deleteUser (String email){
        return userDao.deleteUser(email);
    }

    @Transactional
    public int updateUser(User user){
        return userDao.updateUser(user);
    }

    @Transactional
    public String updateUserByName(User user){ return userDao.updateUserByName(user); }
    /**
     * 查询所有用户
     * @return
     */
    public List<User> queryAllUsers(User user){
        return userDao.queryAllUsers(user);
    }
    /**
     * 通过id查询用户
     */
    public User queryByUserId(Integer id){
        return userDao.queryByUserId(id);
    }

    /**
     * 通过姓名查用户
     * @param name
     * @return
     */
    public UserDto queryUserByName(String name){return userDao.queryByName(name);}
}
