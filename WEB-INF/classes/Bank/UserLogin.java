package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class UserLogin extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("UserLogin.open");

        response.setContentType("text/html");

        //session
        HttpSession session = request.getSession();

        PrintWriter mPrintWriter = response.getWriter();

        String strResponseBuf = "";

        //form fields
        String strUsername = request.getParameter("Username");
        String strPassword = request.getParameter("Password");
        int dwAccountNum   = Integer.parseInt(request.getParameter("AccountNum"));
        
        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");       
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {

            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();
            
            System.out.println("select * from customers where id =" + dwAccountNum + " and Username='" + strUsername + "' and Password='" + strPassword + "'");
            
            db.rs = db.stmt.executeQuery("select * from customers where id =" + dwAccountNum + " and Username='" + strUsername + "' and Password='" + strPassword + "'");

            mFileWriter.append("\n Customer Login:  \t"+new java.util.Date().toString());
            mFileWriter.append("\n***********************************************************");

            if (db.rs.next()) {

                
                session.setAttribute("sess_AccountNum", db.rs.getInt("Id"));
                session.setAttribute("sess_Username", db.rs.getString("Username"));
                session.setAttribute("sess_Password", db.rs.getString("Password"));
                session.setAttribute("sess_Area", db.rs.getString("Area"));
                session.setAttribute("sess_City", db.rs.getString("City"));
                session.setAttribute("sess_State", db.rs.getString("State"));
                session.setAttribute("sess_ZIP", db.rs.getInt("ZIP"));
                session.setAttribute("sess_Phone", db.rs.getString("Phone"));
                session.setAttribute("sess_DOB", db.rs.getString("dob"));
                session.setAttribute("sess_Gender", db.rs.getString("Gender"));

                strResponseBuf = new StringBuilder(strUsername).append("<SEP>").append(dwAccountNum).toString();
                mFileWriter.append("\n Fullname: "+strUsername+"\tAccount Number:"+dwAccountNum);
            
            } else {

                //display login fail message to customer
                strResponseBuf = "<p style='color:red;'>Invalid Login. Please try again.</p>";
                mFileWriter.append("\n Invalid Login by account number: "+dwAccountNum);
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

            System.out.println("UserLogin.close");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
