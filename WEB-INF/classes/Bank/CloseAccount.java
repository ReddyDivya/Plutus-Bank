package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.Date;

public class CloseAccount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("CloseAccount.open");

        String strResponseBuf = "";

        response.setContentType("text/html");

        PrintWriter mPrintWriter = response.getWriter();

        //form fields
        int dwAccountNum = Integer.parseInt(request.getParameter("accountnumber"));        

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "AdminLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customers where id =" + dwAccountNum);

            if (db.rs.next()) 
            {
                int dwBalanceAmount = db.rs.getInt("Amount");

                mFileWriter.append("\n Close Account:  \t"+new java.util.Date().toString());
                mFileWriter.append("\n***********************************************************");

                if (dwBalanceAmount == 0) 
                {
                    if (db.stmt.executeUpdate("delete from  customers where id = " + dwAccountNum) > 0) 
                    {
                        ResultSet rs1 = db.stmt.executeQuery("select * from customers");

                        if (rs1.next()) 
                        {
                            mFileWriter.append("\n Account Number:"+dwAccountNum +" is closed.");
                        } 
                        else 
                        {
                            strResponseBuf = "<b><p>Unable to close account. Please try again.</p></b>";

                            mFileWriter.append("\n Account Number: "+dwAccountNum+" is not found.");
                        }

                        rs1.close();
                    }
                } 
                else
                {
                    strResponseBuf = "Unable to close account: "+dwAccountNum+". You have balance of "+dwBalanceAmount+". Empty your account before closing the account.";

                    mFileWriter.append("\n Account Number: "+dwAccountNum+" could not be closed.");
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

            System.out.println("CloseAccount.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
