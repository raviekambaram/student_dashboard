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
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
	

		// TODO Auto-generated method stub
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String pass = request.getParameter("pwd");
		String userID = request.getParameter("userID");
		String userType = request.getParameter("user");
		HttpSession session	= request.getSession();
		
		//check if already registered
		daoMember m1 = new daoMember();
		m1.setuserID(userID);
		int i=0;
		//ResultSet rs0 = null;
		try {
			i = daoService.checkRegistered(m1);
			if(i==1)
			{
				getServletContext().getRequestDispatcher("/Registration.jsp?userstatus=already_registered").forward(request, response);
			}
			else
			{
				
				daoMember m = new daoMember();
				m.setFname(fname);
				m.setLname(lname);
				m.setPassword(pass);
				m.setuserID(userID);
				m.setuserType(userType);
				
					
				try {
					daoService.registerUser(m);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
						getServletContext().getRequestDispatcher("/FacultyLogin.jsp?userstatus=registered_successfully").forward(request, response);

				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				

}
	
	
	}

