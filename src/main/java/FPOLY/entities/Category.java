package FPOLY.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="categories")
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String description;

	private String name;

	private double price;

	//bi-directional many-to-one association to ProductsCategory
	@OneToMany(mappedBy="category")
	private List<ProductsCategory> productsCategories;

	public Category() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public List<ProductsCategory> getProductsCategories() {
		return this.productsCategories;
	}

	public void setProductsCategories(List<ProductsCategory> productsCategories) {
		this.productsCategories = productsCategories;
	}

	public ProductsCategory addProductsCategory(ProductsCategory productsCategory) {
		getProductsCategories().add(productsCategory);
		productsCategory.setCategory(this);

		return productsCategory;
	}

	public ProductsCategory removeProductsCategory(ProductsCategory productsCategory) {
		getProductsCategories().remove(productsCategory);
		productsCategory.setCategory(null);

		return productsCategory;
	}

}