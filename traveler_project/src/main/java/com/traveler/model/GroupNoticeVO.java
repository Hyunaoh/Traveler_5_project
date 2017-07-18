package com.traveler.model;

public class GroupNoticeVO {

	private int group_notice_pk; // int(1) not null auto_increment primary key, -- pk
	private String group_notice_content; // varchar(1000) not null, -- 내용
	private String group_notice_writer; // varchar(500) not null, -- 작성자
	private int group_notice_parent_pk; // int(1) not null, -- 부모글의 pk
	private String group_notice_regDate; // varchar(500) not null -- 작성 날짜
	
	// set get method
	public int getGroup_notice_pk() {
		return group_notice_pk;
	}
	public void setGroup_notice_pk(int group_notice_pk) {
		this.group_notice_pk = group_notice_pk;
	}
	public String getGroup_notice_content() {
		return group_notice_content;
	}
	public void setGroup_notice_content(String group_notice_content) {
		this.group_notice_content = group_notice_content;
	}
	public String getGroup_notice_writer() {
		return group_notice_writer;
	}
	public void setGroup_notice_writer(String group_notice_writer) {
		this.group_notice_writer = group_notice_writer;
	}
	public int getGroup_notice_parent_pk() {
		return group_notice_parent_pk;
	}
	public void setGroup_notice_parent_pk(int group_notice_parent_pk) {
		this.group_notice_parent_pk = group_notice_parent_pk;
	}
	public String getGroup_notice_regDate() {
		return group_notice_regDate;
	}
	public void setGroup_notice_regDate(String group_notice_regDate) {
		this.group_notice_regDate = group_notice_regDate;
	}
	
	@Override
	public String toString() {
		return "GroupNoticeVO [group_notice_pk=" + group_notice_pk + ", group_notice_content=" + group_notice_content
				+ ", group_notice_writer=" + group_notice_writer + ", group_notice_parent_pk=" + group_notice_parent_pk
				+ ", group_notice_regDate=" + group_notice_regDate + "]";
	}
}
