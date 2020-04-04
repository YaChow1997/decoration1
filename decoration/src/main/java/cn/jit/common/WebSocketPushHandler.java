package cn.jit.common;

import cn.jit.dto.UserDto;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 消息处理类
 * @author ts
 *
 */
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

    //用户退出后的处理，不如退出之后，要将用户信息从websocket的session中remove掉，这样用户就处于离线状态了，也不会占用系统资源
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
    public void sendMessagesToUsers(TextMessage message, HttpSession session){
        UserDto sessionUser= (UserDto) session.getAttribute("USER_SESSION");
        for(WebSocketSession user : users){
            if(!user.getAttributes().get("CURRENT_WEBSOCKET_USER").equals(sessionUser.getId())) {
                try {
                    //isOpen()在线就发送
                    if (user.isOpen()) {
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * 发送消息给指定的用户
     */
    public void sendMessageToUser(Integer userId,TextMessage message){
        for(WebSocketSession user : users){
            if(user.getAttributes().get("CURRENT_WEBSOCKET_USER").equals(userId)){
                try {
                    //isOpen()在线就发送
                    if(user.isOpen()){
                        user.sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
