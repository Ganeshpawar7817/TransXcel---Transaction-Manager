package bank_app.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bank_app.dto.Transaction;
import bank_app.dto.User;

@Component
public class UserDao {

	@Autowired
	EntityManager entityManager;

	public int saveUser(User user) {

		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();

		int id = findUser(user);
		return id;
	}

	public int findUser(User user) {

		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();

		Query query = entityManager.createQuery("SELECT id FROM User WHERE email=?1 AND pin=?2");
		query.setParameter(1, user.getEmail());
		query.setParameter(2, user.getPin());

		int id = (Integer) query.getSingleResult();

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

		User user = getUser(email);
		if (user == null)
			return false;

		else if (!user.getPin().equals(pin))
			return false;

		return true;
	}

	public double getBalance(String email, String pin) {

		double balance = 0;

		User user = getUser(email, pin);
		balance = user.getBalance();
		
		return balance;
	}

	public User getUser(int id) {

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
		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.merge(user);
		entityTransaction.commit();
	}

	public List<User> viewAll() {

		EntityTransaction entityTransaction = entityManager.getTransaction();

		Query query = entityManager.createQuery("FROM User");

		entityTransaction.begin();

		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();

		entityTransaction.commit();

		return users;
	}

	public List<Transaction> getTransactionHistory(String email) {

		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		Query query = entityManager.createQuery("SELECT transactionHistory FROM User WHERE email=?1");
		query.setParameter(1, email);

		@SuppressWarnings("unchecked")
		List<Transaction> transactions = (List<Transaction>) query.getResultList();

		entityTransaction.commit();

		return transactions;
	}

}
