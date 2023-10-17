package bank_app.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import bank_app.dao.AdminDao;
import bank_app.dto.Admin;

@Component
public class AdminService {

	@Autowired
	AdminDao adminDao;

	public ModelAndView saveAdmin(Admin admin, String passcode2) {

		ModelAndView modelAndView = new ModelAndView();

		if (!admin.getPasscode().equals(passcode2)) {

			modelAndView.addObject("id", 0);
			modelAndView.addObject("message", "Passcode not matched");
			modelAndView.addObject("code", 0);
			modelAndView.setViewName("AdminSignUp");
		}

		else if (adminDao.isEmailPresent(admin.getEmail())) {

			modelAndView.addObject("id", 0);
			modelAndView.addObject("message", "Account Already Exists");
			modelAndView.addObject("code", 10);
			modelAndView.setViewName("AdminSignUp");

		} else {
			int id = adminDao.saveAdmin(admin);

			modelAndView.addObject("id", id);
			modelAndView.addObject("message", "SignUp Sucessful !!");
			modelAndView.addObject("code", 111);
			modelAndView.setViewName("AdminLogin");
		}

		return modelAndView;
	}

	public ModelAndView logInCheck(String email, String password) {

		boolean result = adminDao.logInCheck(email, password);

		ModelAndView modelAndView = new ModelAndView();

		if (result) {
			modelAndView.setViewName("AdminHome");
			modelAndView.addObject("code", 111);
			modelAndView.addObject("message", "Ok");
		} else {
			modelAndView.setViewName("AdminLogin");
			modelAndView.addObject("code", 0);
			modelAndView.addObject("message", "Invalid Credentials");
		}
		return modelAndView;
	}

}
