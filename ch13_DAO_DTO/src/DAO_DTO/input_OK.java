package DAO_DTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO_DTO.MemberDAO;  //  �߰�
import DAO_DTO.MemberDTO;  //  �߰� 
/**
 * Servlet implementation class input_OK
 */
@WebServlet("/input_OK")
public class input_OK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public input_OK() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
        request.setCharacterEncoding("euc-kr");
     // ������ �Ѿ�� ������ ������ ���� 
        String type = request.getParameter("type");
        String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		MemberDAO dao = new MemberDAO();
        if(type != null)
        {
        	//delete
        	if(type.equals("delete"))
        	{
        		
        		dao.memberDelete(id);
        	}else if(type.equals("update")){
        		MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
        		dao.memberUpdate(dto);
        	}
        	response.sendRedirect("./memberSelect.jsp");
        } else 
        {
        	
    		
    		// DTO Ŭ������ dto ��ü��  �����Ͽ� �Ѿ�� �����͸� ����  
    		MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
    		dto.setName(name);
    		dto.setId(id);
    		dto.setPw(pw);
    		dto.setPhone1(phone1);
    		dto.setPhone2(phone2);
    		dto.setPhone3(phone3);
    		dto.setGender(gender);
    		
    		boolean bool = dao.registerMember(dto);
    		// �ϼ��� DTO Ŭ������ ��ü dto�� DAO Ŭ������ ȸ����� �޼ҵ忡
    		// �Ѱ�  DB �� �����ϰ�, ����� bool �� ����, �� bool ���� ���� �б�

    		if(bool) {
    			response.sendRedirect("./Member_Success.htm");
    		}
        }
		
		
	}

}
