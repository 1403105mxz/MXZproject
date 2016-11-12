package interceptor;

/**
 * Created by dell on 2016/11/10.
 */
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        String path = servletRequest.getRequestURI();
        String user = (String) session.getAttribute("newusername");
        String NoFilter_Pages[] = {"/index.jsp", "/findanswer.jsp", "/findpassword.jsp", "/logsuccess.jsp", "/signin.jsp",
                "/signinsuccess.jsp", "/error.jsp" , "/editpassword.jsp" , "/login.jsp", "Login.action", "Signin.action",
                "Findpassword.action", "Editpassword.action", "Findanswer.action"};

        Boolean judge = false;
        for (int i = 0; i < NoFilter_Pages.length; i++) {

            if (path.indexOf(NoFilter_Pages[i]) > -1 && judge == false) {
                judge = true;
            }
        }

        if (judge == true) {

            if (user == null || "".equals(user)) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            } else {
                servletResponse.sendRedirect("operationIndex.jsp");
            }
        }
        else{
            if (user == null || "".equals(user)) {
                servletResponse.sendRedirect("index.jsp");
            } else {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }
        }


    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

}