package com.traveler.model;

public class HashTagVO {
	private int hashTag_pk;
	private String hashTag_tag;
	
	public int getHashTag_pk() {
		return hashTag_pk;
	}
	public void setHashTag_pk(int hashTag_pk) {
		this.hashTag_pk = hashTag_pk;
	}
	public String getHashTag_tag() {
		return hashTag_tag;
	}
	public void setHashTag_tag(String hashTag_tag) {
		this.hashTag_tag = hashTag_tag;
	}
	
	@Override
	public String toString() {
		return "HashTagVO [hashTag_pk=" + hashTag_pk + ", hashTag_tag=" + hashTag_tag + "]";
	}

	
}
