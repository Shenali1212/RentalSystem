package rent;



public class rentalData {
	
	private int id;
	private String name;
	private String vehicleID;
	private String pDate;
	private String rDate;
	private String phone;
	private float fee;
	
	public rentalData(int id, String name, String vehicleID, String pDate, String rDate,String phone, float fee) {
		
		this.id = id;
		this.name = name;
		this.vehicleID = vehicleID;
		this.pDate = pDate;
		this.rDate = rDate;
		this.phone = phone;
		this.fee= fee;
	}

	public int getId() {
		return id;
	}


	public String getName() {
		return name;
	}

	

	public String getVehicle() {
		return vehicleID;
	}


	public String getpDate() {
		return pDate;
	}


	public String getrDate() {
		return rDate;
	}
	
	public String getPhone() {
		return phone;
	}
	public float getFee() {
		return fee;
	}

	
	
	
	

}
