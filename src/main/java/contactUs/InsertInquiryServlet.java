package contactUs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet to handle insertion of new inquiries
@WebServlet("/InsertInquiryServlet")
public class InsertInquiryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    //handle POST requests for inquiry insertion
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
    	
        System.out.println("doPost method called");
        
        // Retrieve inquiry details from request parameters
        String username = request.getParameter("username");
        String userid = request.getParameter("userid");
        String email = request.getParameter("email");
        String inquirysubject = request.getParameter("inquirysubject");
        String inquirydetails = request.getParameter("inquirydetails");
        
        System.out.println("Parameters received: " + username + ", " + email + ", " + inquirysubject);
        
        boolean isTrue;
        // Attempt to insert the new inquiry
        isTrue = ContactUsDBUtil.InsertInquiries(username, userid, email, inquirysubject, inquirydetails);
        
        System.out.println("InsertInquiries result: " + isTrue);
        
        //if insertion is successful, redirect to read servlet
        if(isTrue) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Your inquiry successfully submitted!');");
            out.println("location='ContactUs.jsp'");
            out.println("</script>");
        } else {
        	//if insertion fails, redirect to unsuccess.jsp
            System.out.println("Forwarding to unsuccess.jsp");
            RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}