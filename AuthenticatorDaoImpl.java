

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AuthenticatorDaoImpl
 */
@WebServlet("/AuthenticatorDaoImpl")
public class AuthenticatorDaoImpl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Name=(String)request.getAttribute("name");
		String Password=(String)request.getAttribute("password");
		String URL="jdbc:oracle:thin:@10.232.71.29:1521:inatp02";
		String User="shobana";
		String Pass="shobana";
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("KK1");
			Connection conn=DriverManager.getConnection(URL,User,Pass);
			System.out.println("KK2");
			Statement statement=conn.createStatement();
			System.out.println("KK3");
			String Insert="Insert into  JSP values('"+Name+"','"+Password+"')";
			System.out.println("KK4");
			ResultSet rs=statement.executeQuery(Insert);
			System.out.println("KK5");
			if(rs.next())
			{
				response.sendRedirect("LoginSuccessfull.jsp");
			}
			else
			{
				response.sendRedirect("Error.jsp");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		
	}

	
}
