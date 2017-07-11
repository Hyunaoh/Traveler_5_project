package com.traveler.model;

import java.sql.Date;
import java.sql.Timestamp;

public class ReviewVO {
	private int review_pk;
	private String member_id;
	private int package_pk;
	private String review_comment;
	private Timestamp review_date;
	private int update_check;
	private int review_score;
	
	public int getReview_pk() {
		return review_pk;
	}
	public void setReview_pk(int review_pk) {
		this.review_pk = review_pk;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPackage_pk() {
		return package_pk;
	}
	public void setPackage_pk(int package_pk) {
		this.package_pk = package_pk;
	}
	public String getReview_comment() {
		return review_comment;
	}
	public void setReview_comment(String review_comment) {
		this.review_comment = review_comment;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public int getUpdate_check() {
		return update_check;
	}
	public void setUpdate_check(int update_check) {
		this.update_check = update_check;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	
	
}
