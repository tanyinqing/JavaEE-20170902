package demo.util;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * 编码过滤器
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {
    @Override //初始化
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override //
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // jsp  默认iso-8859-1
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
