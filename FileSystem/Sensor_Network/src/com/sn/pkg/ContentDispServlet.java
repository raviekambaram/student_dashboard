package com.sn.pkg;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContentDispServlet
 */
@WebServlet("/ContentDispServlet")
public class ContentDispServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentDispServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contentType=request.getParameter("content");
		String courseID = request.getParameter("courseID");
		if(contentType!=null && contentType!="null")
		{
			if(contentType.equalsIgnoreCase("video"))
			{

		response.setContentType("video/mp4");
		ServletOutputStream out;
		Blob img ;
		out = response.getOutputStream();
		try {
				daoService db=new daoService();
				img = db.getCourseContent(courseID);
				byte[] imgData = img.getBytes(1,(int)img.length());
				OutputStream o = response.getOutputStream();
			       o.write(imgData);
			       o.flush(); 
			       o.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		out.close();  

			}
			else if(contentType.equalsIgnoreCase("pdf"))
			{
				response.setContentType("application/pdf");
		ServletOutputStream out;
		Blob img ;
		out = response.getOutputStream();
		//FileInputStream fin = null;
		try {
			daoService db=new daoService();
			img = db.getCourseExplaination(courseID);
				byte[] imgData = img.getBytes(1,(int)img.length());
				OutputStream o = response.getOutputStream();
			       o.write(imgData);
			       o.flush(); 
			       o.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		out.close();  
	
			}
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
