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
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		factory = MyBatisConnector.getInstance().getSessionFactory();
	
	}
	
	//전체 게시물 조회
	public List<BoardVO> selectList(){
		//매퍼로 접근 전체목록조회 요청
		SqlSession sqlSession = factory.openSession();
		//여러개의 목록을 가져올것을 요청
		List<BoardVO> list = sqlSession.selectList("b.board_list");
		
		//반드시 닫아주기
		sqlSession.close();
		
		return list;
	}
	
	
	// 게시물 추가 (새글 등록)
		public int insert( BoardVO vo ) {
			//오토커밋
			SqlSession sqlSession = factory.openSession(true);
			
			//insert 메서드 사용
			//sqlSession mapper로 전달핳 수있는 파라미터는 무조건 무조건 한개!:vo
			//반환형은 int
			int res = sqlSession.insert("b.board_ins",vo);
			
			//db접속 닫기
			sqlSession.close();
			return res;
		}
	
	
	// 게시글 상세보기
		public BoardVO selectOne(int idx) {
			SqlSession sqlSession = factory.openSession();
			BoardVO vo = sqlSession.selectOne("b.board_one", idx);
			sqlSession.close();
			
			return vo;
			
		}
	
	
		
		//조회수 증가
		public int update_readhit( int idx ) {
			//자동 커밋
			SqlSession sqlSession = factory.openSession(true);
			
			int res = sqlSession.update("b.board_update_readhit", idx);
			
			sqlSession.close();
			return res;
			
			
		}
	
		
		//댓글 처리를 위해 step값 증가
		public int update_step(BoardVO baseVO) {
			
			SqlSession sqlSession = factory.openSession(true);
			int res = sqlSession.update("b.board_update_step", baseVO);
			sqlSession.close();
			
			return res;
		}
		
		
		//댓글 추가
		public int reply(BoardVO vo) {
			SqlSession sqlSession = factory.openSession(true);
			int res = sqlSession.insert("b.board_reply", vo);
			
			sqlSession.close();
			return res;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
