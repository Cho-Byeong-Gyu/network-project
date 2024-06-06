package calendar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
import user.User;

public class calendarDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	public calendarDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/calendar";
			String dbID = "root";
			String dbPW = "4922677";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		} catch (Exception e){
			e.printStackTrace();	
		}
	}

		
		public int schedule_Save(String schedule_Date, String schedule_Content) {
			String SQL= "INSERT INTO SCHEDULE VALUES (?, ?)";
	     		try {
				PreparedStatement pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, schedule_Date);
				pstmt.setString(2, schedule_Content);

				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}			
			return -1;		
		}
		
		public int schedule_Write(int year, int month, int day) {
			int count = 0;
     		try {
     		    String date = String.format("%04d-%02d-%02d", year, month, day);
     		    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
     		    java.util.Date parsedDate = format.parse(date);
     		    java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
     		    System.out.println(sqlDate);
     			
     			String SQL =  " SELECT COUNT(*) cnt FROM SCHEDULE WHERE schedule_Date = ?";
     			pstmt = conn.prepareStatement(SQL);
     	        pstmt.setDate(1, sqlDate);
     	        rs = pstmt.executeQuery();
                
                
                if (rs.next()) {
                    count = rs.getInt("cnt");
                }
     			
     			return count;
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
     		return count;
		}
		
		
		public String getFormatDate (int year, int month, int day) {
			String date = String.format("%04d-%02d-%02d", year, month, day);
			return date;
		}
		
		public ArrayList<String> schedule_List (String Fdate) {
			ArrayList<String> schedules = new ArrayList<>();
			try {
				String SQL = "SELECT schedule_Content FROM SCHEDULE WHERE schedule_Date = ?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, Fdate);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					schedules.add(rs.getString("schedule_Content"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return schedules;
		}
		
		public int Schedule_Delete (String schedule_Date, String schedule_Content) {
			String SQL = "DELETE FROM SCHEDULE WHERE schedule_Date = ? AND schedule_Content = ?";
			
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, schedule_Date);
				pstmt.setString(2, schedule_Content);
				
				return pstmt.executeUpdate(); 
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;  
		}
}