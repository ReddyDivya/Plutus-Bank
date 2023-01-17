package Bank;

import java.lang.*;
import java.io.*;
import javax.sql.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class EditProfile extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        System.out.println("EditProfile.open");

        response.setContentType("text/html");

        String strResponseBuf = "";

        PrintWriter mPrintWriter = response.getWriter();

        //form fields
        String strUsername  = request.getParameter("username");
        String strDOB       = request.getParameter("DOB");
        String strPhone     = request.getParameter("phone");
        int dwAccountNum    = Integer.parseInt(request.getParameter("accountnumber"));
            
        //Address
        String strArea      = request.getParameter("area");
        String strCity      = request.getParameter("city");
        String strState     = request.getParameter("state");
        int    dwZip        = Integer.parseInt(request.getParameter("zip"));

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {
            
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();
            
            db.rs = db.stmt.executeQuery("select * from customers where id=" + dwAccountNum);
            
            if (db.rs.next()) 
            {       
                if (db.stmt.executeUpdate("update customers set Username ='"+strUsername+"', DOB='"+strDOB+"', Phone='"+strPhone+"', Area='"+strArea+"', City='"+strCity+"', State='"+strState+"', ZIP="+dwZip+" where Id =" + dwAccountNum) > 0) {

                    db.rs = db.stmt.executeQuery("select * from customers where id =" + dwAccountNum);

                    if (db.rs.next()) 
                    {
                        strResponseBuf  = "<b><h3>Updated Profile Successfully</h3></b>"
                                    + "<p>Username: " +strUsername+ "</p>"
                                    + "<p>Account Number: " +dwAccountNum+ "</p>"
                                    + "<p>DOB: " +strDOB+ "</p>"
                                    + "<p>Phone: " +strPhone+ "</p>"
                                    + "<p>Area: " +strArea+ "</p>"
                                    + "<p>City: " +strCity+ "</p>"
                                    + "<p>State: " +strState+ "</p>"
                                    + "<p>ZIP: " +dwZip+ "</p>";
                        
                        mFileWriter.append("\n Account Number:"+dwAccountNum +"\t Username: '" +strUsername+ "'\t DOB: '" +strDOB+"'\t Phone: '" +strPhone+"'\t Area: '" +strArea+ "'\t City: '" +strCity+"'\t ZIP: "+dwZip+".");

                    } else 
                    {
                        strResponseBuf = "<b><p>Unable to update profile. Please try after sometime.</p></b>";
                        mFileWriter.append("\n Unable to update profile.");
                    }
                }

                //Update Statement Table
                if (db.stmt.executeUpdate("update statement set Username ='"+strUsername+"' where AccountNum =" + dwAccountNum) > 0) {

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

            System.out.println("EditProfile.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
