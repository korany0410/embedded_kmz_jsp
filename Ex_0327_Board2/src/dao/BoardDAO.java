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
		
		// 게시물 작성 (새글 등록)
		public int insert( BoardVO vo) {
			SqlSession sqlSession = factory.openSession(true);
			
			//insert메서드 사용
			//sqlSession mapper로 전달핳 수있는 파라미터는 무조건 무조건 한개!:vo
			//반환형은 int
			int res = sqlSession.insert("b.board_insert",vo);
			
			sqlSession.close();
			return res;

		}
		
		
		
		
		
		
		
}//BoardDAO
