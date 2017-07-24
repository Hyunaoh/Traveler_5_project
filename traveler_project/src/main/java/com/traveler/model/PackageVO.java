package com.traveler.model;
import java.sql.Date;

public class PackageVO {
	
	private int package_pk;
	private String package_title;
	private String package_content;
	private String package_place1;
	private String package_place2;
	private String package_place3;
	private String package_leadTime;
	private String member_id;
	private int package_hit;
	private String package_image;
	private Date package_regDate;
	private int package_status;
	private String package_tag;

	private int countBoardPerPage; // 한 페이지 당 게시물 개수
	private int startBoardNum; // 해당 페이에서의 첫 시작 글
	private int endBoardNum; // 해당 페이에서의 마지막 글

	private double review_avg;

	
	
	
	public int getCountBoardPerPage() {
		return countBoardPerPage;
	}

	public void setCountBoardPerPage(int countBoardPerPage) {
		this.countBoardPerPage = countBoardPerPage;
	}

	public int getStartBoardNum() {
		return startBoardNum;
	}

	public void setStartBoardNum(int startBoardNum) {
		this.startBoardNum = startBoardNum;
	}

	public int getEndBoardNum() {
		return endBoardNum;
	}

	public void setEndBoardNum(int endBoardNum) {
		this.endBoardNum = endBoardNum;
	}

	public String getPackage_tag() {
		return package_tag;
	}

	public void setPackage_tag(String package_tag) {
		this.package_tag = package_tag;
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
		
	public int getPackage_pk() {
		return package_pk;
	}

	public void setPackage_pk(int package_pk) {
		this.package_pk = package_pk;
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

	public Date getPackage_regDate() {
		return package_regDate;
	}

	public int getPackage_hit() {
		return package_hit;
	}

	public void setPackage_hit(int package_hit) {
		this.package_hit = package_hit;
	}

	public String getPackage_image() {
		return package_image;
	}

	public void setPackage_image(String package_image) {
		this.package_image = package_image;
	}

	public int getPackage_status() {
		return package_status;
	}

	public void setPackage_status(int package_status) {
		this.package_status = package_status;
	}
	
	public double getReview_avg() {
		return review_avg;
	}

	public void setReview_avg(double review_avg) {
		this.review_avg = review_avg;
	}

	@Override
	public String toString() {
		return "PackageVO [package_pk=" + package_pk + ", package_title=" + package_title + ", package_content="
				+ package_content + ", package_place1=" + package_place1 + ", package_place2=" + package_place2
				+ ", package_place3=" + package_place3 + ", package_leadTime=" + package_leadTime + ", member_id="
				+ member_id + ", package_hit=" + package_hit + ", package_image=" + package_image + ", package_regDate="
				+ package_regDate + "]";
	}

	
	
}