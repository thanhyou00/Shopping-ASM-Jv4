package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.utils.JpaUtils;
import FPOLY.entities.User;

public class UserDAO {

	private EntityManager em;
	public UserDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<User> findAll() throws Exception {
		try {
			this.em.getTransaction().begin();
			String jpql = "SELECT obj FROM User obj";
			TypedQuery<User> query = this.em.createQuery(jpql, User.class);
			this.em.getTransaction().commit();
			this.em.flush();
			return query.getResultList();	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
	
	public List<User> pagination(int index,int n) {
		String jpql = "SELECT obj FROM User obj ORDER BY obj.id";
		TypedQuery<User> query = this.em.createQuery(jpql, User.class).setMaxResults(n).setFirstResult((index-1)*n); // 1 trang se co toi da n san pham
		//other ways : https://thorben-janssen.com/hibernate-tips-use-pagination-jpql
		return query.getResultList(); 
	}
	
	public long getTotalUser() {
		String jpql = "SELECT count(obj.id) FROM User obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	
	public User findById(int id) {
		return this.em.find(User.class, id);
	}
	public User findByEmail(String email) {
		String jpql = "SELECT obj FROM User obj "
				+ "WHERE obj.email = :email";
		TypedQuery<User> query = this.em
			.createQuery(jpql, User.class);
		query.setParameter("email", email);
		
		return query.getSingleResult();
	}
	
	public User create(User entity) throws Exception {
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
	
	public User delete(User entity) throws Exception {
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
	
	public User update(User entity) throws Exception {
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
