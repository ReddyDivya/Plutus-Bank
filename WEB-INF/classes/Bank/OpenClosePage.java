package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class OpenClosePage extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("OpenClosePage.open");
        
        response.setContentType("text/html");
		
        String strResponseBuf   =   "";

        PrintWriter mPrintWriter = response.getWriter();
        
        //form fields
        String strfullname = request.getParameter("Tname");
		String strPassword = request.getParameter("Tpassword");
		int dwAccountNum   = Integer.parseInt(request.getParameter("Taccount"));

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {
            
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customer where id =" + dwAccountNum +" AND Username='"+strfullname+"' AND Password= '"+strPassword+"'");
            
			if (db.rs.next()) 
			{   
                int dwBalanceAmount = db.rs.getInt("Amount");

                if(dwBalanceAmount == 0)
                {
                    if (db.stmt.executeUpdate("delete from  customers where id = "+ dwAccountNum +" AND Username='"+strfullname+"' AND Password= '"+strPassword+"'") > 0)
                    {
                        ResultSet rs1 = db.stmt.executeQuery("select * from customers");

                        if(rs1.next())
                        {
                            strResponseBuf = "<tr><th colspan = "+2+">ACCOUNT CLOSE</th>  </tr><tr><td>Account Number</td><td>"+dwAccountNum+"</td></tr><tr><td>>Username</td><td>"+strfullname+"</td></tr><tr><td>Account has been deleted</td></tr>";
                        }
                        else 
                        {
                            strResponseBuf = "<tr><td>Account Not Found</td></tr>";
                        }

                        rs1.close();
                    }
                }
                else
                {
                    strResponseBuf = "<tr><td>Account Balance </td><td>"+dwBalanceAmount+"</td></tr>"
                            + "<tr><td>To Close the Account balance must be empty </td></tr> ";
                }
		    }

            mFileWriter.flush();
            mFileWriter.close();

			mPrintWriter.print(strResponseBuf);
			mPrintWriter.flush();
			mPrintWriter.close();
			
            db.stmt.close();
            db.rs.close();
            db.con.close();

            System.out.println("OpenClosePage.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
