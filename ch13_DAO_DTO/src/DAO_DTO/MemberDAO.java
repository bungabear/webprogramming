package DAO_DTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;  // 추가
import java.sql.ResultSet;
import java.sql.SQLException;       // 추가
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
//DAO 는 DB 에 직접 접속하여 관리(저장, 조회, 삭제)하는 역할
public class MemberDAO {
	private String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	private String uid = "smj459";
	private String upw = "min6422";

	public MemberDAO() { // 생성자 - 생성되는  순간에 드라이버 로드하고 있음
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//================================================
	// 폼에서 입력 받은 데이터 저장하는 프로세스 - 회원 가입할 때 호출할 메소드
	// 작성. 에러발생하면 예외 발생하고, 정상적이면 true  반환
	public boolean registerMember(MemberDTO dto) throws ServletException {
		Connection conn=null;
		try {
			conn = DriverManager.getConnection(url, uid, upw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;

		String query = "insert into Dao_member values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getPhone1());
			pstmt.setString(5, dto.getPhone2());
			pstmt.setString(6, dto.getPhone3());
			pstmt.setString(7, dto.getGender());
			pstmt.executeUpdate();
			pstmt.close();
		}catch(SQLException ex) {
			throw new ServletException("등록 실패!");
		}finally {

		}
		return true;
	}

	// =============================================
	// 반환형은 ArrayList이고, 데이터 타입은 MemberDTO
	// MemberDTO 가 보고 올 것
	public ArrayList<MemberDTO> memberSelect() {
		//	반환형은 ArrayList이고, 데이터 타입은 MemberDTO 인
		//  MemberDTO 데이터 객체 dtos를 생성
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();	 //초기화
		Connection con =null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, uid, upw);
			// Connection 객체 구함
			stmt = con.createStatement();
			// Statement 객체 stmt 를 con 객체로 부터 생성
			rs = stmt.executeQuery("select * from Dao_member");
			// select 한 결과를 rs 에 저장 - 모든 데이터 가져옴

			// dto 저장하는 단계
			while (rs.next()) {  // 데이터 베이스에서 가져온 데이터 처음 부터 끝까지 수행
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				// 각 필드 값을 dto 객체로 변환하여 내가 만든 ArayyList 객체 dtos에 추가
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto); // 한사람의 dto 객체를 dtos 에 추가 이것을 반복
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;   // 호출한 곳으로 select 한 데이터를 반환
	}

	public void memberUpdate(MemberDTO dto) throws ServletException{
		Connection conn=null;
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			PreparedStatement pstmt = null;

			String query = " update DAO_member set name=?, pw=?, phone1=?, phone2=?, phone3=?, gender=? where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getPhone1());
			pstmt.setString(4, dto.getPhone2());
			pstmt.setString(5, dto.getPhone3());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getId());
			pstmt.executeUpdate();
			pstmt.close();
			//System.out.println("update DAO_member set name="+ dto.getName() +", pw=?, phone1=?, phone2=?, phone3=?, gender=? where id = "+dto.getId());
		}catch(SQLException ex) {
			throw new ServletException("변경 실패!");
		}finally {

		}


	}

	public void memberDelete(String id) throws ServletException{
		Connection conn=null;
		try {
			conn = DriverManager.getConnection(url, uid, upw);
			PreparedStatement pstmt = null;
			String query = "delete DAO_member where id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(SQLException ex) {
			throw new ServletException("삭제 실패!");
		}finally {

		}

	}
}
