package Bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class OpenNewAccount extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("OpenNewAccount.open");

        response.setContentType("text/html");

        String strResponseBuf = "";

        PrintWriter mPrintWriter = response.getWriter();

        //form fields
        String strUsername  = request.getParameter("username");
        String strPassword  = request.getParameter("password");
        String strRepassword= request.getParameter("repassword");
        double dwAmount     = Double.parseDouble(request.getParameter("amount"));
        
        //Address
        String strArea      = request.getParameter("area");
        String strCity      = request.getParameter("city");
        String strState     = request.getParameter("state");
        int    dwZip        = Integer.parseInt(request.getParameter("zip"));

        String strPhone     = request.getParameter("phone");
        String strDOB       = request.getParameter("DOB");
        String strGender    = request.getParameter("gender");

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "AdminLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();
            
            String strIFSC = "";
            
            db.rs = db.stmt.executeQuery("select ifsc from bank.branches where branch='"+strArea+"'");
            if(db.rs.next())
            {
                strIFSC = db.rs.getString("ifsc");//ifsc code
            }

            String strQuery = "insert into customers(Amount, Username, Password, RePassword, Area, City, State, Zip, Phone, DOB, Gender, AccountType, Branch, IFSC) values(" + dwAmount + ",'" + strUsername + "','" + strPassword + "','" + strRepassword + "','" + strArea + "','" + strCity + "','" + strState + "','" + dwZip + "','" + strPhone + "','" + strDOB + "','" + strGender + "','Savings Account','" + strArea + "','" + strIFSC + "')";
            System.out.println("\n strQuery >> "+ strQuery);

            if (db.stmt.executeUpdate(strQuery) > 0) 
            {
                mFileWriter.append("\n Adding New Account:  \t"+new java.util.Date().toString());
                mFileWriter.append("\n***********************************************************");

                db.rs = db.stmt.executeQuery("select Id from customers Order by Id desc limit 1");

                if (db.rs.next()) {

                    strResponseBuf  = "<b><h3>Account Details</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>DOB: " +strDOB+ "</p>"
                                    + "<p>Gender: " +strGender+ "</p>"
                                    + "<p>Phone: " +strPhone+ "</p>"
                                    + "<p>Address: " +strArea+ ", "+strCity+", "+strState+", "+dwZip+"</p>"
                                    + "<p>Account Number: " +db.rs.getInt("Id")+"</p>"
                                    + "<p>Branch: " +strArea+ "</p>"
                                    + "<p>Account Type: Savings Account</p>"
                                    + "<p>IFSC: " +strIFSC+ "</p>"
                                    + "<p>Balance: " +dwAmount+ "/-</p>";

                    mFileWriter.append("\n New Account Number:"+db.rs.getInt("Id") +"\t Username: " +strUsername+" is created.");

                } else {
                    strResponseBuf = "<p>invalid. Unable to create an account. Ty again after sometime.</p></b>";
                    mFileWriter.append("\n Unable to create an account.");
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

            System.out.println("OpenNewAccount.close"); 
        } catch (Exception ex) {
            ex.printStackTrace();

        }
    }
}
