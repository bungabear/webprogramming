package DAO_DTO;
public class MemberDTO {
private String name;
private String id;
private String pw;
private String phone1;
private String phone2;
private String phone3;
private String gender;
// 전송하려는 데이터를 저장하는 속성들로 DB 테이블의 필드명과
// 같게 작성하면 편리하다. 이렇게 작성한 것을 DTO 라 부른다.
// DTO는 DB에서 가져온 데이터를 이와 같은 형태(객체)로 관리해 주는 클래스
// 생성할 때 MemberDTO 의 구조인 데이터 객체 생성됨
// 생성함과 동시에 파라미터 값 받아서 각 변수에 저장
 public MemberDTO(String name, String id, String pw, String phone1,
		  String phone2, String phone3, String gender) {
	this.name = name;
	this.id = id;   // 입력 받은 데이터를 private 한 필드에 저장
	this.pw = pw;
	this.phone1 = phone1;
	this.phone2 = phone2;
	this.phone3 = phone3;
	this.gender = gender;
}

public String getName() {
return name;
}
public void setName(String name) {
this.name = name;
}
public String getId() {
return id;
}
public void setId(String id) {
this.id = id;
}
public String getPw() {
return pw;
}

public void setPw(String pw) {
this.pw = pw;
}
public String getPhone1() {
return phone1;
}
public void setPhone1(String phone1) {
this.phone1 = phone1;
}
public String getPhone2() {
return phone2;
}
public void setPhone2(String phone2) {
this.phone2 = phone2;
}

public String getPhone3() {
return phone3;
}
public void setPhone3(String phone3) {
this.phone3 = phone3;
}
public String getGender() {
return gender;
}
public void setGender(String gender) {
this.gender = gender;
}

}
