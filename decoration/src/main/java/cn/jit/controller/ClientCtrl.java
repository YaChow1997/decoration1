package cn.jit.controller;

import cn.jit.common.Result;
import cn.jit.common.ScocketMsg;
import cn.jit.common.WebSocketPushHandler;
import cn.jit.dto.ManageClientDto;
import cn.jit.dto.UserDto;
import cn.jit.po.Client;
import cn.jit.po.Process;
import cn.jit.po.User;
import cn.jit.service.ClientService;
import cn.jit.service.ProcessService;
import cn.jit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/client")
public class ClientCtrl  extends BaseCtrl{
    @Autowired
    private ClientService clientService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProcessService processService;
    @Autowired
    private WebSocketPushHandler webSocketPushHandler;
    /**
     * 添加客户
     * @param manageClientDto
     * @param request
     * @return
     */
    @PostMapping("/addClient")
    public Result addClient(ManageClientDto manageClientDto, HttpServletRequest request){
        if(clientService.queryClientByUserId(manageClientDto.getUserId())!=null){
            return this.send(-1,"该用户已添加至客户列表");
        }
        Client client=new Client();
        client.setAddress(manageClientDto.getAddress());
        client.setStatus(manageClientDto.getStatus());
        client.setUserId(manageClientDto.getUserId());
        clientService.addClinet(client);

        User user=new User();
        user.setId(manageClientDto.getUserId());
        user.setPhone(manageClientDto.getPhone());
        userService.updateUser(user);

        return this.send(null);
    }
//查看所有客户
    @RequestMapping("/queryClients")
    public Result queryClients(@RequestParam("pageNumber")Integer pageNumber,
                                @RequestParam("pageSize")Integer pageSize,
                                @RequestParam(value = "name",required = false)String name,
                                @RequestParam(value = "status",required = false)String status){
        Map<String,Object> params=new HashMap<>();
        params.put("pageNumber",pageNumber);
        params.put("pageSize",pageSize);
        params.put("name",name);
        params.put("status",status);
        return this.send(clientService.queryClients(params));
    }

    @RequestMapping("/updateClient")
    public Result updateClient(Client client){
        return this.send(clientService.updateClient(client));
    }

    @PostMapping("/reserve")
    public Result reserve(Process process){
        if(processService.queryByClientId(process.getClientId())!=null){
            return this.send(-1,"已经预约，请等待");
        }
        User user=userService.queryByUserId(process.getClientId());
        ScocketMsg msg = new ScocketMsg();
        msg.setType("reservedata");
        msg.setData(user.getName());
        webSocketPushHandler.sendMessageToUser(process.getDecoratorId(),msg);
        processService.addProcess(process);
        return this.send(null);
    }

}
