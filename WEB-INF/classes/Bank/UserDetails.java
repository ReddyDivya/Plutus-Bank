package Bank;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.HashMap;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONObject;

public class UserDetails extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("UserDetails.open");

        response.setContentType("text/html");

        PrintWriter mPrintWriter = response.getWriter();

        JSONArray mJSONArray   = new JSONArray();
        JSONObject mJSONObject = new JSONObject();
        HashMap mHashMap       = new HashMap();

        //maintaining logs
        File mFile = new File("D:\\Divya\\Program\\Apache Software Foundation\\Tomcat 10.0\\webapps\\Plutus-Bank\\Logs\\" + "AdminLogs.txt");
        FileWriter mFileWriter = new FileWriter(mFile, true);

        try {
            
            //connection
            DBConnection db = new DBConnection();
            db.DBConnection();

            db.rs = db.stmt.executeQuery("select * from customers order by Id");
            
            mFileWriter.append("\n Checking customer details:  \t"+new java.util.Date().toString());
            mFileWriter.append("\n***********************************************************");
            
            while (db.rs.next()) {
                mHashMap.put("Name", db.rs.getString("Username"));
                mHashMap.put("Amount", db.rs.getInt("Amount"));
                mHashMap.put("Address", db.rs.getString("Area") + ", \t" + db.rs.getString("City") +", \t"+ db.rs.getString("State") +", \t"+db.rs.getString("Zip"));
                mHashMap.put("Phone", db.rs.getString("Phone"));
                mHashMap.put("Id", db.rs.getString("Id"));
                mHashMap.put("dob", db.rs.getString("dob"));
                mHashMap.put("Gender", db.rs.getString("Gender"));
                mHashMap.put("Area", db.rs.getString("Area"));
                mHashMap.put("City", db.rs.getString("City"));
                mHashMap.put("State", db.rs.getString("State"));
                mHashMap.put("Zip", db.rs.getString("ZIP"));

                mJSONArray.put(mHashMap);
            }//while

            mJSONObject.accumulate("info", mJSONArray);

            mPrintWriter.print(mJSONObject.toString());
            mPrintWriter.flush();

            mFileWriter.append("\n----------------------------------------------------------------------------------------------------------------");
            mFileWriter.flush();
            mFileWriter.close();
            
            db.stmt.close();
            db.rs.close();
            db.con.close();

            System.out.println("UserDetails.close");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
