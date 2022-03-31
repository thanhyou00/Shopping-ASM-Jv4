package FPOLY.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the products_categories database table.
 * 
 */
@Entity
@Table(name="products_categories")
@NamedQuery(name="ProductsCategory.findAll", query="SELECT p FROM ProductsCategory p")
public class ProductsCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to Category
	@ManyToOne
	private Category category;

	//bi-directional many-to-one association to Product
	@ManyToOne
	private Product product;

	public ProductsCategory() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}