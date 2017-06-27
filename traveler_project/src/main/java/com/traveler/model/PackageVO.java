package com.traveler.model;
import java.sql.Date;

public class PackageVO {
	
	private String package_pk;
	private String package_title;
	private String package_content;
	private String package_place1;
	private String package_place2;
	private String package_place3;
	private String package_leadTime;
	private String member_id;
	private Date package_regDate;
	
	public void setPackage_pk(String package_pk){
		this.package_pk = package_pk;
	}
	
	public void setPackage_title(String package_title){
		this.package_title = package_title;
	}
	
	public void setPackage_content(String package_content){
		this.package_content = package_content;
	}
	
	public void setPackage_place1(String package_place1){
		this.package_place1 = package_place1;
	}
	
	public void setPackage_place2(String package_place2){
		this.package_place2 = package_place2;
	}
	
	public void setPackage_place3(String package_place3){
		this.package_place3 = package_place3;
	}
	
	public void setPackage_leadTime(String package_leadTime){
		this.package_leadTime = package_leadTime;
	}

	public void setMember_id(String member_id){
		this.member_id = member_id;
	}
	
	public void setPackage_regDate(Date package_regDate){
		this.package_regDate = package_regDate;
	}
	
	public String getPackage_pk(){
		return this.package_pk;
	}
	
	public String getPackage_title(){
		return this.package_title;
	}
	
	public String getPackage_content(){
		return this.package_content;
	}
	
	public String getPackage_place1(){
		return this.package_place1;
	}
	
	public String getPackage_place2(){
		return this.package_place2;
	}
	
	public String getPackage_place3(){
		return this.package_place3;
	}
	
	public String getPackage_leadTime(){
		return this.package_leadTime;
	}
	
	public String getMember_id(){
		return this.member_id;
	}
	
	public Date getPackage_regDate(){
		return this.package_regDate;
	}	
	
}