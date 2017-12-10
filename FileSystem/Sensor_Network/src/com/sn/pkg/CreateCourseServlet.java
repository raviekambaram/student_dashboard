package com.sn.pkg;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

/**
 * Servlet implementation class CreateCourseServlet
 */
@WebServlet("/CreateCourseServlet")
@MultipartConfig(maxFileSize = 16177215)

public class CreateCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCourseServlet() {
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
	
	
		String course_name=request.getParameter("course_name");
		String semester_offered=request.getParameter("semester_offered");
		String as_ques1=request.getParameter("as_ques1");
		String ansopt11=request.getParameter("1ansopt1");
		String ansopt12=request.getParameter("1ansopt2");
		String ansopt13=request.getParameter("1ansopt3");
		String ansopt14=request.getParameter("1ansopt4");
		String as_cans1=request.getParameter("as_cans1");
		String as_ques2=request.getParameter("as_ques2");
		String ansopt21=request.getParameter("2ansopt1");
		String ansopt22=request.getParameter("2ansopt2");
		String ansopt23=request.getParameter("2ansopt3");
		String ansopt24=request.getParameter("2ansopt4");
		String as_cans2=request.getParameter("as_cans2");
		//String ansopt1 = ansopt11+"|"+ansopt12+"|"+ansopt13+"|"+ansopt14;
		//String ansopt2 = ansopt21+"|"+ansopt22+"|"+ansopt23+"|"+ansopt24;
		InputStream course_content = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("course_content");
        if (filePart != null) {
        	course_content = filePart.getInputStream();
        }
        InputStream course_explaination = null; // input stream of the upload file
        
        // obtains the upload file part in this multipart request
        Part filePart1 = request.getPart("course_explaination");
        if (filePart1 != null) {
        	course_explaination = filePart1.getInputStream();
        }
        HttpSession session = request.getSession();
        String userID = (String)session.getAttribute("loggedinUser");
        
        daoCourse c1 = new daoCourse();
		c1.setuserID(userID);
		c1.setcourse_name(course_name);
		c1.setsemester_offered(semester_offered);
		c1.setas_ques1(as_ques1);
		c1.setansopt11(ansopt11);
		c1.setansopt12(ansopt12);
		c1.setansopt13(ansopt13);
		c1.setansopt14(ansopt14);
		c1.setas_cans1(as_cans1);
		c1.setas_ques2(as_ques2);
		c1.setansopt21(ansopt21);
		c1.setansopt22(ansopt22);
		c1.setansopt23(ansopt23);
		c1.setansopt24(ansopt24);
		c1.setas_cans2(as_cans2);
		c1.setcourse_content(course_content);
		c1.setcourse_explaination(course_explaination);
		
		daoService db = new daoService();
		db.addCourse(c1);
		getServletContext().getRequestDispatcher("/FacultyHome.jsp?coursecreation=success").forward(request, response);
	}

}
