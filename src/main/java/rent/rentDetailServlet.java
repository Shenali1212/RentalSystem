package rent;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/rentDetailServlet")
public class rentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
    	
		String name = request.getParameter("name");
		String pdate = request.getParameter("pdate");
		String rdate = request.getParameter("rdate");
		
		String phone = request.getParameter("phone");
		String vID = request.getParameter("vehicleId");
		String total = request.getParameter("total");		
		

		boolean isTrue ; 
		isTrue =rentDButil.reserveVehicle(name, pdate, rdate,phone,vID,total);
		
		if(isTrue == true)
		{
			out.println("<script type='text/javascript'>");
            out.println("alert('Reservation Successfull!');");
            out.println("window.location.href = '../availbleVehicleServlet';");
            out.println("</script>");
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("failed.jsp");
			dis2.forward(request, response);
		}
		
	}

}
