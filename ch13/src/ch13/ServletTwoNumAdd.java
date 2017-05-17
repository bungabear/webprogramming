package ch13;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletTwoNumAdd
 */
@WebServlet("/TwoNumAdd")
public class ServletTwoNumAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTwoNumAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		int num1=20;
//		int num2=30;
//		int add = num1 + num2;
//		PrintWriter out = response.getWriter();
//		out.println(num1+"+"+num2+"="+add);
		int num1 = 200;
		int num2 = 100;
		int add = num1 + num2;
		request.setAttribute("n1", num1);
		request.setAttribute("n2", num2);
		request.setAttribute("hap", add);
		//뷰를 사용하기위해 데이터 전송
		RequestDispatcher dispatcher = request.getRequestDispatcher("Add.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
