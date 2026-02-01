package test;

import java.sql.Time;

public class Shop_Owner {

	private int shop_owner_id;
	private String shop_name,registration_no,owner_name,email;
	private String contact_no,username,password;
	private Time opening_time, closing_time;
	
	public int getShop_owner_id() {
		return shop_owner_id;
	}
	public void setShop_owner_id(int shop_owner_id) {
		this.shop_owner_id = shop_owner_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getRegistration_no() {
		return registration_no;
	}
	public void setRegistration_no(String registration_no) {
		this.registration_no = registration_no;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Time getOpening_time() {
		return opening_time;
	}
	public void setOpening_time(Time opening_time) {
		this.opening_time = opening_time;
	}
	public Time getClosing_time() {
		return closing_time;
	}
	public void setClosing_time(Time closing_time) {
		this.closing_time = closing_time;
	}
	
	
}
