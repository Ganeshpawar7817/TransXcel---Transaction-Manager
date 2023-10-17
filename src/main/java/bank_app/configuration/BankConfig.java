package bank_app.configuration;

import javax.persistence.EntityManager;

import javax.persistence.Persistence;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BankConfig {
	@Bean
	public EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("Ganesh_Pawar").createEntityManager();
	}

}
