package com.examination;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import com.email.EmailUtility;

/**
 * Servlet implementation class AddStudents
 */
@WebServlet("/AddStudents")
public class AddStudents extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Random random = new Random();
		int studentId = random.nextInt(9000) + 10000;
		String sname = request.getParameter("sname");
		String email = request.getParameter("email");
		String mobile= request.getParameter("mobile");
		String address = request.getParameter("address");
		String education = request.getParameter("education");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		HttpSession hs=request.getSession();
		try {
			Connection connection = DatabaseConnection.getConnection();
			Statement statement = connection.createStatement();
			int addStudent = statement.executeUpdate("insert into student(id,studentName,email,mobile,address,education,uname,upass) values('"
							+ studentId + "','" + sname + "','" + email + "','"+mobile+"','" + address + "','" + education + "','"
							+ uname + "','" + upass + "')");
			if (addStudent > 0) {
				String message="Student add sucessfully.";
				hs.setAttribute("message", message);
				response.sendRedirect("addStudent.jsp");
			} else {
				response.sendRedirect("addStudent.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
