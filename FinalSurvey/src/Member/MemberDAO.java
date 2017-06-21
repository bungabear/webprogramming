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
		int ri = 0;   // ���� ���� 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into member values (?,?)";	
		try {
			connection = getConnection();  // ȣ�� - �ǵڿ� ����
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());  // ������ ����
			pstmt.setString(2, dto.getPassword());
			pstmt.executeUpdate();  // ����
			ri = 0; // 1 �̸� -�����̸�
		/*select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/
			
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
	}  /* ri  select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/	
	
	public int confirmId(String id) {
		int ri = 0;	
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from member where id = ?";
		                 /*DB�� id            ������ �Է��� id */
		 try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id); // id�� ����ڰ� ������ �Է��� id
			set = pstmt.executeQuery();  // select �� �� ���
			if(set.next()){
				ri = 0;// �̹� �����ϴ� �Ƶ�� 1
			} else {
				ri = -1; // �������� �ʴ� �Ƶ�� 0
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
		return ri;    /* 0 or  1 ��ȯ */
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
			pstmt.setString(1, dto.getId());  // ����ڰ� �Է��� �Ƶ�
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("password");
				if(dbPw.equals(dto.getPassword())) {     // ����ڰ� �Է��� �н�����
					ri = 0;// 1 �̸� �α��� Ok
				} else {
					ri = -1;	// 0  ��� X
				}
			} else {
				ri = -2;	// -1  ȸ���� �ƴϸ�	
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
		// ����Ŭ DB�� ����ϱ� ���� ��ü context ����
		
		dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		// context ��ü�� lookup �޼ҵ忡 �Ű������� �̿��Ͽ� ���ҽ��� ȹ���Ѵ�.
		// ����Ŭ DB �̸��� �⺻������ java:comp/env �� ��ϵǾ� �ִ�.
		// �ش� �������� jdbc/Oracle11g �� ������ �̸��� ���´�.
		

		connection = dataSource.getConnection();
		// ds ��ü�κ��� Connection  ��ü ���´�.
		// ���ݺ��ʹ� �� ��ü�� �� �����̳��� DBCP �� ���� �����ȴ�.
		 
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return connection;
	}
}
