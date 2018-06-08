package com.kang.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kang.ajax.AjaxProcess;

//기존 컨트롤러는 무조껀 패스를 지정하여 리턴하게 되어있으므로 페이지 이동이 일어남 그래서 Ajax를 쓸수 없어서 리턴값이 없는 AjaxProcess를 구현하는
//Ajax를 처리하는 부분을 따로 만들어 줬당...
@WebServlet(name = "ControllerAjax", urlPatterns = "*.ajax", initParams = @WebInitParam(name = "ajaxCommand", value = "/WEB-INF/ajaxCommand.properties"))
public class ControllerAJax extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	Map<String, AjaxProcess> ajaxMap = new HashMap<String, AjaxProcess>();

	@Override
	public void init() throws ServletException {

		
		//ajaxCommand.properties 파일의 위치를 서블릿 초기화 파라미터로 불러옴
		
		String ajaxCommand = getInitParameter("ajaxCommand");

		Properties prop = new Properties();

		FileInputStream fis = null;
		BufferedInputStream bis = null;

		try {
			// ajaxCommand.properties의 절대 경로를 구한다.
			String realPath = getServletContext().getRealPath(ajaxCommand);

			fis = new FileInputStream(realPath);
			bis = new BufferedInputStream(fis);

			/*
			 * 파일에 연결된 스트림 객체를 Properties 클래스의 load()의 인수로 지정하면 properties 파일에 저장된 String
			 * 데이터를 한 라인씩 읽어 첫 번째 오는 '=' 문자나 ':' 문자를 기준으로 key와 value로 저장해 준다.
			 **/
			prop.load(bis);

		} catch (IOException e) {
			throw new ServletException();

		} finally {
			try {
				// 보조 스트림을 먼저 닫고 기반 스트림을 닫는다.
				if (bis != null)
					bis.close();
				if (fis != null)
					fis.close();

			} catch (IOException ioe) {
			}
		}

		Iterator<Object> keyIter = prop.keySet().iterator();

		while (keyIter.hasNext()) {

			String command = (String) keyIter.next();
			String className = (String) prop.getProperty(command);

			try {
				
				Class<?> commandClass = Class.forName(className);

			
				AjaxProcess ajaxProcess = (AjaxProcess) commandClass.newInstance();

				ajaxMap.put(command, ajaxProcess);

			} catch (ClassNotFoundException e) {
				throw new ServletException();

			} catch (InstantiationException e) {
				throw new ServletException();

			} catch (IllegalAccessException e) {
				throw new ServletException();
			}
		}
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AjaxProcess ajaxProcess = null;
		String command = request.getRequestURI();
		System.out.println("request.getrequestURI : " + command);
		//url로 넘어온 패스가 커맨드 안에 있는지 조사
		if(command.indexOf(request.getContextPath()) == 0) {			
			command = command.substring(request.getContextPath().length());	
		}
		
		ajaxProcess = ajaxMap.get(command);
		System.out.println("command : " + command 
				+ ", commandPro : " + ajaxProcess);
		
		if(ajaxProcess != null) {
			ajaxProcess.ajaxProcess(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
}
