package com.traveler.model;

import java.util.Date;


public class MemberVO {
	String member_id;	//id	
	String member_pwd;	//password
	String member_name;	//�̸�
	String member_nickName;	//�г���
	String member_gender;	//����	
	String member_nationality;	//����
	String member_language;	//������
	String member_certification;	//�ڰ���
	String member_tel;	//��ȭ��ȣ
	String member_email;	//�̸���
	int member_post;	//�����ȣ
	String member_adrr;	//�ּ�
	String member_addrDetail;	//���ּ�
	String member_profile ;	//�����ʻ���
	int member_isGuide;	//���̵� ���� 
	String member_joinDate;	//���Գ�¥
	int startNum; // 첫번째 글
	int endNum; // 마지막 글
	int pageSize; // 한 페이지의 크기 (몇개의 글?)
	int pageNum; // 몇 페이지?
	int pageTotalNum; // 전체 페이지 개수
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageTotalNum() {
		return pageTotalNum;
	}
	public void setPageTotalNum(int pageTotalNum) {
		this.pageTotalNum = pageTotalNum;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickName() {
		return member_nickName;
	}
	public void setMember_nickName(String member_nickName) {
		this.member_nickName = member_nickName;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_nationality() {
		return member_nationality;
	}
	public void setMember_nationality(String member_nationality) {
		this.member_nationality = member_nationality;
	}
	public String getMember_language() {
		return member_language;
	}
	public void setMember_language(String member_language) {
		this.member_language = member_language;
	}
	public String getMember_certification() {
		return member_certification;
	}
	public void setMember_certification(String member_certification) {
		this.member_certification = member_certification;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public int getMember_post() {
		return member_post;
	}
	public void setMember_post(int member_post) {
		this.member_post = member_post;
	}
	public String getMember_adrr() {
		return member_adrr;
	}
	public void setMember_adrr(String member_adrr) {
		this.member_adrr = member_adrr;
	}
	public String getMember_addrDetail() {
		return member_addrDetail;
	}
	public void setMember_addrDetail(String member_addrDetail) {
		this.member_addrDetail = member_addrDetail;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public int getMember_isGuide() {
		return member_isGuide;
	}
	public void setMember_isGuide(int member_isGuide) {
		this.member_isGuide = member_isGuide;
	}
	public String getMember_joinDate() {
		return member_joinDate;
	}
	public void setMember_joinDate(String member_joinDate) {
		this.member_joinDate = member_joinDate;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", member_nickName=" + member_nickName + ", member_gender=" + member_gender + ", member_nationality="
				+ member_nationality + ", member_language=" + member_language + ", member_certification="
				+ member_certification + ", member_tel=" + member_tel + ", member_email=" + member_email
				+ ", member_post=" + member_post + ", member_adrr=" + member_adrr + ", member_addrDetail="
				+ member_addrDetail + ", member_profile=" + member_profile + ", member_isGuide=" + member_isGuide
				+ ", member_joinDate=" + member_joinDate + "]";
	}
	
	
	
}
