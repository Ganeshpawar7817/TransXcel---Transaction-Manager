package bank_app.dto;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;

import org.springframework.stereotype.Component;


@Entity
@Component
public class About {
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	int id;
	@Lob
	String info;
	@ManyToMany(cascade = CascadeType.ALL)
	List<BankService> services;
	@Lob
	String marquee;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public List<BankService> getServices() {
		return services;
	}
	public void setServices(List<BankService> services) {
		this.services = services;
	}
	public String getMarquee() {
		return marquee;
	}
	public void setMarquee(String marquee) {
		this.marquee = marquee;
	}
	@Override
	public String toString() {
		return "About [id=" + id + ", info=" + info + ", services=" +services + ", marquee=" + marquee + "]";
	}
	
	
	

}
