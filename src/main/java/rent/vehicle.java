package rent;

public class vehicle {

	private String id;
	String name;
	String Type;
	float price;
	String status;
	String transmisson;
	String gas;
	int seatsC;
	String imgPath;
	
	public vehicle(String id, String name, String type, float price, String status, String transmisson, String gas,
			int seatsC, String imgPath) {
		this.id = id;
		this.name = name;
		Type = type;
		this.price = price;
		this.status = status;
		this.transmisson = transmisson;
		this.gas = gas;
		this.seatsC = seatsC;
		this.imgPath = imgPath;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getType() {
		return Type;
	}

	public float getPrice() {
		return price;
	}

	public String getStatus() {
		return status;
	}

	public String getTransmisson() {
		return transmisson;
	}

	public String getGas() {
		return gas;
	}

	public int getSeatsC() {
		return seatsC;
	}
	
	public String getImgPath() {
		return imgPath;
	}
	
	
	
	
	
	
}
