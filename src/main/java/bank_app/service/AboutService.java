package bank_app.service;

import org.apache.tomcat.util.log.UserDataHelper.Mode;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bank_app.dao.AboutDao;
import bank_app.dto.About;
import bank_app.dto.BankService;


public class AboutService {

	AboutDao aboutDao=new AboutDao();
	
	public ModelAndView showAboutPage() {
		ModelAndView modelAndView = new ModelAndView();
        About about= aboutDao.getAbout();
        modelAndView.addObject("about",about);
        modelAndView.setViewName("About");
		return modelAndView;
	}

	public ModelAndView updateAboutPage(About about) {
		ModelAndView modelAndView = new ModelAndView();
		aboutDao.updateAbout(about);
		modelAndView.addObject("code",111);
		modelAndView.setViewName("");
		return modelAndView;
	}
    public void createAboutPage(@ModelAttribute About about,BankService service) {
//    	about.getServices().add(service);
    	System.out.println("at service");
    	BankService bankService=new BankService();
//    	bankService.setService(service);
    	aboutDao.createAboutPage(about,service);
	
	}

}
