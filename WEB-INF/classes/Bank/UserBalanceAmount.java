package Bank;

import java.lang.*;
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class UserBalanceAmount extends HttpServlet
{
	public void doGet(HttpServletRequest request ,HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("UserBalanceAmount.open");

        response.setContentType("text/html");
		
		String strResponseBuf   = "";

		PrintWriter mPrintWriter = response.getWriter();

        //session
        HttpSession session = request.getSession();

		//form fields
        String strUsername   = (String)session.getAttribute("sess_Username");
		String strPassword   = (String)session.getAttribute("sess_Password");
        int dwAccountNum     = (Integer)session.getAttribute("sess_AccountNum");

		//maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

		mFileWriter.append("\n Checking Balance:  \t"+new java.util.Date().toString());
		mFileWriter.append("\n***********************************************************");

		if(dwAccountNum == 0)
        {
            strResponseBuf = "<b><p>Invalid Details</p></b>";
			mFileWriter.append("\n Invalid Details to show balance.");
        }

       	try
		{
			//connection
            DBConnection db = new DBConnection();
            db.DBConnection();

			db.rs	= db.stmt.executeQuery("select * from customers where id ="+dwAccountNum+" AND Username='"+strUsername+"' AND Password='"+strPassword+"'");

			if(db.rs.next())
			{
				strResponseBuf  = "<b><h3>Account Details</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>DOB: " +db.rs.getString("DOB")+ "</p>"
                                    + "<p>Gender: " +db.rs.getString("gender")+ "</p>"
                                    + "<p>Phone: " +db.rs.getString("Phone")+ "</p>"
                                    + "<p>Address: " +db.rs.getString("Area")+ ", "+db.rs.getString("City")+", "+db.rs.getString("State")+", "+db.rs.getString("Zip")+"</p>"
                                    + "<p>Account Number: " +db.rs.getInt("Id")+"</p>"
                                    + "<p>Branch: " +db.rs.getString("Branch")+ "</p>"
                                    + "<p>Account Type: Savings Account</p>"
                                    + "<p>IFSC: " +db.rs.getString("IFSC")+ "</p>"
                                    + "<p>Balance: " +db.rs.getString("Amount")+ "/-</p>";							   

				mFileWriter.append("\n Account Number:"+dwAccountNum +"\t Balance: " +db.rs.getInt("Amount")+".");
			}
			else
			{
				strResponseBuf = "<b><p>Invalid Details. Please provide correct details.</p></b>";
				mFileWriter.append("\n Invalid Details to show balance.");
			}

			mFileWriter.append("\n----------------------------------------------------------------------------------------------------------------");
            
			mPrintWriter.print(strResponseBuf);
            mPrintWriter.flush();
            mPrintWriter.close();

            db.stmt.close();
            db.rs.close();
            db.con.close();

            System.out.println("UserBalanceAmount.close");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}