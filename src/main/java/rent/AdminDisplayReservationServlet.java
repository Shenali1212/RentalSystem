package rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminDisplayReservationServlet")
public class AdminDisplayReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			List <rentalData> RData = rentDButil.DisplayRentalRecords();
			request.setAttribute("RData", RData);
			
			
			
			RequestDispatcher dis = request.getRequestDispatcher("admin.jsp/manageReservations.jsp");
			dis.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
	}

}
