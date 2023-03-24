package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	//// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	// SqlSessionFactory : 앞으로 어떤 DB에 연결할것인가, mapper로 누구를 사용할 것인가 등의 정보를 저장 할 클래스
	SqlSessionFactory factory = null;
	
	//싱클톤을 통해 생성자 호출되었을때 sqlMapConfig.xml를 통째로 읽어온다 
	public MyBatisConnector() {
		try {
			//마이바티스와 관련된 참조파일들을 읽어옴
			// (패키지에서 .으로 연결된부분은 뒤가 폴더로 만들어짐)
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			
			//단순히 내용만 읽어온 reader로는 조립하고 기능을 구현하는것이 불가능해서
			// (전문업체) factory에 내용을 전달하여 DB와 관련된 처리를 할 수있도록 요청
			factory = new SqlSessionFactoryBuilder().build(reader);
			//reader스트림 닫아줌
			reader.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
		
		//
		public SqlSessionFactory getSessionFactory() {
			return factory;
		}
	
	
	
	
	
	
}
