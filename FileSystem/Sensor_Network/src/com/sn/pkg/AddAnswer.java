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
 * Servlet implementation class AddAnswer
 */
@WebServlet("/AddAnswer")
public class AddAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnswer() {
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
		String quesNO = request.getParameter("quesNO");
		String userID =(String) session.getAttribute("loggedinUser");
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		String currentTime = sdf.format(dt);
		String question = request.getParameter("answer");
		discussionQAModal d=new discussionQAModal();
		d.setquesNO(quesNO);
		d.setdatetime(currentTime);
		d.setpostedby(uname);
		d.setQues(question);
		daoService db=new daoService();
		db.insertAnswer(d);
		getServletContext().getRequestDispatcher("/DiscAns.jsp?quesNO="+quesNO).forward(request, response);

	}

}
