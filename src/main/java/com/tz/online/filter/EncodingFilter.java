package com.tz.online.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(urlPatterns="/*",initParams={
		@WebInitParam(name="encoding",value="utf-8"),
		@WebInitParam(name="contentType",value="text/html;charset=utf-8")
		})
public class EncodingFilter implements Filter{
	private String encoding;
	private String contentType;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		req.setCharacterEncoding(encoding);
		resp.setContentType(contentType);
		arg2.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig cfg) throws ServletException {
		encoding=cfg.getInitParameter("encoding");
		contentType=cfg.getInitParameter("contentType");
		
	}

}
