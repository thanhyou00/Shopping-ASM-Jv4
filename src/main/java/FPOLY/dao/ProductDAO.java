package FPOLY.dao;

import java.io.FileInputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import FPOLY.entities.Product;
import FPOLY.utils.JpaUtils;

public class ProductDAO {
	
	private EntityManager em;
	
	public ProductDAO() {
		this.em = JpaUtils.getEntityManager(); 
	}
	
	public List<Product> findAll() {
			TypedQuery<Product> query = this.em.createNamedQuery("Product.findAll", Product.class);
			return query.getResultList();
	}

	public List<Product> pagination(int index,int n) {
		String jpql = "SELECT obj FROM Product obj ORDER BY obj.id";
		TypedQuery<Product> query = this.em.createQuery(jpql, Product.class).setMaxResults(n).setFirstResult((index-1)*n); // 1 trang se co toi da n san pham
		//other ways : https://thorben-janssen.com/hibernate-tips-use-pagination-jpql
		return query.getResultList(); 
	}
	
	public List<Product> paginationHome(int index,int n, int ctId) {
		String jpql = "SELECT * FROM `products` JOIN `products_categories`ON `products_categories`.`product_id` = `products`.`id` JOIN `categories`ON `categories`.`id`=`products_categories`.`category_id` WHERE `categories`.`id`=" +ctId;
		TypedQuery<Product> query = (TypedQuery<Product>) this.em.createNativeQuery(jpql, Product.class).setMaxResults(n).setFirstResult((index-1)*n); // 1 trang se co toi da n san pham
		//other ways : https://thorben-janssen.com/hibernate-tips-use-pagination-jpql
		return query.getResultList(); 
	}
	
	
	public long getTotalProduct() {
		String jpql = "SELECT count(obj.id) FROM Product obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}

	public Product findById(int id) {
		return this.em.find(Product.class, id);
	}
	
	public Product create(Product entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			this.em.persist(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public Product delete(Product entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			this.em.remove(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public Product update(Product entity) throws Exception{
		try {
			this.em.getTransaction().begin();
			this.em.merge(entity);
			this.em.getTransaction().commit();
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
}
