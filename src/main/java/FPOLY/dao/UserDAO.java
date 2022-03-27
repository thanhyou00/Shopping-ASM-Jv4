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
			TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
			this.em.getTransaction().commit();
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}
	}
}
