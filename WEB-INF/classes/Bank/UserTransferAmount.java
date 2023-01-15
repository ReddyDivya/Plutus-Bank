package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Random; 
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpSession;

public class UserTransferAmount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("UserTransferAmount.open");

        response.setContentType("text/html");

        String strResponseBuf = "";

        //session
        HttpSession session = request.getSession();
        
        PrintWriter mPrintWriter = response.getWriter();

        //form fields
        String strUsername          = (String) session.getAttribute("sess_Username");
        String strpassword          = (String) session.getAttribute("sess_Password");
        int dwDepositorAccountNum   = (Integer)session.getAttribute("sess_AccountNum");
        int dwReceiverAccountNum    = Integer.parseInt(request.getParameter("ReceiverAccountNum"));
        int dwTransferredAmount     = Integer.parseInt(request.getParameter("amount"));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = simpleDateFormat.format(new Date());
        System.out.println(strDate);

       //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {
            
            int dwDepositorTotalBal  = 0, dwReceiverAmount  = 0, dwReceiverTotalBal = 0;

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwDepositorAccountNum + " AND Username='" + strUsername + "' AND Password='" + strpassword + "'");

            mFileWriter.append("\n Transfer Amount:  \t"+strDate);
            mFileWriter.append("\n***********************************************************");

            if (db.rs.next()) {
                dwDepositorTotalBal = db.rs.getInt("Amount");
            }

            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwReceiverAccountNum);

            if (db.rs.next()) 
            {
                dwReceiverAmount = db.rs.getInt("Amount");

                if (dwTransferredAmount > dwDepositorTotalBal) {
                    strResponseBuf = "<b><p>Insufficient Balance</p></b>";
                    mFileWriter.append("\n Insufficient Balance to transfer amount by account number: "+dwDepositorAccountNum);
                } 
                else {

                    dwReceiverTotalBal = dwReceiverAmount + dwTransferredAmount; //Receiver's total balance
                    dwDepositorTotalBal = dwDepositorTotalBal - dwTransferredAmount; //Depositor's total balance

                    //Generate Transaction ID
                    String strCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                    String strTransactionID = "";
                    Random dwRandom = new Random();

                    for (int i=0; i < 12; i++) 
                    {
                        strTransactionID += strCharacters.charAt(dwRandom.nextInt(strCharacters.length()));
                    }

                    if (db.stmt.executeUpdate("update customers set Amount =" + dwDepositorTotalBal + " where id=" + dwDepositorAccountNum + " AND Username='" + strUsername + "' AND Password='" + strpassword + "'") > 0) 
                    {
                        db.stmt.addBatch("update customers set Amount =" + dwReceiverTotalBal + " where id =" + dwReceiverAccountNum);
                        db.stmt.executeBatch();

                        ResultSet rs1 = db.stmt.executeQuery("select * from customers");

                        if (rs1.next()) 
                        {
                            strResponseBuf  = "<b><h3>Transfer Details</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>Account Number: " +dwDepositorAccountNum+ "</p>"
                                    + "<p>Branch: " +rs1.getString("Area")+ "</p>"
                                    + "<p>IFSC: " +rs1.getString("IFSC")+ "</p>"
                                    + "<p>Receiver Account Number: " +dwReceiverAccountNum+ "</p>"
                                    + "<p>Transferred Amount: " +dwTransferredAmount+ "</p>"
                                    + "<p>Transaction ID: " +strTransactionID+ "</p>"
                                    + "<p>Balance: " +dwDepositorTotalBal+ "/-</p>";

                            mFileWriter.append("\n Account Number:"+dwDepositorAccountNum +"\t Transfer Amount: " +dwTransferredAmount+ "\t Total Balance: " +dwDepositorTotalBal+".");
                        } 
                        else {
                            strResponseBuf = "<b><p>Unable to transfer amount. Please try after sometime.</p></b>";
                            mFileWriter.append("\n Unable to transfer amount by account number: "+dwDepositorAccountNum);
                        }

                        //Updating withdraw transaction in Statement
                        String strStmtQuery = "insert into bank.Statement(TrnxDate, Username, AccountNum, TrnxType, Amount, balance, TrnxId, Remark) values('"+strDate+"', '"+strUsername+"', "+dwDepositorAccountNum+", 'Transfer', "+dwTransferredAmount+", "+dwDepositorTotalBal+", '"+strTransactionID+"', 'Transferred INR "+dwTransferredAmount+" to Account Number "+dwReceiverAccountNum+"')";

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
                mFileWriter.append("\n Account number "+dwReceiverAccountNum+" is not found.");
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
            
            System.out.println("UserTransferAmount.close");
        }//try
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}//UserTransferAmount
