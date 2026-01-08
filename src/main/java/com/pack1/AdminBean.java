package com.pack1;

import java.io.Serializable;

public class AdminBean  implements Serializable
{
	public AdminBean() {}
	
	private String aName,aPwd,aFname,aLname,aAddr,aMid,aPhno;

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public String getaPwd() {
		return aPwd;
	}

	public void setaPwd(String aPwd) {
		this.aPwd = aPwd;
	}

	public String getaFname() {
		return aFname;
	}

	public void setaFname(String aFname) {
		this.aFname = aFname;
	}

	public String getaLname() {
		return aLname;
	}

	public void setaLname(String aLname) {
		this.aLname = aLname;
	}

	public String getaAddr() {
		return aAddr;
	}

	public void setaAddr(String aAddr) {
		this.aAddr = aAddr;
	}

	public String getaMid() {
		return aMid;
	}

	public void setaMid(String aMid) {
		this.aMid = aMid;
	}

	public String getaPhno() {
		return aPhno;
	}

	public void setaPhno(String aPhno) {
		this.aPhno = aPhno;
	}
	

}
