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
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}
	
	public List<BoardVO> select(){
		
		SqlSession sqlSession = factory.openSession();
		List<BoardVO> list = sqlSession.selectList("b.board_list");
		sqlSession.close();
		
		return list;
	}
	
	public int insert (BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		//mybatis에서는 파라미터는 무조건 하나만 보낼수 있다.
		int res = sqlSession.insert("b.board_ins", vo);
		sqlSession.close();
		
		return res;
	}
	
	public BoardVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		sqlSession.close();
		
		return vo;
	}
	
	//조회수 증가
	public int update_readhit(int idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("b.board_update_readhit",idx);
		sqlSession.close();
		
		return res;
	}
	
	public int update_step( BoardVO baseVO ) {
		SqlSession sqlSession=factory.openSession(true);
		int res = sqlSession.update("b.board_update_step",baseVO);
		sqlSession.close();
		return  res;
	}

	public int reply(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("b.board_reply", vo);
		sqlSession.close();
		
		return res;
	}
	
	public int update(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("b.board_update", vo);
		sqlSession.close();
		
		return res;
	}
	
}
