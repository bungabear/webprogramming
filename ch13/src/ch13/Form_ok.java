package ch13;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Form_ok
 */
@WebServlet("/Form_ok")
public class Form_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Form_ok() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=euc-kr");
		// ������ �� ���İ�  ��� ����
		request.setCharacterEncoding("euc-kr");
		// 
		System.out.println("doPost");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String[] hobbys = request.getParameterValues("hobby");
		String major = request.getParameter("major");
		String protocol = request.getParameter("protocol");	
		//weiter  �������� ����ϱ� ���� ��Ʈ�� ��ü 	
		PrintWriter writer = response.getWriter();	
		writer.println("<br><html><head></head><body>");
		writer.println(" �̸� : " + name + "<br />");
		writer.println("���̵� : " + id + "<br />");
		writer.println("��й�ȣ : " + pw + "<br />" );
		writer.println("��� : " + Arrays.toString(hobbys) + "<br />");
		writer.println("���� : " + major + "<br />");
		writer.println("�������� : " + protocol);
		writer.println("</body></html>");	

	}

}
