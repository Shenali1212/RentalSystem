package rent;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteRecordServlet
 */
@WebServlet("/DeleteRecordServlet")
public class DeleteRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
		
		String id = request.getParameter("ResID");
		String name = request.getParameter("ResNAME");
		System.out.println(id);
		boolean isTrue;
		isTrue = rentDButil.deleteRentalRecords(id);
		
		if(isTrue == true) {
			
			out.println("<script type='text/javascript'>");
            out.println("alert('Deletion Successfull!');");
            out.println("window.location.href = '../DispalyReservationServlet?name=" + name + "';");
            out.println("</script>");
            
		}else {
			
			List <rentalData> RData = rentDButil.DisplayRentalRecords(id);
			request.setAttribute("RData", RData);
			
			RequestDispatcher dis = request.getRequestDispatcher("VehicleNRates/Bookings.jsp");
			dis.forward(request, response);
			
		}
	}

}
