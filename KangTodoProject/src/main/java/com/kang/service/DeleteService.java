package com.kang.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class DeleteService implements CommandProcess {

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int todono = Integer.parseInt(request.getParameter("todono"));
		TodoDao dao = TodoDaoImpl.getInstance();
		dao.tododelete(todono);
		ForwardService forward = new ForwardService();
		forward.setPath("todolist.do");
		return forward;
	}

}
