package proj;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bank.Bean.Bean;
import com.bank.Bean.Bean.*;

/**
* Servlet implementation class DemoLogin1
*/
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
                private static final long serialVersionUID = 1L;
       
   
                protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                                // TODO Auto-generated method stub
                	
                                PrintWriter out = response.getWriter();
                                String username=request.getParameter("t1");
                                String password=request.getParameter("t4");
                                //out.println(username);
                                HttpSession session=request.getSession();
                                
                                session.setAttribute("name",username);
                               
                                try{
                                                Class.forName("oracle.jdbc.driver.OracleDriver");

                                                Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:INATP02","shobana","shobana");


                                                                Statement stmt = conn.createStatement();
                                                                
                                                                
                                                                
                                                                
                                                                
                                                                String sqlStr = "select * from banks,accountdetails where banks.uname=accountdetails.uname and banks.uname='" + username + "' and banks.password ='" + password + "'";
                                                                ResultSet rset = stmt.executeQuery(sqlStr);
                                                                Bean bean=new Bean();
                                                               System.out.println("before");
                                                                if(rset.next()) {
                                                                	System.out.println("after"); 	
                                                                	
                                                                	
                                                                	   bean.setAccount_number(rset.getString("account_number"));
                                                                       bean.setUname(rset.getString("uname"));
                                                                       bean.setMail(rset.getString("mail"));
                                                                       Bean.setMobile(rset.getLong("mobile"));
                                                                       bean.setAddress(rset.getString("address"));
                                                                       bean.setCity(rset.getString("city"));
                                                                       bean.setState(rset.getString("state")); 
                                                                       bean.setCountry(rset.getString("country"));
                                                                       bean.setBalance(rset.getInt("balance"));
                                                                	
                                                                             response.sendRedirect("Userhome.jsp");
                                                                            System.out.print("ifloop");
                                                }
                                                                else{
                                                                	response.sendRedirect("Login.jsp");
                                                                	//out.print("elseloop");
                                                                }
                                                                
                                                                	
                                                                
                                                                }
                                                                catch(ClassNotFoundException e){
                                                                                e.printStackTrace();
                                                                }
                                                                catch(SQLException  e){
                                                                                e.printStackTrace();
                                                                }
                                
                
                                }

}
