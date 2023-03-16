package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBservice;
import vo.sawonVO;

public class sawonDAO {

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static sawonDAO single = null;

	private sawonDAO() {
		
	}
	
	public static sawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new sawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	////////////////////////////////////////////
	//사원 정보를 조회하기 위한 메서드 _list로 생성
	// 제너릭 타입으로는 VO넣어주기! //DAO는 들어가는 경우가 없다
	    public List<sawonVO> selectList() {

		List<sawonVO> list = new ArrayList<sawonVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from sawon";

		try {
			//1.Connection얻어온다
			conn = DBservice.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				sawonVO vo = new sawonVO();
				//현재레코드값=>Vo저장
				vo.setSabun(rs.getInt("sabun"));
				vo.setSaname(rs.getString("saname"));
				vo.setDeptno(rs.getInt("deptno"));
				vo.setSapay(rs.getInt("sapay"));
		
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
