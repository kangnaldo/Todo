package com.kang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.kang.bean.Todo;
import com.kang.bean.User;

public class TodoDaoImpl implements TodoDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private TodoDaoImpl() {

	}

	// 싱글톤 패턴 임당
	private static TodoDaoImpl instance = new TodoDaoImpl();

	public static TodoDaoImpl getInstance() {
		if (instance == null) {
			return new TodoDaoImpl();
		}
		return instance;
	};

	@Override
	public boolean userInsert(User user) {

		int status = 0;

		try {
			conn = DBManager.getConnection();
			// 트랜젝션 처리임니당
			/*
			 * JSP는 기본적으로 오토커밋되어있음 그래서 오토커밋이 자동으로 작동되지 못하게 해야됨
			 */

			DBManager.setAutoCommit(conn, false);
			String sql = "insert into user(id,name,password,email,addr) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getAddr());

			status = pstmt.executeUpdate();

			if (status == 1) {
				DBManager.commit(conn);
				DBManager.setAutoCommit(conn, true);
			} else {
				DBManager.rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return status == 1 ? true : false;
	}

	@Override
	public User login(String id, String password) {
		User user = null;
		try {

			conn = DBManager.getConnection();

			String sql = "select * from user where id = ? AND password = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getString("id"));
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return null;
	}

	@Override
	public int idCk(String id) {
		try {
			System.out.println("아이디는 " + id);
			String sql = "select id from user where id = ?";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return -1;
	}

	@Override
	public boolean todoInsert(Todo todo) {
		int status = 0;
		try {

			String sql = "insert into todo(id,todosubject,todocontent,cano,todostartdate,todoenddate) values(?,?,?,?,date_format(?, '%y-%m-%d'),date_format(?, '%y-%m-%d'))";
			conn = DBManager.getConnection();
			DBManager.setAutoCommit(conn, false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todo.getId());
			pstmt.setString(2, todo.getTodoSubject());
			pstmt.setString(3, todo.getTodoContent());
			pstmt.setInt(4, todo.getCano());
			pstmt.setString(5, todo.getTodostartdate());
			pstmt.setString(6, todo.getTodoenddate());

			status = pstmt.executeUpdate();
			if (status == 1) {
				DBManager.commit(conn);
				return true;
			} else {
				DBManager.rollback(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return false;
	}

	@Override
	public ArrayList<Todo> todoList(String id) {
		ArrayList<Todo> todoList = new ArrayList<Todo>();
		try {
			String sql = "select * from todo where id = ?";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Todo todo = new Todo();
				todo.setId(rs.getString("id"));
				todo.setTodoSubject(rs.getString("todosubject"));
				todo.setTodoContent(rs.getString("todocontent"));
				todo.setCano(rs.getInt("cano"));
				todo.setCreatetododate(rs.getTimestamp("createtododate"));
				todo.setTodostartdate(rs.getString("todostartdate"));
				todo.setTodoenddate(rs.getString("todoenddate"));
				todo.setCompletion(rs.getBoolean("completion"));
				todo.setTodono(rs.getInt("todono"));
				todoList.add(todo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return todoList;
	}

	@Override
	public Todo getTodoDetail(int todono) {
		Todo todo = new Todo();
		try {
			String sql = "select * from todo where todono = ?";
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todono);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				todo.setId(rs.getString("id"));
				todo.setTodoSubject(rs.getString("todosubject"));
				todo.setTodoContent(rs.getString("todocontent"));
				todo.setCano(rs.getInt("cano"));
				todo.setCreatetododate(rs.getTimestamp("createtododate"));
				todo.setTodostartdate(rs.getString("todostartdate"));
				todo.setTodoenddate(rs.getString("todoenddate"));
				todo.setCompletion(rs.getBoolean("completion"));
				todo.setTodono(rs.getInt("todono"));
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return todo;
	}

	@Override
	public boolean todoUpdate(Todo todo) {
		int status = 0;
		try {
			String sql = "update todo set todosubject = ?, todocontent = ? , cano = ?,"
					+ "todostartdate = ?, todoenddate = ? where todono = ?";
			conn = DBManager.getConnection();
			DBManager.setAutoCommit(conn, false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, todo.getTodoSubject());
			pstmt.setString(2, todo.getTodoContent());
			pstmt.setInt(3, todo.getCano());
			pstmt.setString(4, todo.getTodostartdate());
			pstmt.setString(5, todo.getTodoenddate());
			pstmt.setInt(6, todo.getTodono());

			status = pstmt.executeUpdate();

			if (status == 1) {
				DBManager.commit(conn);
			}
		} catch (Exception e) {
			DBManager.rollback(conn);
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return status == 1 ? true : false;
	}

	@Override
	public boolean completionUpdate(int todono, boolean completion) {
		int status = 0;
		boolean a = false;
		try {
			String sql = "update todo set completion = ? where todono = ?";
			conn = DBManager.getConnection();
			boolean change = !completion;
			DBManager.setAutoCommit(conn, false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setBoolean(1, change);
			pstmt.setInt(2, todono);
			
			status = pstmt.executeUpdate();
			if(status == 1) {
				DBManager.commit(conn);
			}
			
		}catch(Exception e) {
			DBManager.rollback(conn);
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt);
		}
		return a;
	}

	@Override
	public boolean completionSelect(int todono) {
		boolean hoho = false;
		try {
			String sql = "select completion from todo where todono = ?";
			conn = DBManager.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, todono);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				hoho = rs.getBoolean(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return hoho;
	}

	@Override
	public boolean tododelete(int todono) {
		int status = 0;
		boolean ck = false;
		try {
			String sql = "delete from todo where todono = ?";
			conn = DBManager.getConnection();
			DBManager.setAutoCommit(conn, false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todono);
			
			status = pstmt.executeUpdate();
			if(status == 1) {
				DBManager.commit(conn);
			}
			ck = status == 1 ? true : false; 
		}catch(Exception e) {
			DBManager.rollback(conn);
			e.printStackTrace();
			
		}finally {
			DBManager.close(conn, pstmt);
		}
		return ck;
	}


}
