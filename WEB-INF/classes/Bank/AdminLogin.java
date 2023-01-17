package Bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AdminLogin extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println("AdminLogin.open");

        response.setContentType("text/html");

        RequestDispatcher rd  = null;
        String strResponseBuf = "";

        PrintWriter mPrintWriter = response.getWriter();

        //session
        HttpSession session = request.getSession();

        //form fields
        String strName      = request.getParameter("adminname");
        String strPassword  = request.getParameter("adminpassword");

        System.out.println("AdminLogin.open >> "+ strName);
        System.out.println("AdminLogin.open >> "+ strPassword);

        //maintaining logs
		File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "AdminLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {
            
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from admin where name='" + strName + "' AND password='" + strPassword + "'");

            if (db.rs.next()) {

                session.setAttribute("sess_AdminName", db.rs.getString("name"));
                session.setAttribute("sess_Address", db.rs.getString("Address"));
                
                //Redirecting to Admin
                rd = request.getRequestDispatcher("Admin.jsp");
                rd.forward(request, response);

                mFileWriter.append("\nAdmin Login: \t " + new java.util.Date().toString() + "\t Admin Name: " + strName);
            } else {

                strResponseBuf = "Invalid Login <img src='images/warning.gif'/>";

                mFileWriter.append("\nInvalid Admin Login: \t " + new java.util.Date().toString() + "\t Admin Name: " + strName);

                //Redirecting to adminlogin
                rd = request.getRequestDispatcher("AdminLogin.jsp");
                rd.forward(request, response);
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

            System.out.println("AdminLogin.close");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
