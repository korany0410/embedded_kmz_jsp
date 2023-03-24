package service;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBservice {
	// DBservice : DB접속 과정을 처리할 클래스

	// 싱글톤 개념
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBservice single = null;

	DataSource ds;

	// 기본생성자
	public DBservice() {

		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context) ic.lookup("java:comp/env");
			ds = (DataSource) ctx.lookup("jdbc/oracle_test");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	//
	public static DBservice getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new DBservice();
		// 생성된 객체정보를 반환
		return single;
	}

	public Connection getConnection() {
		Connection conn = null;

		try {
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return conn;
	}
}
