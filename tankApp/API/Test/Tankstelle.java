package Test;

import java.util.UUID;

public class  Tankstelle {
	
	UUID id;
	String name;
	String brand;
	String street;
	String place;
	float lat;
	float lng;
	float dist;
	
	float diesel;
	float e5;
	float e10;
	
	boolean isOpen;
	String houseNumber;
	int postCode;
	
	

	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public float getDist() {
		return dist;
	}
	public void setDist(float dist) {
		this.dist = dist;
	}
	public float getDiesel() {
		return diesel;
	}
	public void setDiesel(float diesel) {
		this.diesel = diesel;
	}
	public float getE5() {
		return e5;
	}
	public void setE5(float e5) {
		this.e5 = e5;
	}
	public float getE10() {
		return e10;
	}
	public void setE10(float e10) {
		this.e10 = e10;
	}
	public boolean isOpen() {
		return isOpen;
	}
	public void setOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}
	public String getHouseNumber() {
		return houseNumber;
	}
	public void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	
}
