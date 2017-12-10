package com.sn.pkg;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddQuestion
 */
@WebServlet("/AddQuestion")
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestion() {
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
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		String courseID = request.getParameter("courseID");
		String userID =(String) session.getAttribute("loggedinUser");
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		String currentTime = sdf.format(dt);
		String question = request.getParameter("question");
		
		discussionQAModal d=new discussionQAModal();
		d.setcourseID(courseID);
		d.setdatetime(currentTime);
		d.setpostedby(uname);
		d.setQues(question);
		daoService db=new daoService();
		db.insertQuestion(d);
		getServletContext().getRequestDispatcher("/DiscQues.jsp?courseID="+courseID).forward(request, response);

	
	}

}
