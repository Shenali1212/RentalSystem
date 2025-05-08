package regVehicle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reguser.Reguser;
import com.reguser.ReguserDBUtil;


@WebServlet("/DisplayVehicle")
public class DisplayVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DisplayVehicle() {
        super();
        
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		
		System.out.println("I do post");
		
		String username = request.getParameter("ownerusername");
		
		//int id = Integer.parseInt(ownerId);
			
		try {
			List<Regvehicle> RegvehicleDetails = RegvehicleDBUtil.validate(username);
			request.setAttribute("RegvehicleDetails", RegvehicleDetails);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("displayVehicleDetails.jsp");
		dis.forward(request, response);
	}
}
