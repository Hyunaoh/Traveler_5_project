package com.traveler.model;

import java.sql.Timestamp;

public class FindVO {

	private int find_pk; // int(1) primary key, -- find pk
	private String find_title; // varchar(500) not null, -- 제목
	private String find_content; // varchar(3000) not null, -- 본문 내용
	private String find_place1; // varchar(500) not null, -- 원하는 나라
	private String find_place2; // varchar(500) not null, -- 원하는 지역
	private String find_place3; // varchar(3000) not null, -- 원하는 상세내용
	private String find_startDate; // varchar(500) not null, -- 여행 시작 기간
	private String find_endDate; // varchar(500) not null, -- 여행 끝 기간
	private int find_hit; // int(1) not null default 0, -- 조회수
	private String member_id; // varchar(500) not null, -- 작성자 아이디
	private Timestamp find_regDate; // timestamp not null -- 글 작성 날짜
	private String search; // 검색어
	
	public int getFind_pk() {
		return find_pk;
	}
	public void setFind_pk(int find_pk) {
		this.find_pk = find_pk;
	}
	public String getFind_title() {
		return find_title;
	}
	public void setFind_title(String find_title) {
		this.find_title = find_title;
	}
	public String getFind_content() {
		return find_content;
	}
	public void setFind_content(String find_content) {
		this.find_content = find_content;
	}
	public String getFind_place1() {
		return find_place1;
	}
	public void setFind_place1(String find_place1) {
		this.find_place1 = find_place1;
	}
	public String getFind_place2() {
		return find_place2;
	}
	public void setFind_place2(String find_place2) {
		this.find_place2 = find_place2;
	}
	public String getFind_place3() {
		return find_place3;
	}
	public void setFind_place3(String find_place3) {
		this.find_place3 = find_place3;
	}
	public String getFind_startDate() {
		return find_startDate;
	}
	public void setFind_startDate(String find_startDate) {
		this.find_startDate = find_startDate;
	}
	public String getFind_endDate() {
		return find_endDate;
	}
	public void setFind_endDate(String find_endDate) {
		this.find_endDate = find_endDate;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getFind_regDate() {
		return find_regDate;
	}
	public void setFind_regDate(Timestamp find_regDate) {
		this.find_regDate = find_regDate;
	}
	public int getFind_hit() {
		return find_hit;
	}
	public void setFind_hit(int find_hit) {
		this.find_hit = find_hit;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
}
