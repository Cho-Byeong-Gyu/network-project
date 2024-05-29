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

//public int login(String formID, String formPW) {
//	 try {
//			if ("qwer".equals(formID) && "1234".equals(formPW) ) {
//				return 1;
//			}else if ("qwer".equals(formID)){
//				return 0;
//			}
//			return -1;
//	 } catch (Exception e) {
//           e.printStackTrace();
//    }	
//	 return -2;
//}
//
//public boolean login(String formID, String formPW) {
//    try {
//    	String SQL = "SELECT ID, PW FROM USER";
//        PreparedStatement pstmt = conn.prepareStatement(SQL);
//        rs = pstmt.executeQuery();
//  
//        while (rs.next()) {
//            String dbID = rs.getString("ID");
//            String dbPW = rs.getString("PW");
//        	if (formID.equals(dbID) && formPW.equals(dbPW) ) {
//        		return true;
//        	}
//        }
//        return false;
//    } catch (Exception e) {
//        e.printStackTrace();
//   }		
//    return false;
//}

}
