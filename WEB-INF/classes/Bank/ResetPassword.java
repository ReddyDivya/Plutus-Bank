package Bank;
import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ResetPassword extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        System.out.println("ResetPassword.open");

        String strResponseBuf = "";

        response.setContentType("text/html");
		
        //session
        HttpSession session = request.getSession();
		
        PrintWriter mPrintWriter = response.getWriter();
		
        //form fields
        String strUsername  = request.getParameter("username");
        String strNewPassword  = request.getParameter("newpassword");
        int dwAccountNum    = Integer.parseInt(request.getParameter("AccountNum"));

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        mFileWriter.append("\n Reset Password:  \t"+new java.util.Date().toString());
        mFileWriter.append("\n***********************************************************");

        if(dwAccountNum == 0)
        {
            strResponseBuf = "<b><p>Invalid Details</p></b>";
            mFileWriter.append("\n Invalid Details.");
        }

		try
		{
			//connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            if(db.stmt.executeUpdate("Update customers set Password ='"+strNewPassword+"', RePassword ='"+strNewPassword+"' where id = "+dwAccountNum+" AND Username ='"+strUsername+"'") > 0)
            {
                db.rs = db.stmt.executeQuery("select * from customers");
            
                if(db.rs.next())
                {   
                    strResponseBuf  = "<b><h3>Password changed successfully</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>Account Number: " +dwAccountNum+ "</p>"
                                    + "<p>New Password: " +db.rs.getString("Password")+ "</p>";
                    
                    mFileWriter.append("\n Account Number:"+dwAccountNum +"\t New Password: " +strNewPassword);
                }
                else
                {
                    strResponseBuf = "<b><p>Unable to reset password. Please try after sometime.</p></b>";
                    mFileWriter.append("\n Unable to reset password.");
                }
            }
            
            mFileWriter.append("\n----------------------------------------------------------------------------------------------------------------");
            mFileWriter.flush();
            mFileWriter.close();
            
            mPrintWriter.print(strResponseBuf);
            mPrintWriter.flush();
            mPrintWriter.close();

            db.stmt.close();
            db.rs.close();
            db.con.close();

            System.out.println("ResetPassword.close");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}