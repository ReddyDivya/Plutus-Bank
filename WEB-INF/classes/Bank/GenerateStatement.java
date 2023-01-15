package Bank;

import java.lang.*;
import java.io.*;
import java.sql.*;
import javax.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONObject;


public class GenerateStatement extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("GenerateStatement.open");

        response.setContentType("text/html");

        String strResponseBuf = "";

        //session
        HttpSession session = request.getSession();
        
        PrintWriter mPrintWriter = response.getWriter();

        String strUsername = "";
        int dwAccountNum  = 0;
        //form fields
        if(session.getAttribute("sess_AccountNum") == null)
        {
            strUsername         = request.getParameter("username");
            dwAccountNum        = Integer.parseInt(request.getParameter("accountnumber"));
        }
        else
        {
            strUsername             = (String) session.getAttribute("sess_Username");
            dwAccountNum            = (Integer)session.getAttribute("sess_AccountNum");
        }

        String strFromDate          = request.getParameter("fromDate");
        String strToDate            = request.getParameter("toDate");

        JSONArray mJSONArray   = new JSONArray();
        JSONObject mJSONObject = new JSONObject();
        HashMap mHashMap       = new HashMap();

       //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\OnlineBanking\\Logs\\" + "UserLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        mFileWriter.append("\n Generate Statement:  \t"+new java.util.Date().toString());
        mFileWriter.append("\n***********************************************************");

        try {
            
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from Statement where AccountNum=" + dwAccountNum + " AND Username='" + strUsername + "' AND TrnxDate BETWEEN '"+strFromDate+"' AND '"+strToDate+"'");

            while (db.rs.next()) 
            {
                mHashMap.put("TrnxDate", db.rs.getString("TrnxDate"));
                mHashMap.put("Username", db.rs.getString("Username"));
                mHashMap.put("AccountNum", db.rs.getInt("AccountNum"));
                mHashMap.put("TrnxType", db.rs.getString("TrnxType"));
                mHashMap.put("Amount", db.rs.getInt("Amount"));
                mHashMap.put("AvailBalance", db.rs.getInt("Balance"));
                mHashMap.put("Remark", db.rs.getString("Remark"));

                mJSONArray.put(mHashMap);
            }//while
            
            mJSONObject.accumulate("StmtDetails", mJSONArray);

            mPrintWriter.print(mJSONObject.toString());
            mPrintWriter.flush();
            
            mFileWriter.append("\n----------------------------------------------------------------------------------------------------------------");
            mFileWriter.flush();
            mFileWriter.close();

            db.stmt.close();
            db.rs.close();
            db.con.close();
            
            System.out.println("GenerateStatement.close");
        }//try
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}//GenerateStatement
