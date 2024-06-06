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
            String dbPassword = "!jyw030319";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Chat> getChatList(String nowTime) {
        ArrayList<Chat> chatList = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "SELECT * FROM CHAT WHERE chatTime > ? ORDER BY chatTime";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, nowTime);
            rs = pstmt.executeQuery();
            chatList = new ArrayList<Chat>();
            while (rs.next()) {
                Chat chat = new Chat();
                chat.setRoomID(rs.getInt("roomID")); // 채팅방 아이디 설정
                chat.setChatID(rs.getInt("chatID")); // 채팅 아이디 설정
                chat.setFromID(rs.getString("fromID")); // 채팅자 아이디 설정
                chat.setChatName(rs.getString("chatName")); // 채팅자 이름 설정
                chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")); // 채팅 내용 설정 (공백, <, >, 줄바꿈 문자 처리)
                chat.setChatTime(rs.getString("chatTime")); // 채팅 시간 설정
                chatList.add(chat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return chatList;
    }

    public int submit(int roomID, String fromID, String chatName, String chatContent) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "INSERT INTO CHAT VALUES (?, NULL, ?, ?, ?, now())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, roomID); // 채팅방 아이디 설정
            pstmt.setString(2, fromID); // 채팅자 아이디 설정
            pstmt.setString(3, chatName); // 채팅자 이름 설정
            pstmt.setString(4, chatContent); // 채팅 내용 설정
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return -1;
    }
}