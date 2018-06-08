package com.kang.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kang.bean.Todo;
import com.kang.bean.User;
import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class TodoListService implements CommandProcess {

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		TodoDao dao = TodoDaoImpl.getInstance();
		ArrayList<Todo> list = dao.todoList(user.getId()); 
		request.setAttribute("todoList", list);
		ForwardService forward = new ForwardService();
		forward.setPath("/WEB-INF/views/todoList.jsp");
		return forward;
		
	}

}
