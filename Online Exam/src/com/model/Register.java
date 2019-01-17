package com.model;

public class Register {
	 private String Name;
	 public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}
	public String getUname() {
		return Uname;
	}
	public void setUname(String uname) {
		this.Uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRepass() {
		return Repass;
	}
	public void setRepass(String repass) {
		this.Repass = repass;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		this.Email = email;
	}
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		this.Subject = subject;
	}
	public String getUniversity() {
		return University;
	}
	public void setUniversity(String university) {
		this.University = university;
	}
	private String Uname;
	 private String password;
	 private String Repass;
	 private String Email;
	 private String Subject;
	 private String University;
}
