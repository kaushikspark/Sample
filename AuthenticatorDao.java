

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AuthenticatorDao
 */
@WebServlet("/AuthenticatorDao")
public class AuthenticatorDao extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd=request.getRequestDispatcher("/AuthenticatorDaoImpl");
		String name=request.getParameter("uname");
		String password=request.getParameter("pass");
		PrintWriter out=response.getWriter();
		/*out.println(name);
		out.println(password);*/
		request.setAttribute("Uname", name);
		request.setAttribute("Password",password);
		rd.forward(request, response);
		
				
	}

}
