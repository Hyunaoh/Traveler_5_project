package com.traveler.model;

public class CounselVO {
	
	private String member_id;
	private String counsel_date;
	private String counsel_title;
	private String counsel_content;
	private String counsel_flag;
	private String search;
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCounsel_date() {
		return counsel_date;
	}
	public void setCounsel_date(String counsel_date) {
		this.counsel_date = counsel_date;
	}
	public String getCounsel_title() {
		return counsel_title;
	}
	public void setCounsel_title(String counsel_title) {
		this.counsel_title = counsel_title;
	}
	public String getCounsel_content() {
		return counsel_content;
	}
	public void setCounsel_content(String counsel_content) {
		this.counsel_content = counsel_content;
	}
	public String getCounsel_flag() {
		return counsel_flag;
	}
	public void setCounsel_flag(String counsel_flag) {
		this.counsel_flag = counsel_flag;
	}
	@Override
	public String toString() {
		return "counselVO [member_id=" + member_id + ", counsel_date=" + counsel_date + ", counsel_title="
				+ counsel_title + ", counsel_content=" + counsel_content + ", counsel_flag=" + counsel_flag + "]";
	}
	
	
}
