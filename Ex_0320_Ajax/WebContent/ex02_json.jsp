<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!-- 
	JSON(javaScript Object Notation)표기법 : 
	서로다른 플랫폼에서 데이터를 교환하기위해 정의되어있는 공통적인(약속된) 표기법
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	document.write("<h3>1.기본형태의 json구조</h3>");
	//기본형태의 json구조 (한사람의 정보)
	let p = {'name':'홍길동', 'age':30, 'tel':'010-123-4567'};
	document.write( p.name + " / " + p.age + " / " + p.tel );
	
	document.write("<hr><h3>2.배열형태의 json구조 (여러사람의 정보를 넣을 수 있음)</h3>");
	
	// 배열형태의 json구조 (여러사람의 정보를 넣을 수 있음)//////////////////////////////////
	let p_arr = [ {'name':'홍길동', 'age':20, 'tel':'010-123-4567'},
				  {'name':'김길동', 'age':30, 'tel':'010-888-9999'},
				  {'name':'박길동', 'age':40, 'tel':'010-222-7777'} 
				];
	
	//				배열의 0번째 방의 name   /	    0번방의 age
	document.write( p_arr[0].name + " / " + p_arr[0].age + "<br>" );
	document.write( p_arr[1].name + " / " + p_arr[1].age + "<br>" );
	
	document.write("<hr>");//////////////////////////////////////////////////
	
	//지금까지 만든 걸 합쳐서 조금 더 복잡하게 만들어봄
	// 배열 없이 시작
	let course = {'name':'임베디드웹개발', 'start':'2023-01-01', 'end':'2023-06-01',
			//일반 json내부에 배열 형태를 넣음	
			'sub':['java', 'web', 'jsp'],
			'student':[	{'name':'hong','age':20},
						{'name':'kim','age':24},
						{'name':'park','age':28}
				]
	};
	
	document.write( "과목명: " + course.name + "<br>" );
	document.write( "시작일: " + course.start + "<br>" );
	document.write( "종료일: " + course.end + "<br>" );
	
	document.write("<hr>");
	
	for( let i = 0; i < course.sub.length; i++ ){
		
		document.write( course.sub[i] + " / ");
		
	}
	
	document.write("<hr>");
	//course 내부의 student배열을 볼 수 있게 for문
	for(let i =0; i < course.student.length; i++){
		document.write(course.student[i].name + " / " + course.student[i].age + "<br>" );
	}
	
	
	document.write("<hr>");
	
	let tech = { 'brand':[{'name':'apple','product':'phone'},
						{'name':'samsung','product':'tabletPC'}
						]
				 }
	
	for(let i = 0; i< tech.brand.length; i++){
		document.write(tech.brand[i].name +" : " 
				+ tech.brand[i].product + "<br>");
	}
	
	
	document.write("<hr>");
	
	let restaurant = {
			'type':['korean', 'japanese', 'american'] , 
			'local':[{'local':'서울','name':'태극당'},
					{'local':'대전','name':'성심당'},
					{'local':'군산','name':'이성당'}
			]
	}
	
	for(let i=0; i<restaurant.type.length; i++){
		document.write(restaurant.type[i] + "<br>");
	}
	
	for(let i=0; i<restaurant.local.length; i++){
		document.write(restaurant.local[i].local +" : " + restaurant.local[i].name + "<br>");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
</head>
<body>

</body>
</html>