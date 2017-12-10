package com.sn.pkg;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class EnrollCourse
 */
@WebServlet("/EnrollCourse")
public class EnrollCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String regStudents = "";
	HttpSession session=request.getSession();
	String userID = (String)session.getAttribute("loggedinUser");
	String courseID = request.getParameter("courseID");
	
	daoService db = new daoService();
	ResultSet rs=  db.getStudentsRegistered(courseID);
	int i=0;
	
	try {
		if(rs.next())
		{
			
		regStudents = rs.getString(1);	
		if(regStudents!=null)
		{
		if(regStudents.contains(userID))
		{
			System.out.println("DONE REG");//DONE REGISTERING
			getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=danger").forward(request, response);
		}
		
		else
		{
			regStudents = regStudents.concat(userID);
			regStudents = regStudents.concat("|");
			i= db.addCoursetoStudent(regStudents,courseID);
			if(i==1)
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=success").forward(request, response);
			}
			else
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=failure").forward(request, response);
			}
		}
		}
		else
		{
			regStudents="";
			regStudents = regStudents.concat(userID);
			regStudents = regStudents.concat("|");
			i= db.addCoursetoStudent(regStudents,courseID);
			if(i==1)
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=success").forward(request, response);
			}else
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=failure").forward(request, response);
			}
		}
		
		}
		else
		{
			regStudents="";
			regStudents = regStudents.concat(userID);
			regStudents = regStudents.concat("|");
			i= db.addCoursetoStudent(regStudents,courseID);
			if(i==1)
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=success").forward(request, response);
			}else
			{
				getServletContext().getRequestDispatcher("/CourseGist.jsp?enrollstatus=failure").forward(request, response);
			}
		}		
		//System.out.println("regStudents "+regStudents);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
