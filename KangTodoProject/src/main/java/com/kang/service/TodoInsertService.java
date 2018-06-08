package com.kang.service;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kang.bean.Todo;
import com.kang.bean.User;
import com.kang.dao.TodoDao;
import com.kang.dao.TodoDaoImpl;

public class TodoInsertService implements CommandProcess {

	@Override
	public ForwardService getRequestService(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String id = user.getId();
		String todoSubject = request.getParameter("todosubject");
		String todoContent = request.getParameter("todocontent");
		int cano = Integer.parseInt(request.getParameter("cano"));
		String todostartdate =  request.getParameter("startdate");
		String todoenddate = request.getParameter("enddate");
		Todo todo = new Todo();
		todo.setId(id);
		todo.setTodoSubject(todoSubject);
		todo.setTodoContent(todoContent);
		todo.setCano(cano);
		todo.setTodostartdate(todostartdate);
		todo.setTodoenddate(todoenddate);
		
		TodoDao dao = TodoDaoImpl.getInstance();
		boolean a = dao.todoInsert(todo);
		/**/
		
		
		ForwardService forward = new ForwardService();
		forward.setRedirect(true);
		forward.setPath("http://localhost:8081/KangTodoProject/index.do");
		return forward;
	}

}
