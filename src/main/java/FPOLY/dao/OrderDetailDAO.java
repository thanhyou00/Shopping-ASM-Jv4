package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.entities.OrderDetail;
import FPOLY.utils.JpaUtils;

public class OrderDetailDAO {

	private EntityManager em;
	public OrderDetailDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<OrderDetail> findAll() throws Exception {
		try {
			this.em.getTransaction().begin();
			String jpql = "SELECT obj FROM OrderDetail obj";
			TypedQuery<OrderDetail> query = this.em.createQuery(jpql, OrderDetail.class);
			this.em.getTransaction().commit();
			return query.getResultList();	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public long getTotalOrderDetail() {
		String jpql = "SELECT count(obj.id) FROM OrderDetail obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	
	public OrderDetail findById(int id) {
		return this.em.find(OrderDetail.class, id);
	}
	
	public OrderDetail create(OrderDetail entity) throws Exception {
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
	
	public OrderDetail delete(OrderDetail entity) throws Exception {
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
	
	public OrderDetail update(OrderDetail entity) throws Exception {
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
