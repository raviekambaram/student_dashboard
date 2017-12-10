package com.sn.pkg;

public class daoMember {

	private String fname;
	private String lname;
	private String password;
	private String userType;
	private String userID;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setuserType(String userType) {
		
		this.userType = userType;
		// TODO Auto-generated method stub
		
	}
	public String getuserType() {
		return userType;
	}
public void setuserID(String userID) {
	
	this.userID = userID;
	// TODO Auto-generated method stub
	
}
public String getuserID() {
	return userID;
}
}