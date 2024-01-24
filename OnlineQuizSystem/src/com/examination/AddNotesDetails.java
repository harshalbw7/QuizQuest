package com.examination;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AddNotesDetails
 */
@WebServlet("/AddNotesDetails")
public class AddNotesDetails extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Users/Sakshi/eclipse-workspace/OnlineQuizSystem/WebContent/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String notesResources = null;
				int nid = 0;
				String notesName = null;
				

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						notesResources = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + notesResources));

						FileItem topicName = (FileItem) multiparts.get(0);
						notesName = topicName.getString();

					
					}
				}
				try {

					int id = 0;
					String imagePath = UPLOAD_DIRECTORY + notesResources;
					Connection con = DatabaseConnection.getConnection();
					Statement st = con.createStatement();
					int i = st.executeUpdate(
							"insert into tblnotes(notes_id,notes_name,notes_resource,notes_resource_name) values('"
									+ nid + "','" + notesName + "','" + imagePath + "','"
									+ notesResources + "')");

					if (i > 0) {
						String success = "Notes added successfully.";
						session.setAttribute("add-notes", success);
						response.sendRedirect("admin-add-notes-prepration.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}

}
