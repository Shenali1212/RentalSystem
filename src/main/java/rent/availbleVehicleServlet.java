package rent;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.SystemVehicles;
@WebServlet("/availbleVehicleServlet")
public class availbleVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			List<SystemVehicles> vDetails =rentDButil.getVehiclesDetails(); //passing type parameter to dbutill to do the sql
		
			request.setAttribute("vDetails", vDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("VehicleNRates.jsp/Vehicles.jsp");
			
			dis.forward(request, response);
			
		}catch (Exception e)
		{
			e.printStackTrace(); // catch and display if there were any execptions
		}
		
	
	}

}
