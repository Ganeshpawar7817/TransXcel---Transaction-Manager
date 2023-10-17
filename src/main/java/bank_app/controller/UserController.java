package bank_app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bank_app.dto.Transaction;
import bank_app.dto.User;
import bank_app.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;

	// User Pages Requests >>

	@RequestMapping("/usersignup")
	public String userSignUp() {
		return "UserSignUp";
	}

	@RequestMapping(path = "/saveuser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user, @RequestParam String pin2) {

		return userService.saveUser(user, pin2);
	}

	@RequestMapping("/userlogin")
	public String userLogin() {
		return "UserLogin";
	}

	@RequestMapping(path = "userlogincheck", method = RequestMethod.POST)
	public ModelAndView userSignInCheck(@RequestParam String email, @RequestParam String pin, Model model,
			HttpServletRequest request) {

		return userService.logInCheck(email, pin, request);

	}

	@RequestMapping(path = "/userhome", method = RequestMethod.GET)
	public String userHome() {
		return "UserHome";
	}

	@RequestMapping("/checkbalancepage")
	public String checkBalancePage() {
		return "CheckBalance";
	}

	@RequestMapping("/transfermoney")
	public String transferMoney() {
		return "TransferMoney";
	}
	
	@RequestMapping(path = "/maketransaction", method = RequestMethod.POST)
	public ModelAndView makeTransaction(@ModelAttribute Transaction transaction, @RequestParam String pin,
			HttpServletRequest request) {
		return userService.makeTransaction(transaction, pin, request);
	}


	@RequestMapping("/viewaccount")
	public String viewAccount(Model model, HttpServletRequest request) {
		model = userService.viewAccount(model, request);
		return "redirect:ViewAccount";

	}

	@RequestMapping("/checkbalance")
	public String checkBalance() {
		return "CheckBalancePinCheck";
	}

	@RequestMapping("checkbalancepin")
	public ModelAndView checkBalancePinChck(HttpServletRequest request, @RequestParam String pin) {
		return userService.showBalance(request, pin);
	}

	@RequestMapping("viewuser")
	public ModelAndView viewUser(HttpServletRequest request) {

		return userService.viewUser(request);
	}

	
	@RequestMapping("checkpinpage")
	public String showUpdateAccountCheckPinPage() {
		return "UpdateAccountCheckPin";
	}

	@RequestMapping("/updateaccountcheckpin")
	public ModelAndView updateAccount(HttpServletRequest request, @RequestParam String pin) {
		return userService.updateAccoPage(request, pin);
	}

	@RequestMapping(path = "/updatemyaccount", method = RequestMethod.POST)
	public ModelAndView updateMyAccount(HttpServletRequest request, @ModelAttribute User user) {

		return userService.updateAccount(request, user);
	}

	@RequestMapping("/showuserpage")
	public String showUserPage(HttpServletRequest request) {

		return "ShowUser";

	}

	@RequestMapping("/showuser")
	public ModelAndView viewUserById(@RequestParam(required = false) String data, @RequestParam("cred") String cred) {

		System.out.println("cred =" + cred);
		return userService.showUser(cred, data);

	}

	@RequestMapping("/viewhistory")
	public ModelAndView viewHistory(HttpServletRequest request) {
		return userService.viewHistory(request);
	}

	// Admin Pages Requests >>

	@RequestMapping("viewuserbyid")
	public ModelAndView viewUserById(@RequestParam int id) {
		return userService.showUser("id", id + "");
	}

	@RequestMapping("viewuserbyemail")
	public ModelAndView viewUserById(@RequestParam String email) {
		return userService.showUser("email", email);
	}

	@RequestMapping("/adminshowuser")
	public String showUser() {
		System.out.println("inside admin show user ");

		return "AdminUpdateUser";
	}

	@RequestMapping("/showallusers")
	public ModelAndView viewAllUser() {
		return userService.showAllUser();
	}

	@RequestMapping("updateuserrequest")
	public ModelAndView updateUserRequest(@RequestParam int id) {

		return userService.updateUserRequest(id);

	}

	@RequestMapping("adminupdateuserdata")
	public String adminUpdateUserData(@ModelAttribute User user, RedirectAttributes attributes) {
		attributes = userService.adminUpdateUserData(user, attributes);
		return "redirect:showallusers";
	}

}
