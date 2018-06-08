package com.kang.dao;

import java.util.ArrayList;

import com.kang.bean.Todo;
import com.kang.bean.User;

public interface TodoDao {
	public boolean userInsert(User user);//회원가입
	public User login(String id, String password);//로그인
	public int idCk(String id);//아이디 중복확인
	public boolean todoInsert(Todo todo);//투두인서트
	public ArrayList<Todo> todoList(String id);
	public Todo getTodoDetail(int todono);//상세보기
	public boolean todoUpdate(Todo todo);//수정
	public boolean completionUpdate(int todono, boolean completion);//완료 /미완료 체인지
	public boolean completionSelect(int todono);//완료 여부 검사
	public boolean tododelete(int todono);//투두 삭제
}
