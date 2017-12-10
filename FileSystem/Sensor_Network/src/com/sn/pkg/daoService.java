package com.sn.pkg;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


public class daoService
{
	//public static Connection con;
	private static Connection con = DBCon.getConnection();
public static int fsort =1;
public static int lsort =1;
public static int gsort =1;

	/*public daoService()
{
	
	try {
		//con=DBCon.getConnection();
	} catch (Exception e) {
		e.printStackTrace();
	}
}*/
public daoMember LoginUser(daoMember m) throws SQLException  {
	daoMember mem = new daoMember();
	String sql = "select * from sensor_network.users where userID = ? and pword = ?";
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		try {
			
			ps = con.prepareStatement(sql);
			ps.setString(1, m.getuserID());
			ps.setString(2, m.getPassword());
			
			rs= ps.executeQuery();
			if(rs.next())
			{
			mem.setFname(rs.getString(1));
			mem.setLname(rs.getString(2));
			mem.setuserType(rs.getString(5));
			return mem;
			}
			else
			{
				return null;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

public Integer checkCourseCount(String useriD)  {
	ResultSet rs = null;
	int count = 0;
	try {
		
		String sql = "select count(userID) from sensor_network.courses where userID =?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, useriD);
		rs = ps.executeQuery();
		if(rs.next())
		{
			count = rs.getInt(1);
		}
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	return count;
	
	
	
}



public Blob getCourseContent(String courseID)  {
	Blob content = null;
	String sql = "select course_content from sensor_network.courses where courseID = ?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		while(rs.next())
		{content =rs.getBlob(1);}
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return content;
	
	
	
}

public Blob getCourseExplaination(String courseID)  {
	
	Blob content = null;
	String sql = "select course_explaination from sensor_network.courses where courseID = ?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		while(rs.next())
		{content =rs.getBlob(1);}
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return content;
	
	
	
}


public ResultSet getGradeInfo(String courseID)  {
	String sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}

public ResultSet getGradeInfoOrdered(String courseID, String colname)  {
	//String sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" asc";
	//String sql1 = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" desc";
	//System.out.println(j);
	//j++;
	String sql="";
	ResultSet rs = null;
	if(colname.equalsIgnoreCase("first_name"))
	{
		if(fsort%2==0)
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" asc";
		}
		else
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" desc";
		}
	fsort++;
	}
	else if(colname.equalsIgnoreCase("last_name"))
	{
		if(lsort%2==0)
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" asc";
		}
		else
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" desc";
		}
		lsort++;
	}
	else if(colname.equalsIgnoreCase("scores"))
	{
		if(gsort%2==0)
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" asc";
		}
		else
		{
			sql = "select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname+" desc";
		}
		gsort++;
	}
	else
	{
		sql="select course_name,first_name,last_name,scores,gradeprim,userID from sensor_network.grading where courseID =? order by "+colname;
	}
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}



