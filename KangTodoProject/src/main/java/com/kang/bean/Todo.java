package com.kang.bean;

import java.sql.Timestamp;

public class Todo {
	private int todono; // 자동
    private String id; // 자동
    private String todoSubject;
    private String todoContent;
    private int cano;
    private Timestamp createtododate; //자동
    private String todostartdate;
    private String todoenddate;
    private boolean completion;
    //해야할일 불리언 처리
    
    public int getTodono() {
		return todono;
	}
	public boolean isCompletion() {
		return completion;
	}
	public void setCompletion(boolean completion) {
		this.completion = completion;
	}
	public void setTodono(int todono) {
		this.todono = todono;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getTodoSubject() {
		return todoSubject;
	}
	public void setTodoSubject(String todoSubject) {
		this.todoSubject = todoSubject;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public int getCano() {
		return cano;
	}
	public void setCano(int cano) {
		this.cano = cano;
	}
	public Timestamp getCreatetododate() {
		return createtododate;
	}
	public void setCreatetododate(Timestamp createtododate) {
		this.createtododate = createtododate;
	}
	public String getTodostartdate() {
		return todostartdate;
	}
	public void setTodostartdate(String todostartdate) {
		this.todostartdate = todostartdate;
	}
	public String getTodoenddate() {
		return todoenddate;
	}
	public void setTodoenddate(String todoenddate) {
		this.todoenddate = todoenddate;
	}
	

	
}
