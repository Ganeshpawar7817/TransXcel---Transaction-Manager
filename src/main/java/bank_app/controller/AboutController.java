package bank_app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bank_app.dto.About;
import bank_app.dto.BankService;
import bank_app.service.AboutService;

@Controller
public class AboutController {
	
	AboutService aboutService=new AboutService();
	
	@RequestMapping("shwoaboutpg")
	public ModelAndView showAboutPage() {
		return aboutService.showAboutPage();
	}
	@RequestMapping("updateabout")
	public ModelAndView updateAboutPage(About about) {
		return aboutService.updateAboutPage(about);
	}
	@RequestMapping("showcreateaboutpage")
	public String showPage() {
		return "CreateAboutPage";
	}
	
	@RequestMapping("createaboutpage")
	public void createAboutPage(@ModelAttribute About about,@ModelAttribute BankService service) {
		System.out.println("at controller");
		System.out.println("bankservice = " +service);
		aboutService.createAboutPage(about,service);
		System.out.println("Successfully created");
	}

}
