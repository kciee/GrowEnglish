package growenglish.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
<<<<<<< HEAD
=======
        // không cần xử lý gì ở đây
>>>>>>> e18aefb (update)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
<<<<<<< HEAD
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
=======

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

>>>>>>> e18aefb (update)
        HttpSession session = req.getSession(false);
        Object userObj = (session != null) ? session.getAttribute("user") : null;

        if (userObj == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
<<<<<<< HEAD
        if (userObj instanceof growenglish.model.User user) {
            if (!"admin".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/403.jsp");
=======

        if (userObj instanceof growenglish.model.User user) {
            if (!"admin".equalsIgnoreCase(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/403.jsp"); // Không có quyền
>>>>>>> e18aefb (update)
                return;
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }
<<<<<<< HEAD
        chain.doFilter(request, response);
=======

        chain.doFilter(request, response); // Cho phép tiếp tục
>>>>>>> e18aefb (update)
    }

    @Override
    public void destroy() {
<<<<<<< HEAD
=======
        // không cần xử lý gì ở đây
>>>>>>> e18aefb (update)
    }
}
