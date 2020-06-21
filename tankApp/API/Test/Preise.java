package Test;

public class Preise {

	
	int hour;
	double price;
	
	public Preise(int hour, double price) {
		super();
		this.hour = hour;
		this.price = price;
	}
	
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
}
