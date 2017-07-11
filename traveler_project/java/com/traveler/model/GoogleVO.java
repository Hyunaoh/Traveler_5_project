package com.traveler.model;

public class GoogleVO {

	private String email; // : obj['email'],
	private String name; // : obj['name'],
	private String gender; // :  obj['gender'],
	private String pictureUrl; // : obj['picture'],
	private String linkUrl; // : obj['link']
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	@Override
	public String toString() {
		return "GoogleVO [email=" + email + ", name=" + name + ", gender=" + gender + ", pictureUrl=" + pictureUrl
				+ ", linkUrl=" + linkUrl + "]";
	}
	
	
}
