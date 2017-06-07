package DAO_DTO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO_DTO.MemberDAO;  //  추가
import DAO_DTO.MemberDTO;  //  추가 
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
     // 폼에서 넘어온 데이터 변수에 저장 
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
        	
    		
    		// DTO 클래스의 dto 객체를  생성하여 넘어온 데이터를 저장  
    		MemberDTO dto = new MemberDTO(name, id, pw, phone1, phone2, phone3, gender);
    		dto.setName(name);
    		dto.setId(id);
    		dto.setPw(pw);
    		dto.setPhone1(phone1);
    		dto.setPhone2(phone2);
    		dto.setPhone3(phone3);
    		dto.setGender(gender);
    		
    		boolean bool = dao.registerMember(dto);
    		// 완성된 DTO 클래스의 객체 dto를 DAO 클래스의 회원등록 메소드에
    		// 넘겨  DB 에 저장하고, 결과를 bool 로 저장, 이 bool 값에 따라 분기

    		if(bool) {
    			response.sendRedirect("./Member_Success.htm");
    		}
        }
		
		
	}

}
