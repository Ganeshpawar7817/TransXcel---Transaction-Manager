package bank_app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bank_app.dto.About;
import bank_app.dto.BankService;

@Component
public class AboutDao {
	@Autowired
	EntityManager entityManager;

	public About getAbout() {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		Query query = entityManager.createQuery("FROM About");
		System.out.println("dao before query exe.");
		@SuppressWarnings("unchecked")
		List<About> abouts = query.getResultList();
		System.out.println("dao after query exe.");
		About about = abouts.get(0);
		System.out.println("dao after query exe. get(0)");
		entityTransaction.commit();
		System.out.println("dao after commit");
		return about;
	}

	public About updateAbout(About about) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(about);
		entityTransaction.commit();
		return about;
	}

	public void createAboutPage(About about, BankService bankService) {

		EntityTransaction entityTransaction = entityManager.getTransaction();

		entityTransaction.begin();
		entityManager.persist(bankService);

		Query query = entityManager.createQuery("FROM BankService");
		@SuppressWarnings("unchecked")
		List<BankService> bankServices = query.getResultList();

		about.setServices(bankServices);
		entityManager.persist(about);

		entityTransaction.commit();

	}

	public List<BankService> getServices() {
		About about = getAbout();
		List<BankService> services = about.getServices();
		return services;
	}

	public BankService getBankService(int id) {

		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		BankService bankService = entityManager.find(BankService.class, id);
		entityTransaction.commit();
		return bankService;
	}

	public void updateBankService(BankService bankService) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(bankService);
		entityTransaction.commit();
	}

	public void deleteBankService(int id) {
		EntityTransaction entityTransaction = entityManager.getTransaction();
		entityTransaction.begin();
		BankService bankService = entityManager.find(BankService.class, id);
		entityManager.remove(bankService);
		entityTransaction.commit();
	}
}
