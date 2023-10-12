package bank_app.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.web.bind.annotation.ModelAttribute;

import bank_app.dto.About;
import bank_app.dto.BankService;

public class AboutDao {
	
	public EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("Ganesh_Pawar").createEntityManager();
	}
	public About getAbout() {
		EntityManager entityManager=getEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		Query query=entityManager.createQuery("FROM About");
		List<About> abouts=query.getResultList();
		About about=abouts.get(0);
		entityTransaction.commit();
		return about;
	}
	public About updateAbout(About about) {
		EntityManager entityManager=getEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(about);
		entityTransaction.commit();
		return about;
	}
	
	public void createAboutPage(About about,BankService bankService) {
		System.out.println("at Dao");
		EntityManager entityManager=getEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(bankService);
		System.out.println("persisted bankService");
		Query query=entityManager.createQuery("FROM BankService");
		List<BankService> bankServices=query.getResultList();
		System.out.println(bankService);
		System.out.println("after 1 persisted bankService");
		about.setServices(bankServices);
		System.out.println("after 2 persisted bankService");
		entityManager.persist(about);
		entityTransaction.commit();
		
	}
}
