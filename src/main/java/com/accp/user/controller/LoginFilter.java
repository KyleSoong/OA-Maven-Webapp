package com.accp.user.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.accp.user.model.User;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hsq = (HttpServletRequest) req;
		User u = (User) hsq.getSession().getAttribute("loginUser");
		if (u == null && !hsq.getRequestURI().contains("/index")
				&& !hsq.getRequestURI().contains("/login")
				&& !hsq.getRequestURI().contains("/resources/")) {
			((HttpServletResponse) resp).sendRedirect(hsq.getContextPath()
					+ "/index");
		}
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
