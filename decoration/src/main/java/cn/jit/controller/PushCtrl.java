package cn.jit.controller;

import cn.jit.common.Result;
import cn.jit.common.SocketMsg;
import cn.jit.common.WebSocketPushHandler;
import cn.jit.dto.MassageDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PushCtrl extends BaseCtrl {
    @Autowired
    private WebSocketPushHandler webSocketPushHandler;
    @PostMapping("/push")
    public Result test( MassageDto massageDto){
        SocketMsg msg = new SocketMsg();
        msg.setType("pushdata");
        msg.setData(massageDto);
        webSocketPushHandler.sendMessagesToUsers(msg);
        return this.send(1,"成功");
    }
}
