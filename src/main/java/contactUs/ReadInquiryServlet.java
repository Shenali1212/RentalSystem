package contactUs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet to read all inquiries
@WebServlet("/ReadInquiryServlet")
public class ReadInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//// Handle POST requests for inquiry reading
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("read inq servlet ekata awa");
		
		String uid = request.getParameter("id");
	
		
		int id = Integer.parseInt(uid);
		
		try {
		//create an array list and try to retrieve data	
		ArrayList<inquiry> inqlist = new ArrayList<>();
		inqlist = ContactUsDBUtil.readInqList(id);
		request.setAttribute("inqlist", inqlist);
		
		//forward the request to ReadInquiry.jsp
		RequestDispatcher dis = request.getRequestDispatcher("ContactUs.jsp/ReadInquiry.jsp");
		dis.forward(request, response);
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}

}
