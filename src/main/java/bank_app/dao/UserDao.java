package bank_app.dao;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

import bank_app.dto.Transaction;
import bank_app.dto.User;

public class UserDao {

	EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("Ganesh_Pawar").createEntityManager();
	}

	public int saveUser(User user) {
		System.out.println("admin service before evrything");
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();

		System.out.println("admin service after commit");
		int id = findUser(user);
		return id;
	}

	public int findUser(User user) {

		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		Query query = entityManager.createQuery("SELECT id FROM User WHERE email=?1 AND pin=?2");
		query.setParameter(1, user.getEmail());
		query.setParameter(2, user.getPin());
		System.out.println("before getParameter");
		int id = (Integer) query.getSingleResult();
		System.out.println("after getParameter");
		entityTransaction.commit();
		return id;
	}

	public boolean isEmailPresent(String email) {

		if (getUser(email) != null)
			return true;
		else
			return false;
	}

	public boolean logInCheck(String email, String pin) {

		User user=getUser(email);
		if(user==null)
			return false;
		
		else if(!user.getPin().equals(pin))
			return false;
		
		return true;
	}

	public double getBalance(String email, String pin) {
		
		double balance = 0;

		User user=getUser(email, pin);
		balance=user.getBalance();
		System.out.println("check bal " + email + " " + pin);

		return balance;
	}

	public User getUser(int id) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		Query query = entityManager.createQuery("FROM User WHERE id=?1");
		query.setParameter(1, id);
		entityTransaction.begin();
		User user = null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException exception) {
			entityTransaction.commit();
			return null;
		}
		entityTransaction.commit();
		return user;
	}

	public User getUser(String email) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		Query query = entityManager.createQuery("FROM User WHERE email=?1");
		query.setParameter(1, email);
		entityTransaction.begin();
		User user = null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException exception) {
			entityTransaction.commit();
			return null;
		}
		entityTransaction.commit();
		return user;
	}

	public User getUser(String email, String pin) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		Query query = entityManager.createQuery("FROM User WHERE email=?1");
		query.setParameter(1, email);
		entityTransaction.begin();
		User user = null;
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException exception) {
			entityTransaction.commit();
			return null;
		}
		entityTransaction.commit();
		return user;
	}

	public void updateUser(User user) {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();

		entityManager.merge(user);

		entityTransaction.commit();
	}

	public List<User> viewAll() {
		EntityManager entityManager = getEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();

		Query query = entityManager.createQuery("FROM User");

		entityTransaction.begin();
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		entityTransaction.commit();

		return users;
	}
	
	public List<Transaction> getTransactionHistory(String email){
		EntityManager entityManager=getEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		
		System.out.println("email= "+email);
		entityTransaction.begin();
		Query query=entityManager.createQuery("SELECT transactionHistory FROM User WHERE email=?1");
		query.setParameter(1, email);
		
		@SuppressWarnings("unchecked")
		List<Transaction> transactions=(List<Transaction>)query.getResultList();
		
		entityTransaction.commit();
		
		return transactions;
	}

}