public void updateGradeInfo(String grade, String gradeprim)  {
	try {
		String sql ="UPDATE sensor_network.grading SET Scores=? WHERE gradeprim=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, grade);
		ps.setString(2, gradeprim);
		ps.executeUpdate();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	
}


public daoCourse getCourseInfoDisplay(String courseID)  {
	ResultSet rs = null;
	daoCourse c = new daoCourse();
	String sql = "select course_name, semester_offered from sensor_network.courses where courseID = ?";
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		if(rs.next())
		{
			c.setcourse_name(rs.getString(1));
			c.setsemester_offered(rs.getString(2));
			return c;
		}
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
	
	
	
}

public ResultSet getCourseInfoGrade(String userID)  {
	String sql = "select courseID, course_name, semester_offered from sensor_network.courses where userID = ?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, userID);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}


public int getScoresForStudent(String userID, String courseName)  {
	ResultSet rs = null;
	String uID = "%"+userID+"%";
	String cname = "%"+courseName+"%";
	int score ;
	try {
		String gradesql = "select Scores from sensor_network.grading where userID like ? and course_name like ? ";
		PreparedStatement ps = con.prepareStatement(gradesql);
		ps.setString(1, uID);
		ps.setString(2, cname);
		rs = ps.executeQuery();
		if(rs.next())
		{
			score = rs.getInt(1);
			return score;
		}
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return -1;
	
	
	
}

public ResultSet getCourseForStudent(String userID)  {
	String uID = "%"+userID+"%";
	ResultSet rs = null;
	try {
		String sql = "select courseID, course_name, semester_offered from sensor_network.courses where students_registered like ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, uID);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}


public ResultSet getAllCourseInfo()  {
	ResultSet rs = null;
	 String sql = "select courseID, course_name, semester_offered from sensor_network.courses";
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}

public ResultSet getAnswers( String courseID)  {
	String sql="SELECT * FROM sensor_network.discussion_answers where quesNO=?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}

public ResultSet getQuestions(String courseID)  {
	String sql="SELECT * FROM sensor_network.discussion_questions where courseID=?";
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}

public ResultSet getAssignment(String courseID)  {
	ResultSet rs = null;
	String sql = "select  as_ques1, as_ques2,as_ans11,as_ans12,as_ans13,as_ans14,as_ans21,as_ans22,as_ans23,as_ans24,course_name from sensor_network.courses where courseID=?";
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
	
	
	
}


public void addCourse(daoCourse c)  {
	String sql= "INSERT INTO `sensor_network`.`courses`(`course_name`,`semester_offered`,`userID`,`as_ques1`,`as_ans11`,`as_ans12`,`as_ans13`,`as_ans14`,`as_cans1`,`as_ques2`,`as_ans21`,`as_ans22`,`as_ans23`,`as_ans24`,`as_cans2`,`course_content`,`course_explaination`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, c.getcourse_name());
		ps.setString(2, c.getsemester_offered());
		ps.setString(3, c.getuserID());
		ps.setString(4, c.getas_ques1());
		ps.setString(5, c.getansopt11());
		ps.setString(6, c.getansopt12());
		ps.setString(7, c.getansopt13());
		ps.setString(8, c.getansopt14());
		ps.setString(9, c.getas_cans1());
		ps.setString(10, c.getas_ques2());
		ps.setString(11, c.getansopt21());
		ps.setString(12, c.getansopt22());
		ps.setString(13, c.getansopt23());
		ps.setString(14, c.getansopt24());
		ps.setString(15, c.getas_cans2());
		ps.setBlob(16, c.getcourse_content());
		ps.setBlob(17, c.getcourse_explaination());
		ps.executeUpdate();
		
		//con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	
}

public static void registerUser(daoMember m)  {
	String sqlRegister="insert into sensor_network.users  values (?,?,?,?,?)";
	//ResultSet rs = null;
	try {
		PreparedStatement ps = con.prepareStatement(sqlRegister);
		ps.setString(1, m.getFname());
		ps.setString(2, m.getLname());
		ps.setString(3, m.getuserID());
		ps.setString(4, m.getPassword());
		ps.setString(5, m.getuserType());
		
		
		
		ps.execute();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	//return rs;
}


public static int checkRegistered(daoMember m) {
	String sql="select * from sensor_network.users where userID=?";
	ResultSet rs = null;
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, m.getuserID());
		
		rs= ps.executeQuery();
		if(rs.next())
		{
			return 1;
		}
		else
		{
			return 0;
		}
	} catch (SQLException e) {
		e.printStackTrace();
		return -1;
	}

	
	
}


public  String getQuestion(String quesNO) {
	String sql="SELECT question FROM sensor_network.discussion_questions where quesNO=?";
	String question="";
	ResultSet rs = null;
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,quesNO);
		
		rs= ps.executeQuery();
		rs.next();
		question = rs.getString(1);
		return question;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	return question;
}

public void insertQuestion( discussionQAModal d) {
	String sql="insert into sensor_network.discussion_questions (question,posted_by,date_time,courseID) values (?,?,?,?)";
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, d.getQues());
		ps.setString(2, d.getpostedby());
		ps.setString(3, d.getdatetime());
		ps.setString(4, d.getcourseID());
		ps.executeUpdate();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}

public void insertAnswer( discussionQAModal d) {
	String sql="insert into sensor_network.discussion_answers (answer,posted_by,date_time,quesNO) values (?,?,?,?)";
	try {
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, d.getQues());
		ps.setString(2, d.getpostedby());
		ps.setString(3, d.getdatetime());
		ps.setString(4, d.getquesNO());
		ps.executeUpdate();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}
public ResultSet getStudentsRegistered(String courseID) {
	String sql = "select students_registered from sensor_network.courses where courseID = ?";
	// TODO Auto-generated method stub
	ResultSet rs = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
	}catch(Exception e)
	{
	e.printStackTrace();
	
}


	return rs;

}
public int addCoursetoStudent( String regStudents, String courseID) {
	// TODO Auto-generated method stub
	String sql1="UPDATE `sensor_network`.`courses` SET `students_registered`=? WHERE `courseID`=?";
	int i = 0;
	try {
		PreparedStatement ps = con.prepareStatement(sql1);
		ps.setString(1, regStudents);
		ps.setString(2, courseID);
		i = ps.executeUpdate();
	}catch(Exception e)
	{
	e.printStackTrace();
	
}
	return i;
}
public ResultSet getCorrectAnswers( String courseID) {
	// TODO Auto-generated method stub
	String selectsql = "select as_cans1, as_cans2 from sensor_network.courses where courseID = ?" ;
	ResultSet rs = null;
	try {
		PreparedStatement ps = con.prepareStatement(selectsql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
	}catch(Exception e)
	{
	e.printStackTrace();
	
}


	return rs;

}
public Integer checkResultAvailable( String courseID, String uID) {
	// TODO Auto-generated method stub
	String checksql = "select * from sensor_network.grading where courseID = ? and userID = ?" ;
	ResultSet rs = null;
	try {
		PreparedStatement ps = con.prepareStatement(checksql);
		ps.setString(1, courseID);
		ps.setString(2, uID);
		rs = ps.executeQuery();
		if(rs.next())
		{
			return 1;
		}
	}catch(Exception e)
	{
	e.printStackTrace();
	
}


	return 0;

}
public String getCourseName( String courseID) {
	// TODO Auto-generated method stub
	String courseNamesql = "select course_name from sensor_network.courses where courseID = ?";
	ResultSet rs = null;
	String cname = "";
	try {
		PreparedStatement ps = con.prepareStatement(courseNamesql);
		ps.setString(1, courseID);
		rs = ps.executeQuery();
		while(rs.next())
		{
			cname=rs.getString(1);
		}
	}catch(Exception e)
	{
	e.printStackTrace();
	
}


	return cname;
}
public void insertGrades( daoGrade m) {
	// TODO Auto-generated method stub
	String gradesql="insert into sensor_network.grading (courseID, course_name, userID, first_name, last_name, Scores) values (?,?,?,?,?,?)";
	try{
		PreparedStatement ps = con.prepareStatement(gradesql);
	
	ps.setString(1, m.getcourseID());
	ps.setString(2, m.getcourseName());
	ps.setString(3, m.getuserID());
	ps.setString(4, m.getFname());
	ps.setString(5, m.getLname());
	ps.setInt(6, m.getgrade());
	ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

}
}