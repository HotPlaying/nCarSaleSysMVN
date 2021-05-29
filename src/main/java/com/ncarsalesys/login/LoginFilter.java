package com.ncarsalesys.login;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class LoginFilter implements Filter {

    private String sessionKey;
    private String redirectUrl;
    private String uncheckedUrls;
    private String customerUrls;
    private String salesmanUrls;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext servletContext = filterConfig.getServletContext();
        // 获取XML文件中配置参数
        sessionKey = servletContext.getInitParameter("userSessionKey");
        redirectUrl = servletContext.getInitParameter("redirectPage");
        uncheckedUrls = servletContext.getInitParameter("uncheckedUrls");
        customerUrls = servletContext.getInitParameter("customerUrls");
        salesmanUrls = servletContext.getInitParameter("salesmanUrls");
        System.out.println("redirectPage======" + redirectUrl);// 调试用
        // System.out.println("sessionKey======" + sessionKey);
        // System.out.println("uncheckedUrls=====" + uncheckedUrls);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        // 1.获取请求URL
        String servletPath = httpRequest.getServletPath();
        System.out.println(servletPath);
        // 2.检测1中获取的servletPath是否为不需要检测的URl中的一个.若是,放行
        List<String> urls = Arrays.asList(uncheckedUrls.split(","));
        if (urls.contains(servletPath)) {
            filterChain.doFilter(httpRequest, httpResponse);
            return;
        }
        // 3.从session中获取SessionKey对应值,若值不存在,则重定向到redirectUrl
        Object usertype = httpRequest.getSession().getAttribute("userType");
        System.out.println("userType=" + usertype);
        if ((usertype == null)) {
            httpRequest.getSession().setAttribute("alert", "请先登录后再访问&nbsp;&nbsp;&nbsp;<a href=\"loginPage.jsp\">登录页面</a>");
            httpResponse.sendRedirect(httpRequest.getContextPath() + redirectUrl);
            return;
        } else {
            if ((usertype.equals("2"))) {
                filterChain.doFilter(httpRequest, httpResponse);
                return;
            } else {
                if ((usertype.equals("0"))) {
                    List<String> urls1 = Arrays.asList(customerUrls.split(","));
                    urls = urls1;
                }
                if ((usertype.equals("1"))) {
                    List<String> urls2 = Arrays.asList(salesmanUrls.split(","));
                    urls = urls2;
                }

            }
            // 4.若存在且url与用户类型对应,则放行
            if (urls.contains(servletPath)) {
                filterChain.doFilter(httpRequest, httpResponse);
                return;
            } else {
                httpRequest.getSession().setAttribute("alert", "你所在的用户组没有权限访问该页面");
                httpResponse.sendRedirect(httpRequest.getContextPath() + redirectUrl);
            }
        }

    }

    @Override
    public void destroy() {
    }

}
