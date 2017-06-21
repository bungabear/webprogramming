package Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {
	}  

	public static MemberDAO getInstance(){
		return instance;
	} 
	
	public int insertMember(MemberDTO dto) {
		int ri = 0;   // 지역 변수 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into member values (?,?)";	
		try {
			connection = getConnection();  // 호출 - 맨뒤에 있음
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());  // 데이터 저장
			pstmt.setString(2, dto.getPassword());
			pstmt.executeUpdate();  // 실행
			ri = 0; // 1 이면 -성공이면
		/*select 가 아니므로 resultSet 객체가 없고 반환형이 int 형이다.*/
			
		} catch (Exception e) {
			e.printStackTrace();
			ri = -1;
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return ri;   
	}  /* ri  select 가 아니므로 resultSet 객체가 없고 반환형이 int 형이다.*/	
	
	public int confirmId(String id) {
		int ri = 0;	
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from member where id = ?";
		                 /*DB의 id            폼에서 입력한 id */
		 try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id); // id는 사용자가 폼에서 입력한 id
			set = pstmt.executeQuery();  // select 일 때 사용
			if(set.next()){
				ri = 0;// 이미 존재하는 아디면 1
			} else {
				ri = -1; // 존재하지 않는 아디면 0
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		return ri;    /* 0 or  1 반환 */
	}
	
	public int userCheck(MemberDTO dto) {
		int ri = 0;
		String dbPw;		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select password from member where id = ?";		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());  // 사용자가 입력한 아디
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("password");
				if(dbPw.equals(dto.getPassword())) {     // 사용자가 입력한 패스워드
					ri = 0;// 1 이면 로그인 Ok
				} else {
					ri = -1;	// 0  비번 X
				}
			} else {
				ri = -2;	// -1  회원이 아니면	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}


	
	private Connection getConnection() {
		
	Context context = null;
	DataSource dataSource = null;
	Connection connection = null;
	try {
		context = new InitialContext();
		// 오라클 DB를 사용하기 위한 객체 context 생성
		
		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		// context 객체로 lookup 메소드에 매개변수를 이용하여 리소스를 획득한다.
		// 오라클 DB 이름은 기본적으로 java:comp/env 에 등록되어 있다.
		// 해당 영역에서 jdbc/Oracle11g 로 설정된 이름을 얻어온다.
		

		connection = dataSource.getConnection();
		// ds 객체로부터 Connection  객체 얻어온다.
		// 지금부터는 이 객체는 웹 컨테이너의 DBCP 에 의해 관리된다.
		 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return connection;
	}
}
