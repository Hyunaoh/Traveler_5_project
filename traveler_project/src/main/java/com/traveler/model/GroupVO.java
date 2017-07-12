package com.traveler.model;

public class GroupVO {

	private int group_pak_pk; // int(1) not null AUTO_INCREMENT primary key, -- pk
	private String group_pak_title; // varchar(500) not null, -- 제목
	private String group_pak_content; // varchar(1000) not null, -- 내용
	private String group_pak_photo; // varchar(1000) not null, -- 사진 이름
	private String group_pak_place1; // varchar(1000) not null, -- 나라
	private String group_pak_place2; // varchar(1000) not null, -- 도시
	private String group_pak_place3; // varchar(1000) not null, -- 상세 장소
	private int group_pak_cost; // int(1) not null, -- 두당 가격
	private String group_pak_guide; // varchar(500) not null, -- 가이드 ID
	private int group_pak_min; // int(1) not null, -- 최소 인원
	private int group_pak_max; // int(1) not null, -- 최대 인원
	private int group_pak_current; // int(1) not null, -- 현재 인원
	private String group_pak_regDate; // varchar(1000) not null, -- 글 작성일
	private int group_pak_status; // int(1) not null, -- 0: 글 승인 대기중, 1: 승인된 글
	private int group_pak_flag1; // int(1) not null, -- 0: 자리있음, 1: 자리꽉참
	private int group_pak_flag2; // int(1) not null -- 0: 여행 전, 1: 여행중 또는 여행 후
	
	// set get method
	public int getGroup_pak_pk() {
		return group_pak_pk;
	}
	public void setGroup_pak_pk(int group_pak_pk) {
		this.group_pak_pk = group_pak_pk;
	}
	public String getGroup_pak_title() {
		return group_pak_title;
	}
	public void setGroup_pak_title(String group_pak_title) {
		this.group_pak_title = group_pak_title;
	}
	public String getGroup_pak_content() {
		return group_pak_content;
	}
	public void setGroup_pak_content(String group_pak_content) {
		this.group_pak_content = group_pak_content;
	}
	public String getGroup_pak_photo() {
		return group_pak_photo;
	}
	public void setGroup_pak_photo(String group_pak_photo) {
		this.group_pak_photo = group_pak_photo;
	}
	public String getGroup_pak_place1() {
		return group_pak_place1;
	}
	public void setGroup_pak_place1(String group_pak_place1) {
		this.group_pak_place1 = group_pak_place1;
	}
	public String getGroup_pak_place2() {
		return group_pak_place2;
	}
	public void setGroup_pak_place2(String group_pak_place2) {
		this.group_pak_place2 = group_pak_place2;
	}
	public String getGroup_pak_place3() {
		return group_pak_place3;
	}
	public void setGroup_pak_place3(String group_pak_place3) {
		this.group_pak_place3 = group_pak_place3;
	}
	public int getGroup_pak_cost() {
		return group_pak_cost;
	}
	public void setGroup_pak_cost(int group_pak_cost) {
		this.group_pak_cost = group_pak_cost;
	}
	public String getGroup_pak_guide() {
		return group_pak_guide;
	}
	public void setGroup_pak_guide(String group_pak_guide) {
		this.group_pak_guide = group_pak_guide;
	}
	public int getGroup_pak_min() {
		return group_pak_min;
	}
	public void setGroup_pak_min(int group_pak_min) {
		this.group_pak_min = group_pak_min;
	}
	public int getGroup_pak_max() {
		return group_pak_max;
	}
	public void setGroup_pak_max(int group_pak_max) {
		this.group_pak_max = group_pak_max;
	}
	public int getGroup_pak_current() {
		return group_pak_current;
	}
	public void setGroup_pak_current(int group_pak_current) {
		this.group_pak_current = group_pak_current;
	}
	public String getGroup_pak_regDate() {
		return group_pak_regDate;
	}
	public void setGroup_pak_regDate(String group_pak_regDate) {
		this.group_pak_regDate = group_pak_regDate;
	}
	public int getGroup_pak_status() {
		return group_pak_status;
	}
	public void setGroup_pak_status(int group_pak_status) {
		this.group_pak_status = group_pak_status;
	}
	public int getGroup_pak_flag1() {
		return group_pak_flag1;
	}
	public void setGroup_pak_flag1(int group_pak_flag1) {
		this.group_pak_flag1 = group_pak_flag1;
	}
	public int getGroup_pak_flag2() {
		return group_pak_flag2;
	}
	public void setGroup_pak_flag2(int group_pak_flag2) {
		this.group_pak_flag2 = group_pak_flag2;
	}
	@Override
	public String toString() {
		return "GroupVO [group_pak_pk=" + group_pak_pk + ", group_pak_title=" + group_pak_title + ", group_pak_content="
				+ group_pak_content + ", group_pak_photo=" + group_pak_photo + ", group_pak_place1=" + group_pak_place1
				+ ", group_pak_place2=" + group_pak_place2 + ", group_pak_place3=" + group_pak_place3
				+ ", group_pak_cost=" + group_pak_cost + ", group_pak_guide=" + group_pak_guide + ", group_pak_min="
				+ group_pak_min + ", group_pak_max=" + group_pak_max + ", group_pak_current=" + group_pak_current
				+ ", group_pak_regDate=" + group_pak_regDate + ", group_pak_status=" + group_pak_status
				+ ", group_pak_flag1=" + group_pak_flag1 + ", group_pak_flag2=" + group_pak_flag2 + "]";
	}
}
