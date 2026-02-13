package chat;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import test.DBConnection;

public class ChatDAO {

    public static void saveMessage(String conversationId, String senderType, String senderId, String msg) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO messages(conversation_id, sender_type, sender_id, message) VALUES(?,?,?,?)"
            );

            ps.setString(1, conversationId);
            ps.setString(2, senderType);
            ps.setString(3, senderId);
            ps.setString(4, msg);

            ps.executeUpdate();
            PreparedStatement ps2 = con.prepareStatement(
            		"INSERT INTO conversations(user_id, therapist_id, last_message) VALUES(?,?,?) " +
            		"ON DUPLICATE KEY UPDATE last_message=?"
            		);

            		String[] ids = conversationId.split("_");
            		ps2.setInt(1, Integer.parseInt(ids[0]));
            		ps2.setInt(2, Integer.parseInt(ids[1]));
            		ps2.setString(3, msg);
            		ps2.setString(4, msg);
            		ps2.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static List<String[]> getMessages(String conversationId) {

        List<String[]> list = new ArrayList<>();

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "SELECT sender_type, sender_id, message FROM messages WHERE conversation_id=? ORDER BY id ASC"
            );

            ps.setString(1, conversationId);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                list.add(new String[]{
                        rs.getString("sender_type"),
                        rs.getString("sender_id"),
                        rs.getString("message")
                });
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }



}
