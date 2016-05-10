package com.aichi.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
//在请求处理的方法之前执行
//如果返回true那么执行下一个拦截器，如果false不执行下个拦截器
//Object handler表示的是被拦截的请求的目标对象 	
public class LoginInterceptor implements HandlerInterceptor{
	//允许哪些url不被拦截，哪些需要被拦截
	private List<String> allowedPass; 

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI().toString();
		System.out.println("------------"+url);
		//先判断session里面是否有
		Object customer = request.getSession().getAttribute("customer");
		if(customer!=null){
			System.out.println(customer);
			return true;
		}
		for(String temp:allowedPass){
			if(url.endsWith(temp)){
				if("/aichi/receiver_info".equals(url)){
					System.out.println("11111111111111111");
					request.setAttribute("needLogin", 1);
					request.getRequestDispatcher("/product.jsp").forward(request, response);;
					
					return false;
				}
				return true;
			}
		}
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	public void setAllowedPass(List<String> allowedPass) {
		this.allowedPass = allowedPass;
	}
}
