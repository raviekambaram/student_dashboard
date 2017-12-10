package com.sn.pkg;

public class discussionQAModal {


	private String ques;
	private String postedby;
	private String datetime;
	private String courseID;
	private String quesNO;
	
	
	public String getquesNO() {
		return quesNO;
	}
	public void setquesNO(String quesNO) {
		this.quesNO = quesNO;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	public String getpostedby() {
		return postedby;
	}
	public void setpostedby(String postedby) {
		this.postedby = postedby;
	}
	public String getdatetime() {
		return datetime;
	}
	public void setdatetime(String datetime) {
		this.datetime = datetime;
	}
	public void setcourseID(String courseID) {
		
		this.courseID = courseID;
		// TODO Auto-generated method stub
		
	}
	public String getcourseID() {
		return courseID;
	}

}