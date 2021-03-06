package com.traveler.model;

public class M_groupVO {

	private int group_mem_pk; // int(1) not null auto_increment primary key, -- pk
	private int group_mem_package_pk; // int(1) not null, -- 어떤 상품??(상품 pk)
	private String group_mem_reserve_id; // varchar(500) not null, -- 예약한 사람의 아이디
	private String group_mem_id; // varchar(500), -- 회원 아이디 (없으면 null)
	private String group_mem_name; // varchar(500) not null, -- 예약한 사람의 이름
	private int group_mem_age; // int(1) not null, -- 연령
	private String group_mem_gender; // varchar(500) not null, -- 성별
	private int group_mem_status; // int(1) not null -- 0: 입금 대기중, 1: 입금 완료
	private String group_mem_str_age; // 문자열 나이
	private int group_mem_count; // 예약한 단체의 손님 수 (예) 김태홍 외 친구 4명 : 총 5명
	private double avg_age; // 예약한 단체 손님의 평균 연령
	private int group_pak_cost; // 두당 가격
	
	// set get method
	public int getGroup_mem_pk() {
		return group_mem_pk;
	}
	public void setGroup_mem_pk(int group_mem_pk) {
		this.group_mem_pk = group_mem_pk;
	}
	public int getGroup_mem_package_pk() {
		return group_mem_package_pk;
	}
	public void setGroup_mem_package_pk(int group_mem_package_pk) {
		this.group_mem_package_pk = group_mem_package_pk;
	}
	public String getGroup_mem_reserve_id() {
		return group_mem_reserve_id;
	}
	public void setGroup_mem_reserve_id(String group_mem_reserve_id) {
		this.group_mem_reserve_id = group_mem_reserve_id;
	}
	public String getGroup_mem_id() {
		return group_mem_id;
	}
	public void setGroup_mem_id(String group_mem_id) {
		this.group_mem_id = group_mem_id;
	}
	public String getGroup_mem_name() {
		return group_mem_name;
	}
	public void setGroup_mem_name(String group_mem_name) {
		this.group_mem_name = group_mem_name;
	}
	public int getGroup_mem_age() {
		return group_mem_age;
	}
	public void setGroup_mem_age(int group_mem_age) {
		this.group_mem_age = group_mem_age;
	}
	public String getGroup_mem_gender() {
		return group_mem_gender;
	}
	public void setGroup_mem_gender(String group_mem_gender) {
		this.group_mem_gender = group_mem_gender;
	}
	public int getGroup_mem_status() {
		return group_mem_status;
	}
	public void setGroup_mem_status(int group_mem_status) {
		this.group_mem_status = group_mem_status;
	}
	public String getGroup_mem_str_age() {
		return group_mem_str_age;
	}
	public void setGroup_mem_str_age(String group_mem_str_age) {
		this.group_mem_str_age = group_mem_str_age;
	}
	public int getGroup_mem_count() {
		return group_mem_count;
	}
	public void setGroup_mem_count(int group_mem_count) {
		this.group_mem_count = group_mem_count;
	}
	public double getAvg_age() {
		return avg_age;
	}
	public void setAvg_age(double avg_age) {
		this.avg_age = avg_age;
	}
	public int getGroup_pak_cost() {
		return group_pak_cost;
	}
	public void setGroup_pak_cost(int group_pak_cost) {
		this.group_pak_cost = group_pak_cost;
	}
	@Override
	public String toString() {
		return "M_groupVO [group_mem_pk=" + group_mem_pk + ", group_mem_package_pk=" + group_mem_package_pk
				+ ", group_mem_reserve_id=" + group_mem_reserve_id + ", group_mem_id=" + group_mem_id
				+ ", group_mem_name=" + group_mem_name + ", group_mem_age=" + group_mem_age + ", group_mem_gender="
				+ group_mem_gender + ", group_mem_status=" + group_mem_status + ", group_mem_str_age="
				+ group_mem_str_age + ", group_mem_count=" + group_mem_count + ", avg_age=" + avg_age
				+ ", group_pak_cost=" + group_pak_cost + "]";
	}
	
}
