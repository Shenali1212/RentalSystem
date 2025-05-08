package com.reguser;

public class Reguser {
	private int id;
	private String name;
	private String address;
	private String dob;
	private String email;
	private String mobile;
	private String role;
	private String username;
	private String password;
	
	public Reguser(int id, String name, String address, String dob, String email, String mobile, String role, String username,String password) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.dob = dob;
		this.email = email;
		this.mobile = mobile;
		this.role = role;
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getDob() {
		return dob;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}
	
	public String getRole() {
		return role;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
	
}
