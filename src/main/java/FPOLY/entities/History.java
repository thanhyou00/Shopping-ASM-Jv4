package FPOLY.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class History implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int quantity;
	private String name;
	private String image;
	private double price;
	private int status;
	public History() {
		super();
	}
	public History(int quantity, String name, String image, double price, int status) {
		super();
		this.quantity = quantity;
		this.name = name;
		this.image = image;
		this.price = price;
		this.status = status;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "History [quantity=" + quantity + ", name=" + name + ", image=" + image + ", price=" + price
				+ ", status=" + status + "]";
	}
	
}
