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

	private UUID getId() {
		return id;
	}
	private void setId(UUID id) {
		this.id = id;
	}
	private String getName() {
		return name;
	}
	private void setName(String name) {
		this.name = name;
	}
	private String getBrand() {
		return brand;
	}
	private void setBrand(String brand) {
		this.brand = brand;
	}
	private String getStreet() {
		return street;
	}
	private void setStreet(String street) {
		this.street = street;
	}
	private String getPlace() {
		return place;
	}
	private void setPlace(String place) {
		this.place = place;
	}
	private float getLat() {
		return lat;
	}
	private void setLat(float lat) {
		this.lat = lat;
	}
	private float getLng() {
		return lng;
	}
	private void setLng(float lng) {
		this.lng = lng;
	}
	private float getDist() {
		return dist;
	}
	private void setDist(float dist) {
		this.dist = dist;
	}
	private float getDiesel() {
		return diesel;
	}
	private void setDiesel(float diesel) {
		this.diesel = diesel;
	}
	private float getE5() {
		return e5;
	}
	private void setE5(float e5) {
		this.e5 = e5;
	}
	private float getE10() {
		return e10;
	}
	private void setE10(float e10) {
		this.e10 = e10;
	}
	private boolean isOpen() {
		return isOpen;
	}
	private void setOpen(boolean isOpen) {
		this.isOpen = isOpen;
	}
	private String getHouseNumber() {
		return houseNumber;
	}
	private void setHouseNumber(String houseNumber) {
		this.houseNumber = houseNumber;
	}
	private int getPostCode() {
		return postCode;
	}
	private void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	
}
