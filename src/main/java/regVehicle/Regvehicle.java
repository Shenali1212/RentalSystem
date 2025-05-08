package regVehicle;

public class Regvehicle {
	
	private int id;
	private String username;
	private String makeModel;
	private String year;
	private String license;
	private String mileage;
	private String transmission;
	private String fuel;
	private String color;
	private String condition;
	private String vehiclePhoto;
	private String vehicleReg;
	private String insurance;
	private String ownership;
	private String usage ;
	private float rentalPricing ;
	private String respon ;
	
	public Regvehicle(int id, String username, String makeModel, String year, String license, String mileage,
			String transmission, String fuel, String color, String condition, String vehiclePhoto, String vehicleReg,
			String insurance, String ownership, String usage, float rentalPricing, String respon) {
		this.id = id;
		this.username = username;
		this.makeModel = makeModel;
		this.year = year;
		this.license = license;
		this.mileage = mileage;
		this.transmission = transmission;
		this.fuel = fuel;
		this.color = color;
		this.condition = condition;
		this.vehiclePhoto = vehiclePhoto;
		this.vehicleReg = vehicleReg;
		this.insurance = insurance;
		this.ownership = ownership;
		this.usage = usage;
		this.rentalPricing = rentalPricing;
		this.respon = respon;
	}

	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public String getMakeModel() {
		return makeModel;
	}

	public String getYear() {
		return year;
	}

	public String getLicense() {
		return license;
	}

	public String getMileage() {
		return mileage;
	}

	public String getTransmission() {
		return transmission;
	}

	public String getFuel() {
		return fuel;
	}

	public String getColor() {
		return color;
	}

	public String getCondition() {
		return condition;
	}

	public String getVehiclePhoto() {
		return vehiclePhoto;
	}

	public String getVehicleReg() {
		return vehicleReg;
	}

	public String getInsurance() {
		return insurance;
	}

	public String getOwnership() {
		return ownership;
	}

	public String getUsage() {
		return usage;
	}

	public float getRentalPricing() {
		return rentalPricing;
	}

	public String getRespon() {
		return respon;
	}
	
}
