package jtech.shopzone.view.controller.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author Muhammed Mahrous
 */
public class UserSessionCheckerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        HttpSession httpSession = httpRequest.getSession();
        if (httpSession != null) {
            Boolean isLogged = (Boolean) httpSession.getAttribute("loggedIn");
            Boolean isAdmin = (Boolean) httpSession.getAttribute("isAdmin");

            if (isLogged != null && isLogged) {
                if(isAdmin!=null && isAdmin == true)
                {
                    httpServletResponse.sendRedirect("/adminHome.jsp");
                }
                else
                {
                    chain.doFilter(req,resp);
                }
            } else {
                httpServletResponse.sendRedirect("/signin.html");
            }

        } else {
            httpServletResponse.sendRedirect("/signin.html");
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
