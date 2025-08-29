package com.sms.configration;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.sms.entity.Department;

@WebFilter(urlPatterns = {"/Admin/*", "/Admission/*", "/Fees/*", "/Result/*", "/Scholarship/*"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("department") == null || ((Department)session.getAttribute("department")).getUsername() == null) {
            res.sendRedirect(req.getContextPath() + "/loginpage");
            return;	
        }

        chain.doFilter(request, response);
    }


}
