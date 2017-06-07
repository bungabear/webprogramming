package DAO_DTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;  // �߰�
import java.sql.ResultSet;
import java.sql.SQLException;       // �߰�
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
//DAO �� DB �� ���� �����Ͽ� ����(����, ��ȸ, ����)�ϴ� ����
public class MemberDAO {
	private String url = "jdbc:oracle:thin:@orcl.cunrsihyxqm6.us-west-2.rds.amazonaws.com:1521:orcl";
	private String uid = "smj459";
	private String upw = "min6422";

	public MemberDAO() { // ������ - �����Ǵ�  ������ ����̹� �ε��ϰ� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//================================================
	// ������ �Է� ���� ������ �����ϴ� ���μ��� - ȸ�� ������ �� ȣ���� �޼ҵ�
	// �ۼ�. �����߻��ϸ� ���� �߻��ϰ�, �������̸� true  ��ȯ
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
			throw new ServletException("��� ����!");
		}finally {

		}
		return true;
	}

	// =============================================
	// ��ȯ���� ArrayList�̰�, ������ Ÿ���� MemberDTO
	// MemberDTO �� ���� �� ��
	public ArrayList<MemberDTO> memberSelect() {
		//	��ȯ���� ArrayList�̰�, ������ Ÿ���� MemberDTO ��
		//  MemberDTO ������ ��ü dtos�� ����
		ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();	 //�ʱ�ȭ
		Connection con =null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = DriverManager.getConnection(url, uid, upw);
			// Connection ��ü ����
			stmt = con.createStatement();
			// Statement ��ü stmt �� con ��ü�� ���� ����
			rs = stmt.executeQuery("select * from Dao_member");
			// select �� ����� rs �� ���� - ��� ������ ������

			// dto �����ϴ� �ܰ�
			while (rs.next()) {  // ������ ���̽����� ������ ������ ó�� ���� ������ ����
				String name = rs.getString("name");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String phone1 = rs.getString("phone1");
				String phone2 = rs.getString("phone2");
				String phone3 = rs.getString("phone3");
				String gender = rs.getString("gender");
				// �� �ʵ� ���� dto ��ü�� ��ȯ�Ͽ� ���� ���� ArayyList ��ü dtos�� �߰�
				MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
				dtos.add(dto); // �ѻ���� dto ��ü�� dtos �� �߰� �̰��� �ݺ�
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
		return dtos;   // ȣ���� ������ select �� �����͸� ��ȯ
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
			throw new ServletException("���� ����!");
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
			throw new ServletException("���� ����!");
		}finally {

		}

	}
}
