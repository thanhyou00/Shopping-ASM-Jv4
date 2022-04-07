package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.entities.Order;
import FPOLY.utils.JpaUtils;

public class OrderDAO {

	private EntityManager em;
	public OrderDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<Order> findAll(int index, int n) throws Exception {
		try {
			this.em.getTransaction().begin();
			String jpql = "SELECT obj FROM Order obj";
			TypedQuery<Order> query = this.em.createQuery(jpql, Order.class).setMaxResults(n).setFirstResult((index-1)*n);
			this.em.getTransaction().commit();
			return query.getResultList();	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}	
	}
	public Order update(Order entity) throws Exception{
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
	public Order findById(int id) {
		return this.em.find(Order.class, id);
	}
	
	public long getTotalOrder() {
		String jpql = "SELECT count(obj.id) FROM Order obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	
	
	public Order create(Order entity) throws Exception {
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
}
