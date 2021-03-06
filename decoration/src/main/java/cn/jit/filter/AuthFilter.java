package cn.jit.filter;

import cn.jit.dto.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
@WebFilter(filterName = "authFilter", urlPatterns = {"/*"})
@Component
public class AuthFilter implements Filter {

    @Value("${auth.openUrl}")
    private String openUrl;
    @Value("${spring.servlet.multipart.max-file-size}")
    private long maxFileSize;

    @Override
    public void init(FilterConfig args) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        String url = req.getRequestURI();
        UserDto user = (UserDto) session.getAttribute("USER_SESSION");// 登录人

        if (url.endsWith("login.jsp")
                || url.endsWith("register.jsp")
                || url.indexOf("/dist") != -1
                || url.indexOf("/bower_components/") != -1
                || url.indexOf("/js/") != -1
                || url.indexOf("/css/") != -1
                || url.indexOf("/fonts/") != -1
                || url.indexOf("/img/") != -1
                || url.indexOf("/user/") != -1
                || url.indexOf("/common/") != -1
                || url.indexOf("active") != -1) {
            chain.doFilter(request, response);
        } else {
            if (user == null) {
                res.sendRedirect(req.getContextPath()+"/pages/common/login.jsp");
            }else{
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {

    }

}


