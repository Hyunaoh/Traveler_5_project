package com.traveler.model;

public class RoleVO {
	private String member_id; // varchar(500) primary key, -- id
	private String role; // varchar(500) -- 권한
	
	public RoleVO(){}
	public RoleVO(String member_id, String role){
		this.member_id = member_id;
		this.role = role;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
}
