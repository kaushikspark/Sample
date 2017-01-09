package proj;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SigninServlet
 */
@WebServlet("/SigninServlet")


/**
* Servlet implementation class DemoSigin1
*/
public class SigninServlet extends HttpServlet 
{
      private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
      /**
      * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
      */
      protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
      {
    	  
    	  
    	  String accno = "ABCD";
          Calendar today = Calendar.getInstance();
          String date = Integer.toString(today.get(Calendar.YEAR));
          // out.println(date+" YEAR");
          accno = accno + date;

            PrintWriter out = response.getWriter();
            String username=request.getParameter("t1");
           // String name=request.getParameter("name");
          //  String panno=request.getParameter("pan");
            
            String mail=request.getParameter("t2");
            String mobile=request.getParameter("t3");
            String password=request.getParameter("t4");
          
            String address=request.getParameter("t6");
            String city=request.getParameter("t8");
            String state=request.getParameter("t9");
            String country=request.getParameter("t10");
            try
            {
                  Class.forName("oracle.jdbc.driver.OracleDriver");

                  Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:INATP02","shobana","shobana");


                        Statement stmt = conn.createStatement();
                       
                        
                        String sqlacc = "select count(*) from accountdetails";
                        ResultSet rs = stmt.executeQuery(sqlacc);
                      
                        while (rs.next())
                        {
                              if (rs.getInt(1) == 0) 
                              {
                                     
                                     accno = accno + "00000001";
                                     
                                  
                                     String sqlstr1 = "insert into accountdetails values('"+username+"','"+accno+"',10000)";
                                     rs = stmt.executeQuery(sqlstr1);

                                     String sqlStr = "insert into banks(uname,mail,mobile,password,address,city,state,country) values(";
                                     sqlStr += "'" + username + "'"; 
                                     sqlStr += ",'" + mail + "'";
                                     sqlStr += ",'" + mobile + "'";
                                     sqlStr += ",'" + password + "'";
                                     sqlStr += ",'" + address +"'" ;
                                     sqlStr += ",'" + city +"'" ;
                                     sqlStr += ",'" + state + "'";
                                     sqlStr += ",'" + country +"'" ;
                                     sqlStr+=")";
                                     
                                     
                                     System.out.println(sqlStr);
                                     ResultSet rset = stmt.executeQuery(sqlStr);
                                     
                                     
                                   
                                     if (rset.next())
                                     {
                                            response.sendRedirect("Login.jsp");
                                     }
                     }
                          
                    
                       else
                       {
                    	   
                    	    String sql="select * from banks where uname=";
                            sql +="'"+username+"'";
                            ResultSet set = stmt.executeQuery(sql);
                          
                           if(set.next()) 
                           {
                                response.sendRedirect("dummy.jsp");
                           }
                           else
                           {
                        	   
                        	   String currentacc ="";
                        	   String maxaccno = "select substr(account_number,9) from accountdetails order by substr(account_number,9) desc";
                               rs = stmt.executeQuery(maxaccno);
                               if (rs.next()) 
                               {
                                      long maxacc = Long.parseLong(rs.getString(1));
                                      maxacc = maxacc + 1;

                                      String newaccno = String.valueOf(maxacc);
                                      if (newaccno.length() < 8) 
                                      {
                                             for (int i = 0; i < (8 - newaccno.length()); i++) 
                                             {
                                                    currentacc = currentacc + "0";
                                             }
                                      }
                                      currentacc = accno + currentacc + maxacc;
                               }
                        	   
                        	   
                            
                               
                               
                               String sqlstr1 = "insert into accountdetails values('"+username+"','"+currentacc+"',10000)";
                               rs = stmt.executeQuery(sqlstr1);
                        	   
                               String sqlStr = "insert into banks(uname,mail,mobile,password,address,city,state,country) values(";
                               sqlStr += "'" + username + "'"; 
                               sqlStr += ",'" + mail + "'";
                               sqlStr += ",'" + mobile + "'";
                               sqlStr += ",'" + password + "'";
                               sqlStr += ",'" + address +"'" ;
                               sqlStr += ",'" + city +"'" ;
                               sqlStr += ",'" + state + "'";
                               sqlStr += ",'" + country +"'" ;
                               sqlStr+=")";
                               
                               
                               System.out.println(sqlStr);
                               ResultSet rset = stmt.executeQuery(sqlStr);
                        	   
                        	   
                           
                    	 
                           if (rset.next()) 
                           {
                               response.sendRedirect("Login.jsp");
                        }
                           /*else {
                               //session.invalidate();
                               out.println("<h1>INVALID!!TO TRY AGAIN <a href='Registration.html'>CLICK HERE</h1>");
                        }*/
                     
                           }
                       
                       
                       }
                   }
            }
           
            catch(ClassNotFoundException e)
            {
                  e.printStackTrace();
            }
            catch(SQLException  e)
            {
                  e.printStackTrace();
            }
      }

      }

