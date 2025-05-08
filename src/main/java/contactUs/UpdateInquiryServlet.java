package contactUs;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet to update inquiries
@WebServlet("/UpdateInquiryServlet")
public class UpdateInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Handle POST requests for updating inquiries
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//retrieve updated inquiry details
		String uid = request.getParameter("userid");
		String id = request.getParameter("inquiryid");
		String subject = request.getParameter("inquirysubject");
		String message = request.getParameter("inquirydetails");
		String date = request.getParameter("inquirydate");
		
		boolean istrue;
		
		//attempt to update the inquiry in the database
		istrue = ContactUsDBUtil.updateinquiry(id, subject, message, date);
		
		if(istrue == true){
			System.out.println("update if ekata awa ");
			//if successful redirect to ContactUs.jsp
			response.sendRedirect(request.getContextPath() + "/ReadInquiryServlet?id=" + uid);
		}
		else {
			//if fails redirect to unsuccess.jsp
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
		
	}
	
	

}
