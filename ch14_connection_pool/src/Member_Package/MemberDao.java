package Member_Package;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Member_Package.MemberDto;
public class MemberDao {
	public static final int MEMBER_NONEXISTENT  = 0;  
	// ������ �� ���� ���
	public static final int MEMBER_EXISTENT = 1;
	public static final int MEMBER_JOIN_FAIL = 0;
	public static final int MEMBER_JOIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT = -1;
	
	/*�̱��� �����̶� - Ŭ�����κ��� ��ü ���� ���� �ٷ� ��ü�� ������ ����� �� �ִ�.
	 * �����ڰ� ���� ���� ȣ��Ǵ��� ������ �����Ǵ� ��ü�� �ϳ��̰� 
	 * ���� ���� ���Ŀ� ȣ��� �����ڴ� ������ �����ڰ� ������ ��ü�� �����Ѵ�  
          ��ü ���� ���α׷����� �����ϴ� ���ҽ��� ���� �׼����� ���� �� �� ��� */
	
	private static MemberDao instance = new MemberDao();
	// MemberDao() �� �̿��Ͽ� instance �� ����
	// instance �� �ڱⰡ �ڱ⸦ �����ϰ� �����ϴ� ���� 
	// static�� �ν��Ͻ��� ��������� ���� ȣ��Ǵ� �ڵ� 
	
	
	private MemberDao() {
		// ������ �����ڴ� public �� - �ܺο��� ������ �����ؾ� �ϹǷ�  
		// MemberDao �� �����ڰ� private �̹Ƿ� �ٸ������� ������ �Ұ�
		// �׷��Ƿ� �ܺο��� �ν��Ͻ� ���� ���ϰ� private �� ���� 
		// private �̹Ƿ� �ٸ������� ��� �Ұ� 
		// �� instance ��ü�� �ϳ��� �����ǰ�, ��� ������ ��� ������
		// �ڱ� Ŭ�������� �ڽ��� �����ϰ� �����ϴ� ��ü
	}  
	
	public static MemberDao getInstance(){
		return instance;
	} // private MemberDao()�� ������ �ȵǹǷ� public �ϰ� static �� 
	  //  �ν��Ͻ��� ����� �ٸ� ������ �ٷ� ������ �����ϵ����� - 
	  // ������ ���� instance �� ��ȯ
	
	// ============= insertMember ==================
	public int insertMember(MemberDto dto) {
		int ri = 0;   // ���� ���� 
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values (?,?,?,?,?,?)";	
		try {
			connection = getConnection();  // ȣ�� - �ǵڿ� ����
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());  // ������ ����
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();  // ����
			ri = MemberDao.MEMBER_JOIN_SUCCESS; // 1 �̸� -�����̸�
		/*select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/
			
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
	}  /* ri  select �� �ƴϹǷ� resultSet ��ü�� ���� ��ȯ���� int ���̴�.*/	
	
	//============ confirmId ====================
	public int confirmId(String id) {
		int ri = 0;	
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		                 /*DB�� id            ������ �Է��� id */
		 try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id); // id�� ����ڰ� ������ �Է��� id
			set = pstmt.executeQuery();  // select �� �� ���
			if(set.next()){
				ri = MemberDao.MEMBER_EXISTENT;// �̹� �����ϴ� �Ƶ�� 1
			} else {
				ri = MemberDao.MEMBER_NONEXISTENT; // �������� �ʴ� �Ƶ�� 0
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
	
	//=============== userCheck =====================
	/*����ڰ� �Է��� id�� pass�� ������ �� �Է��� ���� ������ �� */
	public int userCheck( String id, String pw) {
		int ri = 0;
		String dbPw;		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select pw from members where id = ?";		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);  // ����ڰ� �Է��� �Ƶ�
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {     // ����ڰ� �Է��� �н�����
					ri = MemberDao.MEMBER_LOGIN_SUCCESS;// 1 �̸� �α��� Ok
				} else {
					ri = MemberDao.MEMBER_LOGIN_PW_NO_GOOD;	// 0  ��� X
				}
			} else {
				ri = MemberDao.MEMBER_LOGIN_IS_NOT;	// -1  ȸ���� �ƴϸ�	
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
	
	//=============== getMember   ===================
	public MemberDto getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDto dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {       // ó������ ������ ���� 
				dto = new MemberDto();
				dto.setId(set.getString("id"));  // ���� 
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setAddress(set.getString("address"));
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
		return dto;		// ��ȯ
	}
		
      
	//===============  getList  =================================
       public ArrayList<MemberDto> getList() {
    	  /* public ArrayList<MemberDto> getList() {*/
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select * from members";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String bid = resultSet.getString("id");
				String bpw = resultSet.getString("pw");
				String bname = resultSet.getString("name");
				String bemail = resultSet.getString("eMail");
				Timestamp bdate = resultSet.getTimestamp("rDate");
				String baddress = resultSet.getString("address");
							
				MemberDto dto = new MemberDto(bid, bpw, bname, bemail, bdate, baddress);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
       
     //===============  searchMember  =================================
       public ArrayList<MemberDto> searchMember(String type, String value) {
    	  /* public ArrayList<MemberDto> getList() {*/
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			String query= "select * from members";
			if(type.equals("id")){
				query += " where id like '%" + value + "%'";
			}else if(type.equals("name"))
			{
				query += " where name like '%" + value + "%'";
			}
			
			preparedStatement = connection.prepareStatement(query);
			//preparedStatement.setString(1, value);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String bid = resultSet.getString("id");
				String bpw = resultSet.getString("pw");
				String bname = resultSet.getString("name");
				String bemail = resultSet.getString("eMail");
				Timestamp bdate = resultSet.getTimestamp("rDate");
				String baddress = resultSet.getString("address");
							
				MemberDto dto = new MemberDto(bid, bpw, bname, bemail, bdate, baddress);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
		
	//==============  updateMember   ==========================
       // �����Ϸ��� ����� dto ��ü�� ���޹޾� 
	public int updateMember(MemberDto dto) {
		int ri = 0;		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set pw=?, eMail=?, address=? where id=?";		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.geteMail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			ri = pstmt.executeUpdate();  
			// ������Ʈ �� ����� ������ ��ȯ 1 �̸� ����
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}		
		return ri;   // ���� 1�̸� ����, 0 �̸� ���� 
	}
	
	//==========================================
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



 