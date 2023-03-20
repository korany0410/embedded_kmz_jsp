<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    	Ajax(Asynchronus javascript & xml ) : 비동기 통신
    	자바스크립트를 이용한 백그라운드 통신기술 (하나의 웹페이지 안에서 변경이 발생한 
    	특정 영역에 대해서만 갱신이 가능하다)
     -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Ajax사용을 위해 미리 준비해둔httpRequest.js를 참조  -->
 <!-- Ajax를 사용하고싶을때 넣어줘야하는 스크립트 -->
<script src="js/httpRequest.js"></script>
<script>

	function send() {
		//form태그가 없어서 비어있는 함수로 만든다.
		let dan = document.getElementById("dan").value;
		
		//유효성 체크
		
		//Ajax를 통해 dan을 파라미터로 전달
		let url = "ex01_gugudan_ajax.jsp";
		let param ="dan="+dan; //jsp변수 띄어쓰기 금지

		//                      콜백 메서드
		sendRequest(url, param, resultFn, "GET");
	}
	 //콜백메서드(Ajax로 요청된 결과를 처리하기 위한 메서드) 준비
	function resultFn() {
		//console.log( xhr.readyState + "/" + xhr.status );
		// xhr.readyState
		// 0 : 초기화 오류
		// 1,2,3 : 현재페이지 로드중
		// 4 : 로드완료
		
		// xhr.status
		// 200 : 이상없음
		// 404 : 경로 없음, 500 : 서버 에러
		
		// 필수적으로 사용
		if( xhr.readyState == 4 && xhr.status == 200 ){
		// 결과를 가지고 돌아온 데이터를 읽어온다.
		let data = xhr.responseText; 
		//alert(data);
		document.getElementById("disp").innerHTML = data;
		}	
	}
	
</script>

</head>
<body>
	단 : <input id="dan">
	<input type="button" value="결과보기" onclick="send();">
	<br>
	<div id="disp"> </div>
</body>
</html>