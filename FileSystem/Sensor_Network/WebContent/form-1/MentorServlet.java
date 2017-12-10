package com.wit.pkg;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MentorServlet
 */
@WebServlet("/MentorServlet")
public class MentorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname=request.getParameter("form-first-name");
		String lname=request.getParameter("form-last-name");
		String email=request.getParameter("form-email");
		String desc=request.getParameter("form-about-yourself");
		String field=request.getParameter("form-tags");
		String mrorme="mentor";
		Connection con=null;
		try {
			con = DBCon.getConnection();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql="insert into mentor (fname,lname,email,desc,field,mentor/mentee) values(?,?,?,?,?,?)";
	
PreparedStatement preparedStmt;
try {
	preparedStmt = con.prepareStatement(sql);

		
		preparedStmt.setString(1, fname);
		preparedStmt.setString(2, lname);
		preparedStmt.setString(3, email);
		preparedStmt.setString(4, desc);
				
		//preparedStmt.setString(6, p.getDob());

		preparedStmt.setString(5, field);
		preparedStmt.setString(6, mrorme);
		preparedStmt.execute();
	    con.close();
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
	doGet(request,response);
	}

}
