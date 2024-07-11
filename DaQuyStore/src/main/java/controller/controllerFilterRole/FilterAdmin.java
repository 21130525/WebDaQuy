package controller.controllerFilterRole;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/views/admin/*")
public class FilterAdmin implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        if (session == null && session.getAttribute("user") != null && session.getAttribute("user").equals("admin")) {
            request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
        } else {
            filterChain.doFilter(request, response);
        }


    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
