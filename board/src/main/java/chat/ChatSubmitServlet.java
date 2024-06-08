package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatSubmitServlet
 */
@WebServlet("/chatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String roomID =request.getParameter("roomID");
		String userID=request.getParameter("userID");
		String chatContent=request.getParameter("chatContent");
		if(roomID==null || roomID.equals("") || userID==null || userID.equals("") || 
				 chatContent==null || chatContent.equals("")) {
			response.getWriter().write("0");
		}else {
		
			roomID = URLDecoder.decode(roomID, "UTF-8");
			userID = URLDecoder.decode(userID, "UTF-8");
			chatContent = URLDecoder.decode(chatContent, "UTF-8");
			response.getWriter().write(new ChatDAO().submit(userID, roomID, chatContent)+ "");

		}
	}
}
