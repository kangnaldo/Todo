package com.kang.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class IdCheckAjax implements AjaxProcess{

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); 
		response.getWriter();
		String id = request.getParameter("id");
		TodoDao dao = TodoDaoImpl.getInstance();
		
		int ck = dao.idCk(id);
		
		response.getWriter().print(ck);
	}

}
