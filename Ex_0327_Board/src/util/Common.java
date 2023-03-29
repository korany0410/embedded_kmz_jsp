package util;

public class Common {
	// 객체의 페이지 관리를 편하게 하기 위해 생성한 클래스
	// 만약 a,b의 게시판이 존재한다면 두 게시판이
	// 한 페이지당 보여줘야하는 게시글의 수 , 페이지 메뉴 수를 다르게
	// 설정해두고 가져다 쓸 수 있다.

	// 일반 게시판
	public static class Board {
		// 한 페이지에 보여줄 게시글 수 = 5
		public final static int BLOCKLIST = 5;

		// 한 화면에 보여질 페이지 메뉴 수 < 1 2 3 > < 4 5 6>
		public final static int BLOCKPAGE = 3;
	}

	
	// 공지사항 게시판
	public static class Notice {
		// 한 페이지에 보여줄 게시글 수 = 10
		public final static int BLOCKLIST = 10;
		// Common.Notice.BLOCKLIST
		
		// 한 화면에 보여질 페이지 메뉴 수 < 1 2 3 4 5 > < 6 7 8 9 10 >
		public final static int BLOCKPAGE = 5;
		// Common.Notice.BLOCKPAGE
	}

}
