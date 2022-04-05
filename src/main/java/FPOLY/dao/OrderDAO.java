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
	
	public List<Order> findAll() throws Exception {
		try {
			this.em.getTransaction().begin();
			String jpql = "SELECT obj FROM OrderDetail obj";
			TypedQuery<Order> query = this.em.createQuery(jpql, Order.class);
			this.em.getTransaction().commit();
			return query.getResultList();	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
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
