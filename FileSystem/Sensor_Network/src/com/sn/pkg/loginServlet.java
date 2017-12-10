package com.sn.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		String uname,pword;
		uname=request.getParameter("user");
		pword=request.getParameter("password");
		System.out.println("uname: "+uname+" pword: "+pword);
	
	
	try {
		daoMember m1 = new daoMember();
		m1.setuserID(uname);
		m1.setPassword(pword);
		
		daoService DB = new daoService();
		daoMember rs = DB.LoginUser(m1);
		if(rs!=null)
		{
			String user = rs.getuserType();
			String username= rs.getFname()+" "+rs.getLname();
			HttpSession session=request.getSession();
			session.setAttribute("fname", rs.getFname());
			session.setAttribute("lname", rs.getLname());
			session.setAttribute("fsort", 1);
			session.setAttribute("lsort", 1);
			session.setAttribute("gsort", 1);
			session.setAttribute("loggedinUser", uname);
			session.setAttribute("username", username);
			session.setAttribute("usertype", user);
			session.setAttribute("activesession", "SET");
			if(user.equalsIgnoreCase("faculty"))
			{
			getServletContext().getRequestDispatcher("/FacultyHome.jsp").forward(request, response);
			}
			else
			{
				getServletContext().getRequestDispatcher("/StudentHome.jsp").forward(request, response);
			}
			}
		else
		{
			getServletContext().getRequestDispatcher("/FacultyLogin.jsp?userstatus=not_found").forward(request, response);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	/*finally
	{
	
	}*/
	}
}
