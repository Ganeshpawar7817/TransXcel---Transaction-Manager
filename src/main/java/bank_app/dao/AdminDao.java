package bank_app.dao;

import javax.persistence.EntityManager;

import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;

import javax.persistence.Persistence;
import javax.persistence.Query;

import bank_app.dto.Admin;

public class AdminDao {

	EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("Ganesh_Pawar").createEntityManager();
	}

	public int saveAdmin(Admin admin) {
		System.out.println("admin service before evrything");
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.persist(admin);
		entityTransaction.commit();

		System.out.println("admin service after commit");
		int id = findAdmin(admin);
		return id;
	}

	public int findAdmin(Admin admin) {

		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		Query query = entityManager.createQuery("SELECT id FROM Admin WHERE email=?1 AND passcode=?2");
		query.setParameter(1, admin.getEmail());
		query.setParameter(2, admin.getPasscode());
		System.out.println("before getParameter");
		int id = (Integer) query.getSingleResult();
		System.out.println("after getParameter");
		entityTransaction.commit();
		return id;
	}

	public boolean isEmailPresent(String email) {

		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		Query query = entityManager.createQuery("SELECT id FROM Admin WHERE email=?1");
		query.setParameter(1, email);

		try {
			query.getSingleResult();
		} catch (NoResultException exception) {
			entityTransaction.commit();
			return false;
		}

		entityTransaction.commit();
		return true;
	}

	public boolean logInCheck(String email, String password) {

		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Query query = entityManager.createQuery("SELECT id FROM Admin WHERE email=?1 AND passcode=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);

		entityTransaction.begin();

		try {
			query.getSingleResult();
		} catch (NoResultException noResultException) {
			entityTransaction.commit();
			return false;
		}

		entityTransaction.commit();

		return true;
	}

	

}
