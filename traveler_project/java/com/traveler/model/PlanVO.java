package com.traveler.model;

public class PlanVO {

	private int plan_pk; // int(1) not null AUTO_INCREMENT primary key,  -- plan pk
	private String plan_title; // varchar(500) not null, -- 여행 계획 제목
	private String plan_subTitle; // varchar(500) not null, -- 여행 소제목
	private String plan_img; // varchar(1000) not null, -- 내용에 해당하는 이미지
	private String plan_content; // varchar(1000) not null, -- 내용
	private String plan_place; // varchar(1000) not null, -- 여행 장소
	private String plan_date; // varchar(1000) not null, -- 여행 날짜
	private int plan_count; // int(1) not null, -- 여행 장소 개수
	private String plan_regDate; // varchar(500) not null, -- 등록일
	private String plan_writer; //varchar(500) not null -- 작성자
	
	// set get method
	public int getPlan_pk() {
		return plan_pk;
	}
	public void setPlan_pk(int plan_pk) {
		this.plan_pk = plan_pk;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public String getPlan_subTitle() {
		return plan_subTitle;
	}
	public void setPlan_subTitle(String plan_subTitle) {
		this.plan_subTitle = plan_subTitle;
	}
	public String getPlan_img() {
		return plan_img;
	}
	public void setPlan_img(String plan_img) {
		this.plan_img = plan_img;
	}
	public String getPlan_content() {
		return plan_content;
	}
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}
	public String getPlan_place() {
		return plan_place;
	}
	public void setPlan_place(String plan_place) {
		this.plan_place = plan_place;
	}
	public String getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(String plan_date) {
		this.plan_date = plan_date;
	}
	public int getPlan_count() {
		return plan_count;
	}
	public void setPlan_count(int plan_count) {
		this.plan_count = plan_count;
	}
	public String getPlan_regDate() {
		return plan_regDate;
	}
	public void setPlan_regDate(String plan_regDate) {
		this.plan_regDate = plan_regDate;
	}
	public String getPlan_writer() {
		return plan_writer;
	}
	public void setPlan_writer(String plan_writer) {
		this.plan_writer = plan_writer;
	}
	
	@Override
	public String toString() {
		return "PlanVO [plan_pk=" + plan_pk + ", plan_title=" + plan_title + ", plan_subTitle=" + plan_subTitle
				+ ", plan_img=" + plan_img + ", plan_content=" + plan_content + ", plan_place=" + plan_place
				+ ", plan_date=" + plan_date + ", plan_count=" + plan_count + ", plan_regDate=" + plan_regDate
				+ ", plan_writer=" + plan_writer + "]";
	}
}
