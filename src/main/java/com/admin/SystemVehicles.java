package com.admin;

public class SystemVehicles {
	private int id;
	private String makeModel;
	private String transmission;
	private String fuel;
	private String vehiclePhoto;
	private float rentalPricing;
	private String availability;
	
	
	public SystemVehicles(int id, String makeModel, String transmission, String fuel, String vehiclePhoto, float rentalPricing, String availability) {
		this.id = id;
		this.makeModel = makeModel;
		this.transmission = transmission;
		this.fuel = fuel;
		this.vehiclePhoto = vehiclePhoto;
		this.rentalPricing = rentalPricing;
		this.availability = availability;
	}


	public int getId() {
		return id;
	}

	public String getMakeModel() {
		return makeModel;
	}

	public String getTransmission() {
		return transmission;
	}

	public String getFuel() {
		return fuel;
	}

	public String getVehiclePhoto() {
		return vehiclePhoto;
	}

	public float getRentalPricing() {
		return rentalPricing;
	}
	
	public String getAvailability() {
		return availability;
	}

	
}
