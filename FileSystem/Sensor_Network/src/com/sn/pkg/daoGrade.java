package com.sn.pkg;

public class daoGrade {

	private String fname;
	private String lname;
	private String courseID;
	private String courseName;
	private String userID;
	private Integer grade;
	private String gradeprim;
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	
	public String getgradeprim() {
		return gradeprim;
	}
	public void setgradeprim(String gradeprim) {
		this.gradeprim = gradeprim;
	}
	
	public Integer getgrade() {
		return grade;
	}
	public void setgrade(int marks) {
		this.grade = marks;
	}
	
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getcourseID() {
		return courseID;
	}
	public void setcourseID(String courseID) {
		this.courseID = courseID;
	}
	public void setcourseName(String courseName) {
		
		this.courseName = courseName;
		// TODO Auto-generated method stub
		
	}
	public String getcourseName() {
		return courseName;
	}
public void setuserID(String userID) {
	
	this.userID = userID;
	// TODO Auto-generated method stub
	
}
public String getuserID() {
	return userID;
}
}