package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
		// 객체1개만생성해서 지속적으로 서비스하자
		static BoardDAO single = null;

		public static BoardDAO getInstance() {
			//생성되지 않았으면 생성
			if (single == null)
				single = new BoardDAO();
			//생성된 객체정보를 반환
			return single;
		}
		
		SqlSessionFactory factory = null;
		
		//생성자
		public BoardDAO() {
			// TODO Auto-generated constructor stub
			factory = MyBatisConnector.getInstance().getSessionFactory();
		}
	
	
		//전체 게시물 조회
		public List<BoardVO> selectList(){
			
			SqlSession sqlSession = factory.openSession();
			List<BoardVO> list = sqlSession.selectList("b.board_list");
		
			sqlSession.close();
			
			return list;
		}
		
		
		
		
		
		
		
}//BoardDAO
