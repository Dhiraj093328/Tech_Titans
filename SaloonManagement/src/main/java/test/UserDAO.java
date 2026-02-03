package test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class UserDAO {

	// REGISTER USER
    public boolean registerUser(String name, String email, String contact,
                                String username, String password) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(name, email, contact_no, username, password) VALUES (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, contact);
            ps.setString(4, username);
            ps.setString(5, password);

            int rows = ps.executeUpdate();
            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // LOGIN USER
    public boolean validateUser(String username, String password) {
        boolean valid = false;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            valid = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }
}
