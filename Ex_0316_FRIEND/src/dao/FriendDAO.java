package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBservice;
import vo.FriendVO;

public class FriendDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static FriendDAO single = null;

	public static FriendDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new FriendDAO();
		// 생성된 객체정보를 반환
		return single;
	}

//친구테이블 전체적으로 조회하는 메서드
	public List<FriendVO> selectList() {

		List<FriendVO> list = new ArrayList<FriendVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from friend";

		try {
			// 1.Connection얻어온다
			conn = DBservice.getInstance().getConnection();
			// 2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			// 3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				FriendVO vo = new FriendVO();
				// 현재레코드값=>Vo저장
				vo.setNo(rs.getInt("no"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setTel(rs.getString("tel"));

				// ArrayList추가
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

//친구 정보 추가
public int insert(FriendVO vo) {
	// TODO Auto-generated method stub
	int res = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "insert into friend values(seq_friend_no.nextVal, ?,?,?)";

	try {
		//1.Connection획득
		conn = DBservice.getInstance().getConnection();
		//2.명령처리객체 획득
		pstmt = conn.prepareStatement(sql);

		//3.pstmt parameter 채우기
		pstmt.setString(1, vo.getName());
		pstmt.setInt(2, vo.getAge());
		pstmt.setString(3, vo.getTel());
		//4.DB로 전송(res:처리된행수)
		res = pstmt.executeUpdate();

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {

		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return res;
}

	// 친구 정보 삭제 메서드
public int delete(int no) {
	// TODO Auto-generated method stub
	int res = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;

	String sql = "delete from Friend where no=?";

	try {
		//1.Connection획득
		conn = DBservice.getInstance().getConnection();
		//2.명령처리객체 획득
		pstmt = conn.prepareStatement(sql);

		//3.pstmt parameter 채우기
		pstmt.setInt(1, no);

		//4.DB로 전송(res:처리된행수)
		res = pstmt.executeUpdate();

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	} finally {

		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return res;
}



}



























