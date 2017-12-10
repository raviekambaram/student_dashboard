package com.sn.pkg;

import java.io.File;
import java.io.InputStream;

public class daoCourse {

	private String course_name;
	private String semester_offered;
	private String as_ques1;
	private String ansopt11;
	private String ansopt12;
	private String ansopt13;
	private String ansopt14;
	private String as_cans1;
	private String as_ques2;
	private String ansopt21;
	private String ansopt22;
	private String ansopt23;
	private String ansopt24;
	private String as_cans2;
	private InputStream course_explaination;
	private InputStream course_content;
	private String userID;
	
	public InputStream getcourse_explaination() {
		return course_explaination;
	}
	public void setcourse_explaination(InputStream course_explaination) {
		this.course_explaination = course_explaination;
	}
	public InputStream getcourse_content() {
		return course_content;
	}
	public void setcourse_content(InputStream course_content) {
		this.course_content = course_content;
	}
	public String getuserID() {
		return userID;
	}
	public void setuserID(String userID) {
		this.userID = userID;
	}
	public String getcourse_name() {
		return course_name;
	}
	public void setcourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getas_ques1() {
		return as_ques1;
	}
	public void setas_ques1(String as_ques1) {
		this.as_ques1 = as_ques1;
	}
	public String getansopt11() {
		return ansopt11;
	}
	public void setansopt11(String ansopt11) {
		this.ansopt11 = ansopt11;
	}
	
	public String getansopt12() {
		return ansopt12;
	}
	public void setansopt12(String ansopt12) {
		this.ansopt12 = ansopt12;
	}
	
	public String getansopt13() {
		return ansopt13;
	}
	public void setansopt13(String ansopt13) {
		this.ansopt13 = ansopt13;
	}
	
	public String getansopt14() {
		return ansopt14;
	}
	public void setansopt14(String ansopt14) {
		this.ansopt14 = ansopt14;
	}
	
	public String getas_cans1() {
		return as_cans1;
	}
	public void setas_cans1(String as_cans1) {
		this.as_cans1 = as_cans1;
	}
	public String getas_ques2() {
		return as_ques2;
	}
	public void setas_ques2(String as_ques2) {
		this.as_ques2 = as_ques2;
	}
	public String getansopt21() {
		return ansopt21;
	}
	public void setansopt21(String ansopt21) {
		this.ansopt21 = ansopt21;
	}
	public String getansopt22() {
		return ansopt22;
	}
	public void setansopt22(String ansopt22) {
		this.ansopt22 = ansopt22;
	}
	
	public String getansopt23() {
		return ansopt23;
	}
	public void setansopt23(String ansopt23) {
		this.ansopt23 = ansopt23;
	}
	public String getansopt24() {
		return ansopt24;
	}
	public void setansopt24(String ansopt24) {
		this.ansopt24 = ansopt24;
	}
	
	public String getas_cans2() {
		return as_cans2;
	}
	public void setas_cans2(String as_cans2) {
		this.as_cans2 = as_cans2;
	}
	public String getsemester_offered() {
		return semester_offered;
	}
	public void setsemester_offered(String semester_offered) {
		this.semester_offered = semester_offered;
	}
	
	
}