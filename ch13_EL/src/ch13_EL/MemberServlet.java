package ch13_EL;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import ch13_EL.MemberBean;

@WebServlet("/MemberServlet")
/**
 * Servlet implementation class MemberServlet
 */


public class MemberServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberBean member=new MemberBean("kbsName", "kbsId", "1111");
		// 이름   아이디  비밀번호 member 객체 생성
		request.setAttribute("member", member);  // 생성된 객체를  저장
		RequestDispatcher dispatcher = request.getRequestDispatcher("el_property.jsp");
		dispatcher.forward(request, response); // 포워딩 
	}
}



