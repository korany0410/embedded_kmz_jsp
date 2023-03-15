package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBservice;
import vo.DeptVO;

public class DeptDAO {
	// DAO(Data Access Object) : DB접근을 목표로 하는 클래스
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	private DeptDAO() {
		
	}
	
	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	//부서테이블 조회(_select_list 템플릿)
	public List<DeptVO> selectList() {

		List<DeptVO> list = new ArrayList<DeptVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from dept";

		try {
			//1.Connection얻어온다
			conn = DBservice.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DeptVO vo = new DeptVO();
				//현재레코드값=>Vo저장
				vo.setDeptno(rs.getInt("deptno"));
				vo.setDname(rs.getString("dname"));
				vo.setLoc(rs.getString("loc"));
				
				
				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
}
