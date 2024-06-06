package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bbs";
			String dbID = "root";
			String dbPW = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
    public int login(String formID, String formPW) {
    	String SQL = "SELECT PW FROM USER WHERE ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, formID);
            rs = pstmt.executeQuery();
      
            if (rs.next()) {
            	if (rs.getString(1).equals(formPW)) {
            		return 1;
            	}
            	else {
            		return 0;
            	}
            }
            return -1;
        } catch (Exception e) {
            e.printStackTrace();
       }		
       return -2;
    }
    
    public int signup (User user) {
    	String SQL = "INSERT INTO USER VAlUES (?, ?, ?, ?, ?, ?)";
    	try {
    		pstmt = conn.prepareStatement(SQL);
    		pstmt.setString(1, user.getID());
    		pstmt.setString(2, user.getPW());
    		pstmt.setString(3, user.getname());
    		pstmt.setString(4, user.getage());
    		pstmt.setString(5, user.getgender());
    		pstmt.setString(6, user.getintroduction());
    		return pstmt.executeUpdate();
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return -1;
    }
    
}
