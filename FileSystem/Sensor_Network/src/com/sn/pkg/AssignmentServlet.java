package com.sn.pkg;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AssignmentServlet
 */
@WebServlet("/AssignmentServlet")
public class AssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String ans1= request.getParameter("options1");
		String ans2= request.getParameter("options2");
		String cans1="";
		String cans2=""; 
		String courseID = request.getParameter("courseID");
		daoService db=new daoService();
		String courseName= db.getCourseName(courseID);
		HttpSession session = request.getSession();
		String uID = (String)session.getAttribute("loggedinUser");
		String fname = (String)session.getAttribute("fname");
		String lname = (String)session.getAttribute("lname");
		int i, marks = 0;
		
		
		i= db.checkResultAvailable(courseID,uID);
		if(i==1)
		{
			getServletContext().getRequestDispatcher("/Assignment.jsp?AssState=failure").forward(request, response);	
		}
		else
		{
		
		
		ResultSet rs = db.getCorrectAnswers(courseID);
		try {
			while(rs.next())
			{
			 cans1 =rs.getString(1); 
			 cans2 =rs.getString(2);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ans1.equalsIgnoreCase(cans1))
		{
			marks=marks+10;
		}
		if(ans2.equalsIgnoreCase(cans2))
		{
			marks=marks+10;
		}
		daoGrade m = new daoGrade();
		m.setFname(fname);
		m.setLname(lname);
		m.setcourseID(courseID);
		m.setuserID(uID);
		m.setcourseName(courseName);
		m.setgrade(marks);
		db.insertGrades(m);
		getServletContext().getRequestDispatcher("/StudentGrades.jsp").forward(request, response);
	}
			
	}
}
