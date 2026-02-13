package chat;

import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.util.*;
import java.io.IOException;

@ServerEndpoint("/chat/{conversationId}/{userType}/{userId}")
public class ChatEndpoint {

    // conversationId -> sessions in that room
    private static Map<String, Set<Session>> rooms = new HashMap<>();

    @OnOpen
    public void onOpen(Session session,
                       @PathParam("conversationId") String conversationId,
                       @PathParam("userType") String userType,
                       @PathParam("userId") String userId) {

        // store identity
        session.getUserProperties().put("role", userType);
        session.getUserProperties().put("myId", userId);
        session.getUserProperties().put("conversationId", conversationId);

        // create room if not exist
        rooms.putIfAbsent(conversationId, new HashSet<>());

        // add user to that room
        rooms.get(conversationId).add(session);

        System.out.println(userType + " joined room " + conversationId);
    }



    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {

        String senderRole = (String) session.getUserProperties().get("role");
        String senderId   = (String) session.getUserProperties().get("myId");
        String conversationId = (String) session.getUserProperties().get("conversationId");

        // Save to DB
        ChatDAO.saveMessage(conversationId, senderRole, senderId, message);

        String json =
            "{ \"sender\":\"" + senderRole + "\"," +
            "\"senderId\":\"" + senderId + "\"," +
            "\"message\":\"" + message + "\" }";

        // send only to same room users
        for(Session s : rooms.get(conversationId)) {
            s.getBasicRemote().sendText(json);
        }
    }



    @OnClose
    public void onClose(Session session) {

        String conversationId = (String) session.getUserProperties().get("conversationId");

        if(conversationId != null && rooms.containsKey(conversationId)){
            rooms.get(conversationId).remove(session);

            if(rooms.get(conversationId).isEmpty()){
                rooms.remove(conversationId);
            }
        }

        System.out.println("User disconnected");
    }

}
