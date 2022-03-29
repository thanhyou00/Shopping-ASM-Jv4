package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.entities.Product;
import FPOLY.utils.JpaUtils;

public class ProductDAO {
	
	private EntityManager em;
	
	public ProductDAO() {
		this.em = JpaUtils.getEntityManager(); 
	}
	
	public List<Product> findAll() throws Exception{
		try {
			this.em.getTransaction().begin();
			TypedQuery<Product> query = this.em.createNamedQuery("Product.findAll", Product.class);
			this.em.getTransaction().commit();
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
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
	
}
