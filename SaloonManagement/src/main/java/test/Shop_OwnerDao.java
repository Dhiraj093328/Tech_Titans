package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Shop_OwnerDao {
	
	public static Connection getConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/saloon_management","root","root");
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	public static int saveShopOwner(Shop_Owner s)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into shop_owner(shop_name,registration_no,owner_name,opening_time,closing_time,email,contact_no,username,password) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, s.getShop_name());
			ps.setString(2, s.getRegistration_no());
			ps.setString(3, s.getOwner_name());
			ps.setTime(4, s.getOpening_time());
			ps.setTime(5, s.getClosing_time());
			ps.setString(6, s.getContact_no());
			ps.setString(7, s.getEmail());
			ps.setString(8, s.getUsername());
			ps.setString(9, s.getPassword());
			
			status = ps.executeUpdate();
			
			con.close();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static Shop_Owner getShopOwner(String user)
	{
		Shop_Owner s = new Shop_Owner();
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from shop_owner where username=?");
			ps.setString(1, user);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				s.setShop_owner_id(rs.getInt(1));
				s.setShop_name(rs.getString(2));
				s.setRegistration_no(rs.getString(3));
				s.setOwner_name(rs.getString(4));
				s.setOpening_time(rs.getTime(5));
				s.setClosing_time(rs.getTime(6));
				s.setEmail(rs.getString(7));
				s.setContact_no(rs.getString(8));
				s.setUsername(rs.getString(9));
				s.setPassword(rs.getString(10));
				
				con.close();
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return s;
	}
	
	public static int deleteShopOwner(int id)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from show_owner where show_owner_id=?");
			ps.setInt(1, id);
			
			status = ps.executeUpdate();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateShopOwner(Shop_Owner s)
	{
		int status = 0;
		try
		{
			Connection con = getConnection();
			PreparedStatement  ps = con.prepareStatement("update shop_owner set shop_name=?, registration_no=?, owner_name=?, opening_time=?, closing_time=?, email=?, contact_no=?, username=?, password=? where id=?");
			ps.setString(1, s.getShop_name());
			ps.setString(2, s.getRegistration_no());
			ps.setString(3, s.getOwner_name());
			ps.setTime(4, s.getOpening_time());
			ps.setTime(5, s.getClosing_time());
			ps.setString(6, s.getEmail());
			ps.setString(7, s.getContact_no());
			ps.setString(8, s.getUsername());
			ps.setString(9, s.getPassword());
			ps.setInt(10, s.getShop_owner_id());
			
			status = ps.executeUpdate();
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
}
