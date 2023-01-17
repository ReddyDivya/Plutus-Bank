package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpSession;

public class TransferAmount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("TransferAmount.open");

        response.setContentType("text/html");
        
        int dwDepositAmount = 0, dwReceiverAmount = 0, dwReceivedAmount = 0, dwDepositedAmount = 0;
        String strResponseBuf = "";

        PrintWriter mPrintWriter = response.getWriter();
        
        //form fields
        int dwAccountNum         = Integer.parseInt(request.getParameter("Taccount"));
        int dwReceiverAccountNum = Integer.parseInt(request.getParameter("RAccount"));
        int dwAmount             = Integer.parseInt(request.getParameter("Tamt1"));

       //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try 
        {
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum);
 
            if (db.rs.next()) {
                dwDepositAmount = db.rs.getInt("Amount");
            }

            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwReceiverAccountNum);
            mFileWriter.append("\n Transfer Amount:  \t"+new java.util.Date().toString());
            mFileWriter.append("\n***********************************************************");

            if (db.rs.next()) {
            
                dwReceiverAmount = db.rs.getInt("Amount");
            
                if (dwAmount >= dwDepositAmount) {
                    strResponseBuf = "<tr><td colspan = '2' style = 'color:red;'><b>INSUFFICIENT BALANCE IN  YOUR ACCOUNT</b></td></tr>";
                } else {
                    
                    dwDepositedAmount = dwDepositAmount - dwAmount;
                    dwReceivedAmount  = dwReceiverAmount + dwAmount;
                    
                    if (db.stmt.executeUpdate("update customer set Amount =" + dwDepositedAmount + " where id=" + dwAccountNum) > 0) {

                        db.stmt.addBatch("update customer set Amount =" + dwReceivedAmount + " where id =" + dwReceiverAccountNum);
                        db.stmt.executeBatch();

                        ResultSet rs1 = db.stmt.executeQuery("select * from customer");

                        if (rs1.next()) {

                            strResponseBuf = "<tr><th colspan = " + 2 + ">TRANSFER DETAILS</th></tr>"
                                    + "<tr><td><b>Depositor Account Number</b></td><td>" + dwAccountNum + "</td></tr>"
                                    + "<tr><td><b>Transferred Amount</b> </td><td><b>Rs </b>" + dwAmount + "/-</td></tr>"
                                    + "<tr><td><b>Depositor Total Balance </b></td><td><b>Rs </b>" + dwDepositedAmount + "/-</td></tr>"
                                    + "<tr><td><b>Receiver Account Number</b></td><td><b>Rs </b>" + dwReceiverAccountNum + "/-</td></tr>"
                                    +"<tr><td colspan = '2' style = 'color:green;'><b>UPDATED SUCCESSFULLY</b></td></tr>";

                            mFileWriter.append("\n Account Number:"+dwAccountNum +"\t Receiver Account Number: " +dwReceiverAccountNum+ "\t Transferred Amount: " +dwAmount+" \t Total Balance: "+ dwDepositedAmount);
                        
                        } else {
                            strResponseBuf = "<tr><td><b>Unable to transfer amount</b></td><td>" + dwAccountNum + "</td></tr>";
                            mFileWriter.append("\n Unable to transfer amount.");
                        }

                        rs1.close();
                    }
                }
            } else {
                strResponseBuf = "<b>Account doesn't exits.</b>";
                mFileWriter.append("\n Account doesn't exits.");
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

            System.out.println("TransferAmount.close");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
