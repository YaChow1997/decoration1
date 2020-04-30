package cn.jit.controller;

import cn.jit.common.Result;
import cn.jit.dto.UserDto;
import cn.jit.po.Decorator;
import cn.jit.po.Design;
import cn.jit.po.Process;
import cn.jit.po.User;
import cn.jit.service.DecoratorService;
import cn.jit.service.DesignService;
import cn.jit.service.ProcessService;
import cn.jit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/decorator")
public class DecoratorCtrl  extends BaseCtrl{
    @Autowired
    private DecoratorService decoratorService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProcessService processService;
    @Autowired
    private DesignService designService;
    @PostMapping("/addDecorator")
    public Result addDecorator(Decorator decorator, HttpServletRequest request){
            if(decoratorService.queryDecoratorByName(decorator.getName())!=null){
                return this.send(-1,"该装修团队已添加列表");
            }

            decoratorService.addDecorator(decorator);

            User user=new User();
            user.setName(decorator.getName());
            user.setPhone(decorator.getPhone());
            userService.updateUserByName(user);
            return this.send(null);
    }

    @RequestMapping("/queryDecorators")
    public Result queryDecorators(@RequestParam("pageNumber")Integer pageNumber,
                               @RequestParam("pageSize")Integer pageSize,
                               @RequestParam(value = "name",required = false)String name,
                               @RequestParam(value = "status",required = false)String status){
        Map<String,Object> params=new HashMap<>();
        params.put("pageNumber",pageNumber);
        params.put("pageSize",pageSize);
        params.put("name",name);
        params.put("status",status);
        return this.send(decoratorService.queryDecorators(params));
    }

    @RequestMapping("/updateDecorator")
    public Result updateDecorator(Decorator decorator){
        return this.send(decoratorService.updateDecorator(decorator));
    }

    @RequestMapping("/queryProcessesByDecoratorId")
    public Result queryProcessesByDecoratorId(@RequestParam("pageNumber")Integer pageNumber,
                                              @RequestParam("pageSize")Integer pageSize,
                                              HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        Map<String,Object> params=new HashMap<>();
        params.put("pageNumber",pageNumber);
        params.put("pageSize",pageSize);
        params.put("decoratorId",userDto.getId());
        return this.send(processService.queryProcessesByDecoratorId(params));
    }
    @RequestMapping("/queryProcessesByDecoratorId1")
    public Result queryProcessesByDecoratorId1(@RequestParam("pageNumber")Integer pageNumber,
                                              @RequestParam("pageSize")Integer pageSize,
                                              HttpSession session){
        UserDto userDto= (UserDto) session.getAttribute("USER_SESSION");
        Map<String,Object> params=new HashMap<>();
        params.put("pageNumber",pageNumber);
        params.put("pageSize",pageSize);
        params.put("decoratorId",userDto.getId());
        return this.send(processService.queryProcessesByDecoratorId1(params));
    }


    @PostMapping("/addDesign")
    public Result addDesign(Design design){
        if(designService.queryDesignByClientId(design.getClientId())!=null){
            return this.send(-1,"该用户装修方案已存在");
        }
        designService.addDesign(design);
        return this.send(1,"提交方案成功！");
    }
}
