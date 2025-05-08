package rent;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateRentalServlet
 */
@WebServlet("/UpdateRentalServlet")
public class UpdateRentalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("update rent came");
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
		
		String id = request.getParameter("ResID");
		System.out.println(id);
		
		String name = request.getParameter("ResNAME");
		System.out.println(name);
		
		String vID = request.getParameter("ResVid");
		System.out.println(vID);
		
		String pDate = request.getParameter("RespDATE");
		System.out.println(pDate);
		
		String rDate = request.getParameter("ResrDATE");
		System.out.println(rDate);
		
		String phone = request.getParameter("ResPhone");
		System.out.println(phone);
		
		String fee = request.getParameter("ResPrice");
		System.out.println(fee);
		
		
		boolean isTrue;
		isTrue = rentDButil.updateRenatlRecords(id, name, vID, pDate, rDate,phone,fee);
		
		
		if(isTrue == true) {
			
			out.println("<script type='text/javascript'>");
            out.println("alert('Update Successfull!');");
            out.println("window.location.href = '../DispalyReservationServlet?name=" + name + "';");
            out.println("</script>");
		}else {
			
				RequestDispatcher dis = request.getRequestDispatcher("failed.jsp");
				dis.forward(request, response);
			
		}
		
		
	}

}
