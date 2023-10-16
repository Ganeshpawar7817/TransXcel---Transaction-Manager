package bank_app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bank_app.dto.About;
import bank_app.dto.BankService;
import bank_app.service.AboutService;

@Controller
public class AboutController {
	
	AboutService aboutService=new AboutService();
	@RequestMapping("/about")
	public ModelAndView aboutPage() {
		return aboutService.getAbout();
	}
	@RequestMapping("shwoaboutpg")
	public ModelAndView showAboutPage() {
		return aboutService.showAboutPage();
	}
	@RequestMapping("showcreateaboutpage")
	public String showPage() {
		return "CreateAboutPage";
	}
	
	@RequestMapping("updateaboutform")
	public ModelAndView updateAboutForm() {
		return aboutService.updateAboutForm();
	}
	@RequestMapping(path="updateabout",method = RequestMethod.POST)
	public ModelAndView updateAboutPage(@ModelAttribute About about) {
		System.out.println("update method");
		return aboutService.updateAboutPage(about);
	}
	@RequestMapping("addserviceform")
	public String addServiceForm() {
		return "AddService";
	}
	@RequestMapping(path = "addservice",method = RequestMethod.POST)
	public String AddService(@RequestParam String service,RedirectAttributes attributes) {
		attributes= aboutService.addService(service,attributes);
		return "redirect:adminhome";
	}
	@RequestMapping("updatesrvicesform")
	public ModelAndView updateServiceForm() {
		return aboutService.updateServiceForm();
	}
	@RequestMapping(path =  "updateservice",method = RequestMethod.POST)
	public String updateService(@RequestParam int id,@RequestParam String service,RedirectAttributes attributes) {
		attributes= aboutService.updateService(id, service,attributes);
		return "redirect:adminhome";
	}
	@RequestMapping("deleteservice")
	public String deleteBankService(@RequestParam int id,RedirectAttributes attributes) {
		attributes=aboutService.deleteBankService(id, attributes);
		return "redirect:adminhome";
	}

	

}
