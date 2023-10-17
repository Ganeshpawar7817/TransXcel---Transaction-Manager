package bank_app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bank_app.dao.AboutDao;
import bank_app.dto.About;
import bank_app.dto.BankService;

@Component
public class AboutService {

	@Autowired
	AboutDao aboutDao;

	public ModelAndView showAboutPage() {
		ModelAndView modelAndView = new ModelAndView();

		About about = aboutDao.getAbout();

		modelAndView.addObject("about", about);
		modelAndView.setViewName("About");

		return modelAndView;
	}

	public ModelAndView updateAboutPage(About about) {
		ModelAndView modelAndView = new ModelAndView();

		About dbAbout = aboutDao.getAbout();
		about.setId(dbAbout.getId());
		about.setServices(dbAbout.getServices());

		aboutDao.updateAbout(about);

		modelAndView.addObject("code", 1111);
		modelAndView.setViewName("redirect:adminhome");

		return modelAndView;
	}

	public void createAboutPage(@ModelAttribute About about, BankService service) {

		aboutDao.createAboutPage(about, service);

	}

	public ModelAndView getAbout() {
		ModelAndView modelAndView = new ModelAndView();

		About about = aboutDao.getAbout();

		modelAndView.setViewName("About");
		modelAndView.addObject("about", about);

		return modelAndView;
	}

	public ModelAndView updateAboutForm() {
		ModelAndView modelAndView = new ModelAndView();

		About about = aboutDao.getAbout();

		modelAndView.setViewName("UpdateAboutForm");
		modelAndView.addObject("about", about);

		return modelAndView;

	}

	public RedirectAttributes addService(String service, RedirectAttributes attributes) {
		BankService service2 = new BankService();
		service2.setService(service);

		About about = aboutDao.getAbout();
		about.getServices().add(service2);
		aboutDao.updateAbout(about);

		attributes.addAttribute("code", 3333);

		return attributes;
	}

	public ModelAndView updateServiceForm() {

		List<BankService> services = aboutDao.getServices();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("services", services);
		modelAndView.setViewName("UpdateServices");

		return modelAndView;
	}

	public RedirectAttributes updateService(int id, String service, RedirectAttributes attributes) {
		BankService bankService = aboutDao.getBankService(id);
		bankService.setService(service);

		aboutDao.updateBankService(bankService);

		attributes.addAttribute("code", 2222);

		return attributes;
	}

	public RedirectAttributes deleteBankService(int id, RedirectAttributes attributes) {
		aboutDao.deleteBankService(id);

		attributes.addAttribute("code", 4444);

		return attributes;
	}
}
