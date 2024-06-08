package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;

public class ChatDAO {
    private Connection conn;

    public ChatDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/CHAT";
            String dbID = "root";
            String dbPassword ="!jyw030319";
            Class.forName("com.mysql.jdbcDriver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public ArrayList<Chat> getChatList(String nowTime){
        ArrayList<Chat> chatList = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
        String SQL = "SELECT * FROM CHAT WHERE chatTime > ? ORDER BY chatTime";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, nowTime);
            rs = pstmt.executeQuery();
            chatList = new ArrayList<Chat>();
            while(rs.next()){
                Chat chat = new Chat();
                chat.setChatName(rs.getString("chatName"));
                chat.setChatContent(rs.getString("chatContent").replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
                chat.setChatTime(rs.getString("chatTime"));
                chatList.add(chat);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(rs!=null) rs.close();
                if(pstmt!=null) pstmt.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return chatList;
    }
    public int submit(String chatName, String chatContent) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL = "INSERT INTO CHAT VALUES (?, ?, now())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, chatName);
            pstmt.setString(2, chatContent);
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