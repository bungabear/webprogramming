package Survey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class SurveyDAO {
	private static SurveyDAO instance = new SurveyDAO();
	
	private SurveyDAO() {
	}  

	public static SurveyDAO getInstance(){
		return instance;
	} 
	
	public boolean checkAnswered(String id) {
		boolean ri = false;   // 지역 변수 
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select id from survey where id= ?";	
		try {
			connection = getConnection();  // 호출 - 맨뒤에 있음
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);  // 데이터 저장
			rs = pstmt.executeQuery();  // 실행
			rs.next();
			if(rs.getRow() ==1)
			{	
				ri = true;
			}
			System.out.println("ri: " +ri);
			
		} catch (Exception e) {
			e.printStackTrace();
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
	
	
	public int insertAnswer(SurveyDTO dto) {
		int ri = 0;   // 지역 변수 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into survey values (?,?)";	
		try {
			connection = getConnection();  // 호출 - 맨뒤에 있음
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());  // 데이터 저장
			pstmt.setInt(2, dto.getAnswer());
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
	
	
	public int[] getAnswers() {
		int ri[] = {0,0,0,0};   // 지역 변수 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "select * from survey";
		ResultSet rs = null;
		try {
			connection = getConnection();  // 호출 - 맨뒤에 있음
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();  // 실행
			while(rs.next())
			{
				//System.out.println(rs.getString("id") + " " + rs.getInt("answer"));
				ri[rs.getInt("answer")-1]++;
			}
		} catch (Exception e) {
			e.printStackTrace();
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
