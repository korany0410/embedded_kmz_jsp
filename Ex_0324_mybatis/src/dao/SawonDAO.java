package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	
	SqlSessionFactory factory = null;
	
	public SawonDAO() {
		//DAO클래스가 생성자를 통해 메모리 할당을 받을때
		//factory(어떤 db로 접속할 것인지, mapper로 누구를 쓸것인가..)를 가져온다
		factory = MyBatisConnector.getInstance().getSessionFactory();
	}

	//이제 탬플릿을 가지고 _select, insert, delete등 쿼리를 작성하지 않는다
	//dao에서 사원목록을 조회하고싶을때 그동안은 _select템플릿을 사용해왔지만 그 구조를 이용해
	//간단하게 반환형 타입을 작성한다
	
	//사원 목록 조회
	public List<SawonVO> select(){
		
		//mapper를 호출하고 쿼리문을 요청하거나, 파라미터를 보내는 등의 작업을 하는 클래스
		SqlSession sqlSession = factory.openSession();
		//sqlSession의 selectList메서드를 호출해야한다
		//<mapper namespace="s"> 
		// s라는 이름을 가진 매퍼로 접근 한 뒤 s.sawon_list 라는 <select>태그 쿼리로 접근할래
		
		//selectList메서드를 통해 mapper가 호출되면 
		//실행된 쿼리문의 최종결과를 List구조로 받는다
		List<SawonVO> vo = sqlSession.selectList("s.sawon_list");
		
		return vo;
		
	}
}






























