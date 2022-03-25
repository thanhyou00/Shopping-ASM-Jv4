package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.entities.Product;
import FPOLY.utils.JpaUtils;

public class ProductDAO {
	
	private EntityManager em = JpaUtils.getEntityManager(); 
	
	public List<Product> findAll(){
		TypedQuery<Product> query = em.createNamedQuery("Product.findAll", Product.class);
		return query.getResultList();
	}
}
