package Bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.Date;
import java.text.DateFormat;

public class DepositAmount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("DepositAmount.open");

        response.setContentType("text/html");

        PrintWriter mPrintWriter = response.getWriter();

        int dwDepositAmount   = 0;
        String strResponseBuf = "";

        //form fields
        int dwAccountNum = Integer.parseInt(request.getParameter("Taccount"));
        int dwAmount     = Integer.parseInt(request.getParameter("Tamt1"));

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customers where id =" + dwAccountNum);

            if (db.rs.next()) {
                dwDepositAmount = dwAmount + db.rs.getInt("Amount");
            }

            if (db.stmt.executeUpdate("Update customers set Amount =" + dwDepositAmount + " where id = " + dwAccountNum) > 0) 
            {
                ResultSet rs1 = db.stmt.executeQuery("select * from customer");

                mFileWriter.append("\r\n DepositAmount.java \t");

                if (rs1.next()) {
                    strResponseBuf = "<tr><th colspan = " + 2 + ">DEPOSIT DETAILS</th></tr><tr><td><b>Account Number</b></td><td>" + dwAccountNum + "</td></tr>"
                            + "<tr><td><b>Deposited Amount</b></td><td><b>Rs </b> " + dwAmount + "/-</td></tr>"
                            + "<tr><td><b>Total Balance </b></td><td><b>Rs </b> " + dwDepositAmount + "/-</td></tr>"
                            + "<tr><td colspan = '2' style = 'color:green;'><b>UPDATED SUCCESSFULLY</b></td></tr>";
                                        
                    mFileWriter.append("\r\nDeposit Details \t" + new java.util.Date().toString() + "\r\n*************************************\r\nAccount Number -" + dwAccountNum + "\r\nDeposited Amount-Rs " + dwAmount + "/-\r\nTotal Balance- Rs " + dwDepositAmount + "/-\r\n-----------------------------------------------------------------------------");
                } else {
                    strResponseBuf = "<tr><td><b>COULDN'T DEPOSIT MONEY</b></td><td>" + dwAccountNum + "</td></tr>";
                    mFileWriter.append("\r\nDeposit Details \t" + new java.util.Date().toString() + "\r\n*************************************\r\nAccount Number -" + dwAccountNum + "\r\nCouldn't deposit amount \r\n-----------------------------------------------------------------------------");
                }

                mFileWriter.append("\r\n-----------------------------------------------------------------------------");

                rs1.close();
            }
            
            mFileWriter.flush();
            mFileWriter.close();

            mPrintWriter.print(strResponseBuf);
            mPrintWriter.flush();
            mPrintWriter.close();

            db.stmt.close();
            db.rs.close();
            db.con.close();

            System.out.println("DepositAmount.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}