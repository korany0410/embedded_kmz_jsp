package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory = null;
	
	public GogekDAO() {
		factory = MyBatisConnector.getInstance().getSessionFactory();
		
	}
	
	//고객목록 조회해서 가져오기
	public List<GogekVO> select(){
		//매퍼로 접근
		SqlSession sqlSession = factory.openSession();
		
		List<GogekVO> vo = sqlSession.selectList("g.gogek_list");
		//반드시 닫아주기
		sqlSession.close();
		return vo;
	}
	
	// 선택적으로 고객목록 가져오기 (오버로딩)
	public List<GogekVO> select( String addr ){
		//매퍼로 접근
		SqlSession sqlSession = factory.openSession();
		
		List<GogekVO> vo = sqlSession.selectList("g.gogek_select",addr);
		//반드시 닫아주기
		sqlSession.close();
		return vo;
	}
	
	
	//고객삭제
	public int delete(int idx) {
		
		//mapper를 호출하고 쿼리문을 요청하거나, 파라미터를 보내는 등의 작업을 하는 클래스
		//고객삭제 (true)는 오토커밋
		SqlSession sqlSession = factory.openSession(true);
		//g.gogek_del로 mapper요청할때 idx파라미터 받아
		int res = sqlSession.delete("g.gogek_del", idx);
		//단, sqlSession은 모든 메서드가 파라미터를 반드시 한개만 가질 수있다. 아래처럼 못함
//		int res = sqlSession.delete("g.gogek_del", idx, idx);
		sqlSession.close();
		
		return res;
	}
	
	
	//고객추가
	public int insert( GogekVO vo ) {
		//오토커밋
		SqlSession sqlSession = factory.openSession(true);
		
		//insert메서드 사용 ,
		//sqlSession mapper로 전달핳 수있는 파라미터는 무조건 무조건 한개!:vo
		int res = sqlSession.insert("g.gogek_ins", vo);
		//db접속 닫기
		sqlSession.close();
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
