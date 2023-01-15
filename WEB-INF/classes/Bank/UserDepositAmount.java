package Bank;
import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class UserDepositAmount extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
        System.out.println("UserDepositAmount.open");

        String strResponseBuf = "";
        int dwAmount = 0 ;

        response.setContentType("text/html");
		
        //session
        HttpSession session = request.getSession();
		
        PrintWriter mPrintWriter = response.getWriter();

        String strUsername = "";
        int dwAccountNum   = 0;

        //form fields
        if(session.getAttribute("sess_AccountNum") == null)
        {
            strUsername         = request.getParameter("username");
            dwAccountNum        = Integer.parseInt(request.getParameter("accountnumber"));
        }
        else
        {
            strUsername         = (String)session.getAttribute("sess_Username");
            dwAccountNum        = (Integer)session.getAttribute("sess_AccountNum");
        }
        
		// String strPassword   = (String)session.getAttribute("sess_Password");
        int dwDepositedAmount= Integer.parseInt(request.getParameter("Amount"));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = simpleDateFormat.format(new Date());

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        mFileWriter.append("\n Deposit Amount:  \t"+ strDate);
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

            // db.rs = db.stmt.executeQuery("select * from customers where id ="+dwAccountNum+" AND Username='"+strUsername+"' AND Password='"+strPassword+"'");
            db.rs = db.stmt.executeQuery("select * from customers where id ="+dwAccountNum+" AND Username='"+strUsername+"'");

            System.out.println("insert into bank.Statement(TrnxDate, Username, AccountNum, TrnxType, Amount, balance, Remark) values('"+strDate+"', '"+strUsername+"', "+dwAccountNum+", 'Deposit', "+dwDepositedAmount+", "+dwAmount+", 'Depositted INR "+dwDepositedAmount+"')");

			if(db.rs.next())
			{
				dwAmount = dwDepositedAmount + db.rs.getInt("Amount");
			}

            // if(db.stmt.executeUpdate("Update customers set Amount ="+dwAmount+" where id = "+dwAccountNum+" AND Username ='"+strUsername+"' AND Password = '"+strPassword+"'") > 0)
            if(db.stmt.executeUpdate("Update customers set Amount ="+dwAmount+" where id = "+dwAccountNum+" AND Username ='"+strUsername+"'") > 0)
            {
                ResultSet rs1 = db.stmt.executeQuery("select * from customers");

                if(rs1.next())
                {   
                    strResponseBuf  = "<b><h3>Deposit Details</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>Account Number: " +dwAccountNum+ "</p>"
                                    + "<p>Deposited Amount: " +dwDepositedAmount+ "</p>"
                                    + "<p>Balance: " +dwAmount+ "/-</p>";
                            
                    mFileWriter.append("\n Account Number:"+dwAccountNum +"\t Deposited Amount: " +dwDepositedAmount+ "\t Total Balance: " +dwAmount+".");
                }
                else
                {
                    strResponseBuf = "<b><p>Unable to deposit amount. Please try after sometime.</p></b>";
                    mFileWriter.append("\n Unable to deposit amount.");
                }
        
                //Updating deposit transaction in Statement
                String strStmtQuery = "insert into bank.Statement(TrnxDate, Username, AccountNum, TrnxType, Amount, balance, Remark) values('"+strDate+"', '"+strUsername+"', "+dwAccountNum+", 'Deposit', "+dwDepositedAmount+", "+dwAmount+", 'Depositted INR "+dwDepositedAmount+"')";

                if(db.stmt.executeUpdate(strStmtQuery)  > 0 )
                {

                }

                rs1.close();
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

            System.out.println("UserDepositAmount.close");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}