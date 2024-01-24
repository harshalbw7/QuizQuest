package com.email;

import java.io.IOException;
import java.sql.*;
import javax.print.*;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// reads form fields

		Connection con = null;
		Statement statement = null;
		ResultSet resultset = null;
		int student_id = Integer.parseInt(request.getParameter("student_id"));
		String email = "";
		String uname = "";
		String password = "";
		String uname_password = "";
		try {
			con = DatabaseConnection.getConnection();
			statement = con.createStatement();
			resultset = statement.executeQuery("select email,uname,upass from student where id='" + student_id + "'");
			while (resultset.next()) {
				email = resultset.getString(1);
				uname = resultset.getString(2);
				password = resultset.getString(3);
				uname_password = "Hi "+uname+","+System.lineSeparator()+System.lineSeparator()+ "Your Online Quiz System Login details"+System.lineSeparator()+"User Name: "+uname + System.lineSeparator()+"Password: "+ password +System.lineSeparator()+System.lineSeparator()+"Thank you."+System.lineSeparator()+"Online Quiz Team.";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String message = "Online Quiz System.";
		// String content = request.getParameter("content");
		String resultMessage = "";
		
	
		PrintWriter out = response.getWriter();
		try {			
			EmailUtility.sendEmail(host, port, "quizsystem777@gmail.com", "ibeghgfbunwmnbuj", email, message,uname_password);
			HttpSession session=request.getSession();
			resultMessage = "Your login user name & password send successfully in your email.";
			session.setAttribute("mail-success", resultMessage);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			//request.setAttribute("Message", resultMessage);
			response.sendRedirect("viewStudents.jsp");
		}
	}
}