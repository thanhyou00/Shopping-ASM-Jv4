package FPOLY.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="order_detail")
@NamedQuery(name="OrderDetail.findAll", query="SELECT o FROM OrderDetail o")
public class OrderDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int quantity;

	//bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;

	//bi-directional many-to-one association to Order
	@ManyToOne
	private Order order;

	public OrderDetail() {
	}
	

	public OrderDetail(int id, int quantity, Product product, Order order) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.product = product;
		this.order = order;
	}


	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}