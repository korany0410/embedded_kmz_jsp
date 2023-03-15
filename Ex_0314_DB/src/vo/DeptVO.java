package vo;

public class DeptVO {
	
	//Dept테이블을 조회하여 얻고싶은 컬럼들을 묶어서 관리
	
	// 컬럼명과 변수명을 일치시켜주자!
	private int deptno;
	// Number이외의 모든 값은 String으로 저장하기
	private String dname;
	private String loc;
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
