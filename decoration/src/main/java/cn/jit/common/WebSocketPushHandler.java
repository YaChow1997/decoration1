package cn.jit.common;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;
import com.alibaba.fastjson.JSON;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class WebSocketPushHandler implements WebSocketHandler {

    private static final List<WebSocketSession> users = new ArrayList<>();
    //用户进入系统监听
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("成功进入了系统。。。");
        users.add(session);
    }
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
    }
    //后台错误信息处理方法
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        users.remove(session);
        System.out.println("安全退出了系统");
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 给所有的用户发送消息
     */
    public void sendMessagesToUsers(SocketMsg message){
        String jsonString = JSON.toJSONString(message);
        for (WebSocketSession session : users) {
            try {
                session.sendMessage(new TextMessage(jsonString));
            } catch (IOException e) {
                continue;
            }
        }
    }

    /*
    给指定用户发消息
     */
    public void sendMessageToUser(Integer userId, SocketMsg message){
        String jsonString = JSON.toJSONString(message);
        for(WebSocketSession user : users){
            if(user.getAttributes().get("CURRENT_WEBSOCKET_USER").equals(userId)){
                try {
                    //isOpen()在线就发送
                    if(user.isOpen()){
                        user.sendMessage(new TextMessage(jsonString));
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
