package cn.jit.controller;


import cn.jit.common.Result;
import cn.jit.dto.UserDto;
import cn.jit.po.User;
import cn.jit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RestController
@RequestMapping("/user")
public class UserCtrl extends BaseCtrl{
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public Result login  (@RequestParam(value = "name")String name, @RequestParam(value = "password",required = false)String password, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDto user= userService.loginFind(password,name);
        HttpSession session = request.getSession();
        if(user!=null){
            session.setAttribute("USER_SESSION",user);
            return this.send(true);
        }else{
            return this.send(false);
        }
    }

    @RequestMapping("/outLogin")
    public void exitLogin(HttpServletRequest request,HttpServletResponse response)throws IOException{
        HttpSession session=request.getSession();
        session.removeAttribute("USER_SESSION");
        response.sendRedirect("/decoration/pages/common/login.jsp");
    }

    @PostMapping("/register")
    public Result addUser(User user){
        user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
        user.setRoleId(1);
        user.setPicture("http://localhost:8080/internet/dist/img/no.jpg");
        int result=0;
        try {
            result = userService.addUser(user);
        }catch (Exception e){
            return this.send(-1,"注册失败");
        }
        if(result==0){
            return this.send(-1,"注册失败");
        }
        return this.send(null);
    }

    @GetMapping("/queryByUserId")
    public Result queryByUserId(@RequestParam(value = "id")Integer id){
        return this.send(userService.queryByUserId(id));
    }

    @GetMapping("/queryUserByName")
    public Result queryUserByName(@RequestParam(value = "name")String name){
        return this.send(userService.queryUserByName(name));
    }

}
