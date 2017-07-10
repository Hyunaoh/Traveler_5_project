package com.traveler.model;

public class FacebookVO {

	private String f_name;
	private String f_gender;
	private String f_email;
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_gender() {
		return f_gender;
	}
	public void setF_gender(String f_gender) {
		this.f_gender = f_gender;
	}
	public String getF_email() {
		return f_email;
	}
	public void setF_email(String f_email) {
		this.f_email = f_email;
	}
	@Override
	public String toString() {
		return "FacebookVO [f_name=" + f_name + ", f_gender=" + f_gender + ", f_email=" + f_email + "]";
	}
	
	
}
