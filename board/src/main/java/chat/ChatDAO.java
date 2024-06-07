package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class ChatDAO {
    private Connection conn;

    public ChatDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/CHAT";
            String dbID = "root";
            String dbPassword = "4922677";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Chat> getChatListByID(String userID, String roomID, String chatID) {
        ArrayList<Chat> chatList = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL ="SELECT * FROM WHERE ((userID = ? AND roomID = ?) OR (userID =? AND roomID = ?)) AND chatID > ? ORDER BY chatTime";
		try {
			pstmt=conn.prepareStatement(SQL);
			// 다음 parameter 들로 sql 쿼리문 안에 있는 ?문자를 대체한다.
			pstmt.setString(1, userID);
			pstmt.setString(2, roomID);
			pstmt.setString(3, roomID);
			pstmt.setString(4, userID);
			pstmt.setInt(5, Integer.parseInt(chatID));
			rs=pstmt.executeQuery();    
			chatList=new ArrayList<Chat>();
			while (rs.next()) {
				Chat chat = new Chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setUserID(rs.getString("userID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setRoomID(rs.getString("roomID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setChatContent(rs.getString("chatcontent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timeType = "오전";
				if(chatTime > 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "+chatTime+":"+rs.getString("chatTime").substring(14,16)+"");
				chatList.add(chat);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close(); 
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}
    public ArrayList<Chat> getChatListByRecent(String userID, String roomID, int number) {
        ArrayList<Chat> chatList = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL ="SELECT * FROM WHERE ((userID = ? AND roomID = ?) OR (userID =? AND roomID = ?)) AND chatID > (SELECT MAX(chatID) - ? FROM CHAT) ORDER BY chatTime";
		try {
			pstmt=conn.prepareStatement(SQL);
			// 다음 parameter 들로 sql 쿼리문 안에 있는 ?문자를 대체한다.
			pstmt.setString(1, userID);
			pstmt.setString(2, roomID);
			pstmt.setString(3, roomID);
			pstmt.setString(4, userID);
			pstmt.setInt(5, number);
			rs=pstmt.executeQuery();    
			chatList=new ArrayList<Chat>();
			while (rs.next()) {
				Chat chat = new Chat();
				chat.setChatID(rs.getInt("chatID"));
				chat.setUserID(rs.getString("userID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setRoomID(rs.getString("roomID").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				chat.setChatContent(rs.getString("chatcontent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timeType = "오전";
				if(chatTime > 12) {
					timeType = "오후";
					chatTime -= 12;
				}
				chat.setChatTime(rs.getString("chatTime").substring(0,11)+" "+timeType+" "+chatTime+":"+rs.getString("chatTime").substring(14,16)+"");
				chatList.add(chat);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close(); 
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return chatList;
	}

    public int submit(String userID, String roomID, String chatContent) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "INSERT INTO CHAT VALUES (NULL, ?, ?, ?, now())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID); // 채팅방 아이디 설정
            pstmt.setString(2, roomID); // 채팅자 아이디 설정 
            pstmt.setString(3, chatContent); // 채팅 내용 설정
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
}