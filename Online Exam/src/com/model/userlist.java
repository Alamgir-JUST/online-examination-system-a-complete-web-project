package com.model;

public class userlist {
	
	protected int id;
	protected String name;
	protected String uname;
	protected String pass;
	protected String repass;
	protected String email;
	protected String subject;
	protected String university;

	public userlist(int id, String uname,String email,String subject, String university) {
		this.id = id;
		this.uname = uname;
		this.email = email;
		this.subject = subject;
		this.university = university;
	}
	public int getId() {
		return id;
	}
	public userlist(int id) {
		this.id = id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRepass() {
		return repass;
	}
	public void setRepass(String repass) {
		this.repass = repass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}

}
