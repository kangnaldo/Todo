package com.kang.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class CompleteAjax implements AjaxProcess {

	@Override
	public void ajaxProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int todono =Integer.parseInt(request.getParameter("todono"));
		boolean completion = Boolean.parseBoolean(request.getParameter("completion"));
		
		TodoDao dao = TodoDaoImpl.getInstance();
		dao.completionUpdate(todono, completion);
		boolean a = dao.completionSelect(todono);
		response.getWriter().println(a);
	}

}
