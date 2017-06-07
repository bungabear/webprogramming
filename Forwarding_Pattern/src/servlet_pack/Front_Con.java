package servlet_pack;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Front_Con
 */
@WebServlet("*.do")
public class Front_Con extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Front_Con() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		  System.out.println("uri : " + uri);
		  String conPath = request.getContextPath();
		  System.out.println("conPath : " + conPath);
		  String command = uri.substring(conPath.length());
		  System.out.println("command : " + command);
		  if(command.equals("/insert.do")){
			   System.out.println("insert");
			   System.out.println("----------------");

			   }else if(command.equals("/update.do")){
			   System.out.println("update");
			   System.out.println("----------------");

			   }else if(command.equals("/select.do")){
			   System.out.println("select");
			   System.out.println("----------------");

			   }else if(command.equals("/delete.do")){
			   System.out.println("delete");
			   System.out.println("----------------");
			  }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
