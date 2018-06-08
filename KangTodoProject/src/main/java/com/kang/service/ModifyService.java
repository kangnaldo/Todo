package com.kang.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.bean.Todo;
import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class ModifyService implements CommandProcess {

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int todono = Integer.parseInt(request.getParameter("todono"));
		String todoSubject = request.getParameter("todoSubject");
		String todoContent = request.getParameter("todoContent");
		int cano = Integer.parseInt(request.getParameter("cano"));
		String todostartdate = request.getParameter("startdate");
		String todoenddate =request.getParameter("enddate");
		
		Todo todo = new Todo();
		todo.setTodono(todono);
		todo.setTodoSubject(todoSubject);
		todo.setTodoContent(todoContent);
		todo.setCano(cano);
		todo.setTodostartdate(todostartdate);
		todo.setTodoenddate(todoenddate);
		
		TodoDao dao = TodoDaoImpl.getInstance();
		boolean ck = dao.todoUpdate(todo);
		
		ForwardService forward = new ForwardService();
		forward.setPath("todolist.do");
		return forward;
	}

}
