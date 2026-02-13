package chat;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ChatHistoryServlet
 */
@WebServlet("/ChatHistoryServlet")
public class ChatHistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userId = req.getParameter("userId");
        String therapistId = req.getParameter("therapistId");

        String conversationId =
                (Integer.parseInt(userId) < Integer.parseInt(therapistId))
                        ? userId + "_" + therapistId
                        : therapistId + "_" + userId;

        List<String[]> messages = ChatDAO.getMessages(conversationId);

        req.setAttribute("messages", messages);

        RequestDispatcher rd = req.getRequestDispatcher("chat.jsp");
        rd.forward(req, resp);
    }
}