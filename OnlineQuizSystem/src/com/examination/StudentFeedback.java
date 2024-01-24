package com.examination;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class StudentFeedback
 */
@WebServlet("/StudentFeedback")
public class StudentFeedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fid = 0;
		String studentName = request.getParameter("sname");
		String feedback = request.getParameter("feedback");
		String review = request.getParameter("review");
		HttpSession hs = request.getSession();

		try {

			int addQuestion = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,sname,feedback,review)values('" + fid + "','"
							+ studentName + "','" + feedback + "','"+review+"')");
			if (addQuestion > 0) {
				String message = "Feedback submitted successfully.";
				hs.setAttribute("feedback", message);
				response.sendRedirect("student-feedback.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
