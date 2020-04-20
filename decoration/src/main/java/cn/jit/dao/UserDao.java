package cn.jit.dao;

import cn.jit.dto.UserDto;
import cn.jit.po.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    public User queryPhone(String phone);

    public int addUser(User user);

    public List<UserDto> queryAll(User user);

    public int deleteUser(String email);

    public int updateUser(User user);

    public String updateUserByName(User user);

    public List<User> queryAllUsers(User user);

    public User queryByUserId(Integer id);

    public UserDto queryByName(@Param("name") String name);
}
