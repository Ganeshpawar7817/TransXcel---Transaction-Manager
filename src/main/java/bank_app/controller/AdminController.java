package bank_app.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bank_app.dto.Admin;
import bank_app.service.AdminService;

@Controller
public class AdminController {
	AdminService adminService = new AdminService();

	@RequestMapping("/adminsignup")
	public String adminSignUp() {

		return "AdminSignUp";
	}

	@RequestMapping(path = "/saveadmin", method = RequestMethod.POST)
	public ModelAndView saveAdmin(@ModelAttribute Admin admin, @RequestParam String passcode2) {

		return adminService.saveAdmin(admin, passcode2);
	}

	@RequestMapping("adminlogin")
	public String adminSignIn() {
		return "AdminLogin";
	}

	@RequestMapping(path = "signincheck", method = RequestMethod.POST)
	public ModelAndView adminSignInCheck(@RequestParam String email, @RequestParam String password) {

		return adminService.logInCheck(email, password);

	}

	@RequestMapping("/adminhome")
	public String adminHome() {
		System.out.println("adminhome");
		return "AdminHome";
	}

	@RequestMapping("/viewbyid")
	public String viewById() {
		return "ViewUserById";
	}

	@RequestMapping("/viewbyemail")
	public String viewByEmail() {
		return "ViewUserByEmail";
	}

	@RequestMapping("updateaccountpage")
	public String addAccountPage() {
		return "AdminUpdateUser";
	}

}
