package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpSession;

public class UserWithdrawAmount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("UserWithdrawAmount.open");

        response.setContentType("text/html");
        PrintWriter mPrintWriter = response.getWriter();

        int dwAmount = 0;
        String strResponseBuf = "";

        //session
        HttpSession session      = request.getSession();
        
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
        
        //form fields
        // String strpassword     = (String) session.getAttribute("sess_Password");
        int dwWithdrawAmount   = Integer.parseInt(request.getParameter("amount"));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = simpleDateFormat.format(new Date());
        System.out.println(strDate);

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);
        
        try {

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            //resultset
            // db.rs = db.stmt.executeQuery("select Amount from customers where id=" + dwAccountNum + " and  Username= '" + strUsername + "' and Password = '" + strpassword + "'");
            db.rs = db.stmt.executeQuery("select Amount from customers where id=" + dwAccountNum + " and  Username= '" + strUsername + "'");
            
            mFileWriter.append("\n Withdraw Amount:  \t"+strDate);
            mFileWriter.append("\n***********************************************************");

            if (db.rs.next()) {
                dwAmount = db.rs.getInt("Amount");
            }

            // db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum + " and  Username= '" + strUsername + "' and Password = '" + strpassword + "'");
            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum + " and  Username= '" + strUsername + "'");

            if (db.rs.next()) 
            {
                if (dwWithdrawAmount > dwAmount) 
                {
                    strResponseBuf = "<b><p>Insufficient Balance</p></b>";
                    mFileWriter.append("\n Insufficient Balance to withdraw amount by account number: "+dwAccountNum);
                }
                else
                {
                    dwAmount = db.rs.getInt("Amount") - dwWithdrawAmount;

                    // if (db.stmt.executeUpdate("Update customers set Amount =" + dwAmount + " where id = " + dwAccountNum + " AND Username='" + strUsername + "' AND Password='" + strpassword + "'") > 0) 
                    if (db.stmt.executeUpdate("Update customers set Amount =" + dwAmount + " where id = " + dwAccountNum + " AND Username='" + strUsername + "'") > 0) 
                    {
                        // db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum + " AND  Username= '" + strUsername + "' AND Password = '" + strpassword + "'");
                        db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum + " AND  Username= '" + strUsername + "'");

                        ResultSet rs1 = db.stmt.executeQuery("select * from customers");

                        if (rs1.next()) {
                            
                            strResponseBuf  = "<b><h3>Withdraw Details</h3></b>"
                                    + "<p>Full Name: " +strUsername+ "</p>"
                                    + "<p>Account Number: " +dwAccountNum+ "</p>"
                                    + "<p>Withdrawn Amount: " +dwWithdrawAmount+ "</p>"
                                    + "<p>Balance: " +dwAmount+ "/-</p>";

                            mFileWriter.append("\n Account Number:"+dwAccountNum +"\t Withdrawn Amount: " +dwWithdrawAmount+ "\t Total Balance: " +dwAmount+".");
                        } 
                        else {
                            strResponseBuf = "<b><p>Unable to withdraw amount. Please try after sometime.</p></b>";
                            mFileWriter.append("\n Unable to withdraw amount by account number: "+dwAccountNum);
                        }

                        //Updating withdraw transaction in Statement
                        String strStmtQuery = "insert into bank.Statement(TrnxDate, Username, AccountNum, TrnxType, Amount, balance, Remark) values('"+strDate+"', '"+strUsername+"', "+dwAccountNum+", 'Withdraw', "+dwWithdrawAmount+", "+dwAmount+", 'Withdrawn INR "+dwWithdrawAmount+"')";

                        System.out.println("Statement >> "+ strStmtQuery);

                        if(db.stmt.executeUpdate(strStmtQuery)  > 0 )
                        {

                        }

                        rs1.close();
                    }
                }
            }
            else
            {
                strResponseBuf = "<b><p>Account not found.</p></b>";
                mFileWriter.append("\n Account number "+dwAccountNum+" is not found.");
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

            System.out.println("UserWithdrawAmount.close"); 
        }//try 
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}//UserWithdrawAmount
