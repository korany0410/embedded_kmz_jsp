package service;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	//앞으로 어떤 DB에 연결할것인가 ?, mapper로 누구를 사용할 것인가 ? 등의 정보를 저장할 클래스
	
	SqlSessionFactory factory = null;
	
	public MyBatisConnector() {
		
		
		try {
			// 패키지에 접근할때는 /로 접근해야한다. 패키지를 만들때 .을사용하면 하위폴더를 생성하는것과 동일
			// sqlMapConfig.xml 파일을 읽어서 reader스트림에게 전달
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
			
			//단순히 내용만 읽어온 reader로는 기능적인 구현이 불가하므로 
			//factory에게 내용을 전달하여 DB와 관련된 처리릴 할 수 있도록 요청
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	public SqlSessionFactory getSessionFactory () {
		return factory;
	}
	
}

