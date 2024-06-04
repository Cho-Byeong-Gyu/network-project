package chat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ChatSubmitServlet") // URL 매핑
public class ChatSubmitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8"); // 수정: 콜론 -> 세미콜론
        String chatName = request.getParameter("chatName");
        String chatContent = request.getParameter("chatContent");
        if (chatName == null || chatName.equals("") || chatContent == null || chatContent.equals("")) {
            response.getWriter().write("0");
        } else {
            // 가정: ChatDAO.submit()는 int를 반환 (예: 성공 시 1, 실패 시 0)
            response.getWriter().write(new ChatDAO().submit(chatName, chatContent) + "");
        }
    }
}
