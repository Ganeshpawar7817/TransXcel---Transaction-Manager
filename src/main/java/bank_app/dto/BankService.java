package bank_app.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BankService {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String service;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	@Override
	public String toString() {
		return "Service [id=" + id + ", service=" + service + "]";
	}
	
	

}
