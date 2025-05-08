package rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispalyReservationServlet
 */
@WebServlet("/DispalyReservationServlet")
public class DispalyReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// passing parameter to  rentDBUtil
		
		String name = request.getParameter("name");
		
		try {
			
			List <rentalData> RData = rentDButil.DisplayRentalRecords(name);
			request.setAttribute("RData", RData);
			
			
			
			RequestDispatcher dis = request.getRequestDispatcher("VehicleNRates.jsp/Bookings.jsp");
			dis.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
