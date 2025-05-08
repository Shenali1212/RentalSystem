package contactUs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet to handle deletion of inquiries
@WebServlet("/DeleteInquiryServlet")
public class DeleteInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Handle POST requests for inquiry deletion
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get the inquiry ID from the request parameters
		String uid = request.getParameter("userid");
		String id = request.getParameter("inquiryid");
		boolean isTrue;
		
		// Attempt to delete the inquiry
		isTrue = ContactUsDBUtil.deleteinquiry(id);
		
		// If deletion is successful, redirect to ContactUs.jsp
		if (isTrue == true) {
			response.sendRedirect(request.getContextPath() + "/ReadInquiryServlet?id=" + uid);
		
		}
		
		else {
			// If deletion fails, redirect to unsuccess.jsp
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			
		}
	}

}
