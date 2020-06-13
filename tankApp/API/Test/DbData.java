package Test;

import java.util.Date;

public class DbData {
	
	int tId;
	String tsId;
	String tsName;
	String user;
	String fuel;
	double preis;
	double liter;	
	Date date;
	
public DbData(int tId, String tsId, String tsName, String user, String fuel, double preis, double liter, Date date) {
		super();
		this.tId = tId;
		this.tsId = tsId;
		this.tsName = tsName;
		this.user = user;
		this.fuel = fuel;
		this.preis = preis;
		this.liter = liter;
		this.date = date;
	}

public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public String getTsId() {
		return tsId;
	}
	public void setTsId(String tsId) {
		this.tsId = tsId;
	}
	public String getTsName() {
		return tsName;
	}
	public void setTsName(String tsName) {
		this.tsName = tsName;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public double getPreis() {
		return preis;
	}
	public void setPreis(double preis) {
		this.preis = preis;
	}
	public double getLiter() {
		return liter;
	}
	public void setLiter(double liter) {
		this.liter = liter;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

}
