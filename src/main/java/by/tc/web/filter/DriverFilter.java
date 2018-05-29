package by.tc.web.filter;

import javax.servlet.*;
import java.io.IOException;

public class DriverFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) servletRequest;
//        HttpServletResponse resp = (HttpServletResponse) servletResponse;
//        HttpSession session = req.getSession(false);
//
//
//        User user = (User) session.getAttribute(ControllerConstants.USER_ROLE);
//        if (user == null || user.getClass() == Driver.class) {
//            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
//        } else {
//            filterChain.doFilter(servletRequest, servletResponse);
//        }
    }

    @Override
    public void destroy() {

    }
}
