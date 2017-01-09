

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FruitsServlet
 */
@WebServlet("/FruitsServlet")
public class FruitsServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] favouriteFruits=request.getParameterValues("fruit");
		PrintWriter out=response.getWriter();
		out.println("Your favourite Fruits are:");
		
		Calendar calobj = Calendar.getInstance();
		
		for(String s:favouriteFruits)
		{
			out.print(s +" ");
					
			out.print(calobj.getTime());
			out.println();
		}
		
	}

}
