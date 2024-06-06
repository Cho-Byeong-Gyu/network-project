package chat;

public class Chat{
	
	int roomID;  // 채팅방 아이디
	int chatID;  // 채팅 하나의 아이디
	String fromID;  // 채팅자 이이디
    String chatName;  // 채팅자 이름
    String chatContent;  // 채팅 내용
    String chatTime;   // 시간

    
    public int getRoomID () {
    	return roomID;
    }    
    public void setRoomID(int roomID) {
    	this.roomID = roomID;
    }
    public int getChatID () {
    	return chatID;
    }    
    public void setChatID(int chatID) {
    	this.chatID = chatID;
    }
    public String getFromID () {
    	return fromID;
    }    
    public void setFromID(String fromID) {
    	this.fromID = fromID;
    }
    public String getChatName() {
        return chatName;
    }
    public void setChatName(String chatName) {
        this.chatName = chatName;
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