package Bank;

import java.io.*;
import java.util.*;
import java.sql.ResultSet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class WithdrawAmount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("WithdrawAmount.open");

        response.setContentType("text/html");

        PrintWriter mPrintWriter = response.getWriter();

        int dwAmount = 0;
        String strResponseBuf = "";
        
        //form fields
        int dwAccountNum     = Integer.parseInt(request.getParameter("Taccount"));
        int dwWithdrawAmount = Integer.parseInt(request.getParameter("Tamt1"));
        
        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);
      
        try {

             //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            //query
            String strQuery = "select Amount from customer where id=" + dwAccountNum;
            
            db.rs = db.stmt.executeQuery(strQuery);

            if (db.rs.next()) {
                dwAmount = db.rs.getInt(1);
            }

            strQuery = "select * from customer where id=" + dwAccountNum;

            db.rs = db.stmt.executeQuery(strQuery);
            
            if (db.rs.next()) {
                if (dwWithdrawAmount > dwAmount) {
                    strResponseBuf = "<tr><td style ='color:red;'><b>Insufficient Balance</b></td></tr>";
                } 
                else 
                {
                    dwAmount = db.rs.getInt("Amount") - dwWithdrawAmount;

                    if (db.stmt.executeUpdate("Update customers set Amount =" + dwAmount + " where id = " + dwAccountNum) > 0) 
                    {
                        db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum);
                    
                        ResultSet rs1 = db.stmt.executeQuery("select * from customers");
                    
                        if (rs1.next()) {
                            strResponseBuf = "<tr><th colspan = " + 2 + ">WITHDRAW DETAILS</th><tr><td><b>Account Number</b></td><td>" + dwAccountNum + "</td></tr>"
                                    + "<tr><td><b>Withdrawn Amount</b></td><td><b>Rs </b>" + dwWithdrawAmount + "/-</td></tr>"
                                    + "<tr><td><b>Total Balance </b></td><td><b>Rs </b>" + dwAmount + "/-</td></tr>"
                                    + "<tr><td colspan = '2' style = 'color:green;'><b>UPDATED SUCCESSFULLY</b></td></tr>";
                            String value = "\r\nWithDraw Details \t" + new java.util.Date().toString() + "\r\n************************************************\r\nAccount Number-" + dwAccountNum + "\r\nWith Draw Amount-" + dwWithdrawAmount + "\r\nTotal Balance-" + dwAmount + "\r\n-----------------------------------------------------------------------------";
                            mFileWriter.append(value);
                        } else {
                            strResponseBuf = "<tr><td><b>Unable to withdraw money from Account</b></td><td>" + dwAccountNum + "</td></tr>";
                        }

                        rs1.close();
                    }
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

            System.out.println("WithdrawAmount.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
