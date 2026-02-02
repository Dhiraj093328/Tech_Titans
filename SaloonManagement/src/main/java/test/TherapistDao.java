package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TherapistDao {

	public static Connection getConnection()
	{
		Connection con = null;
		
		try
		{
			//driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/saloon_management","root","root");
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	
	public static int SaveTherapist(Therapist t)
	{
		int status=0;
		
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into therapist(name,email,contact_no,username,password) values(?,?,?,?,?)");
			ps.setString(1, t.getName());
			ps.setString(2, t.getEmail());
			ps.setString(3, t.getContact());
			ps.setString(4, t.getUsername());
			ps.setString(5, t.getPassword());
			
			status = ps.executeUpdate();
			
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static Therapist getTherapist(String user)
	{
		Therapist t = new Therapist();
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from therapist where username=?");
			ps.setString(1, user);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setContact(rs.getString(4));
				t.setUsername(rs.getString(5));
				t.setPassword(rs.getString(6));
			}
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return t;
	}
	
	public static List<Therapist> getAllTherapist()
	{
		List<Therapist> list = new ArrayList();
		
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from therapist");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Therapist t = new Therapist();
				
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setContact(rs.getString(4));
				t.setUsername(rs.getString(5));
				t.setPassword(rs.getString(6));
				
				list.add(t);
			}
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
	
	public static int deleteTherapist(int id)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from therapist where therapist_id=?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateTherapist(Therapist t)
	{
		int status = 0;
		
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("update therapist set name=?, email=?, contact_no=?, username=?, password=? where id=?");
			ps.setString(1, t.getName());
			ps.setString(2,t.getEmail());
			ps.setString(3,t.getContact());
			ps.setString(4,t.getUsername());
			ps.setString(5,t.getPassword());
			ps.setInt(6, t.getId());
			
			status = ps.executeUpdate();
			
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
}
