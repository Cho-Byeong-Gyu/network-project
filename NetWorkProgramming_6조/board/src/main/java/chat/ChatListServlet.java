package chat;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatSubmitServlet
 */
@WebServlet("/chatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String roomID =request.getParameter("roomID");
		String userID=request.getParameter("userID");
		String listType = request.getParameter("listType");
		if(roomID==null || roomID.equals("") || userID==null || userID.equals("") || 
				listType==null || listType.equals("")) {
			response.getWriter().write("");
		}else if(listType.equals("ten")){
			 response.getWriter().write(getTen(URLDecoder.decode(userID, "UTF-8"), URLDecoder.decode(roomID,"UTF-8")));
		}else {
			try {
				response.getWriter().write(getID(URLDecoder.decode(userID, "UTF-8"), URLDecoder.decode(roomID, "UTF-8"), listType));
			}catch(Exception e) {
				response.getWriter().write("");
			}
		}
	}
	public String getTen(String userID, String roomID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<Chat> chatList = chatDAO.getChatListByRecent(userID, roomID, 10);
	
		if(chatList.size()==0) return "";
		for(int i=0; i<chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getRoomID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i!= chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getChatID()+"\"}");
		return result.toString();
	}
	public String getID(String userID, String roomID, String chatID) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<Chat> chatList = chatDAO.getChatListByID(userID, roomID, chatID);
			if(chatList.size()==0) return "";
		for(int i=0; i<chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getRoomID() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i!= chatList.size() -1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getChatID()+"\"}");
		return result.toString();
	}

}
