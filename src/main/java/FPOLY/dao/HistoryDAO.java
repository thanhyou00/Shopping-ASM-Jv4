package FPOLY.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import FPOLY.utils.JpaUtils;

public class HistoryDAO {

	private EntityManager em;
	public HistoryDAO() {
		this.em = JpaUtils.getEntityManager();
	}
	
	public List<Object[]> history(int id) throws Exception {
		try {
			String jpql = "SELECT od.quantity,pd.name,pd.image,pd.price,o.orderStatus FROM OrderDetail od"
					+ " JOIN od.product pd"
					+ " JOIN od.order o"
					+ " WHERE o.user.id = "+id;
			TypedQuery<Object[]> query = this.em.createQuery(jpql,Object[].class);
			List<Object[]> result = query.getResultList();
			return result;	
		} catch (Exception e) {
			e.printStackTrace();
			this.em.getTransaction().rollback();
			throw e;
		}	
	}	
}
