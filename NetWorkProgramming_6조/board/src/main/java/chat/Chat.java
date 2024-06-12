package chat;

public class Chat{
	
	int chatID;
	String roomID;  // 채팅방 아이디
	String userID;  // 채팅자 이이디
    String chatContent;  // 채팅 내용
    String chatTime;   // 시간

    
    public String getRoomID () {
    	return roomID;
    }    
    public void setRoomID(String roomID) {
    	this.roomID = roomID;
    }
    public int getChatID () {
    	return chatID;
    }    
    public void setChatID(int chatID) {
    	this.chatID = chatID;
    }
    public String getUserID () {
    	return userID;
    }    
    public void setUserID(String userID) {
    	this.userID = userID;
    }
    public String getChatContent() {
        return chatContent;
    }
    public void setChatContent(String chatContent) {
        this.chatContent = chatContent;
    }

    public String getChatTime() {
        return chatTime;
    }

    public void setChatTime(String chatTime) {
        this.chatTime = chatTime;
    }
}