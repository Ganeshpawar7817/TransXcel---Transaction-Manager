package bank_app.service;

import java.time.LocalDateTime;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bank_app.dao.UserDao;
import bank_app.dto.Transaction;
import bank_app.dto.User;

@Service
public class UserService {

	UserDao userDao = new UserDao();

	public ModelAndView saveUser(User user, String pin2) {

		ModelAndView modelAndView = new ModelAndView();

		if (!user.getPin().equals(pin2)) {

			modelAndView.addObject("id", 0);
			modelAndView.addObject("message", "Passcode not matched");
			modelAndView.addObject("code", 0);
			modelAndView.setViewName("UserSignUp");
		}

		else if (userDao.isEmailPresent(user.getEmail())) {

			modelAndView.addObject("id", 0);
			modelAndView.addObject("message", "Account Already Exists");
			modelAndView.addObject("code", 10);
			modelAndView.setViewName("UserSignUp");

		} else {
			user.setBalance(10000);
			int id = userDao.saveUser(user);

			modelAndView.addObject("id", id);
			modelAndView.addObject("message", "SignUp Sucessful !!");
			modelAndView.addObject("code", 111);
			modelAndView.setViewName("UserLogin");
		}

		return modelAndView;
	}

	public ModelAndView logInCheck(String email, String password, HttpServletRequest request) {

		boolean result = userDao.logInCheck(email, password);

		ModelAndView modelAndView = new ModelAndView();

		if (result) {

			modelAndView.addObject("code", 111);
			modelAndView.addObject("message", "Ok");
			modelAndView.setViewName("UserHome");

			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("pin", password);

		} else {
			modelAndView.setViewName("UserLogin");
			modelAndView.addObject("code", 0);
			modelAndView.addObject("message", "Invalid Credentials");

		}
		return modelAndView;
	}

	public Model viewAccount(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String pin = (String) session.getAttribute("pin");

		User user = userDao.getUser(email, pin);
		user.setPin("****");
		model.addAttribute("user", user);

		return model;
	}

	public ModelAndView showBalance(HttpServletRequest request, String pin) {

		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String dbPin = (String) session.getAttribute("pin");
		
		if (!pin.equals(dbPin)) {
			modelAndView.addObject("code", 0);
			modelAndView.setViewName("CheckBalancePinCheck");
		} else {
			Double balance = userDao.getBalance(email, pin);

			System.out.println("balance is >>" + balance);
			modelAndView.addObject("code", 100);
			modelAndView.addObject("balance", balance);
			modelAndView.setViewName("UserHome");

		}

		return modelAndView;

	}

	public ModelAndView viewUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		User user = userDao.getUser(email);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.addObject("from", "user");
		modelAndView.setViewName("ShowUser");

		return modelAndView;
	}

	public ModelAndView makeTransaction(Transaction transaction, String pin, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		HttpSession session = request.getSession();
		String dbPin = (String) session.getAttribute("pin");
		String dbEmail = (String) session.getAttribute("email");

		if (!dbPin.equals(pin)) {
			modelAndView.addObject("code", 0);
			modelAndView.addObject("message", "Incorrect Pin ??");

			modelAndView.setViewName("TransferMoney");
			return modelAndView;
		}

		User receiver = userDao.getUser(transaction.getReceiver().getEmail());
		User user = userDao.getUser(dbEmail);

		if (receiver == null) {
			modelAndView.addObject("code", 10);
			modelAndView.addObject("message", "Recievers Account not Available ??");
			modelAndView.setViewName("TransferMoney");
			System.out.println(receiver);
			return modelAndView;
		} else if (user.getBalance() < transaction.getAmount()) {
			modelAndView.addObject("code", 20);
			modelAndView.addObject("message", "Insufficient Balance");
			modelAndView.setViewName("TransferMoney");

			return modelAndView;
		}

		double amount = transaction.getAmount();
		user.setBalance(user.getBalance() - amount);
		receiver.setBalance(receiver.getBalance() + amount);

		transaction.setDate(LocalDateTime.now());

		List<Transaction> receiverTransactions = receiver.getTransactionHistory();
		transaction.setType("credited");
		transaction.setReceiver(user);
		receiverTransactions.add(transaction);
		receiver.setTransactionHistory(receiverTransactions);
		userDao.updateUser(receiver);

		List<Transaction> userTransactions = user.getTransactionHistory();
		transaction.setType("debited");
		transaction.setReceiver(receiver);
		userTransactions.add(transaction);
		user.setTransactionHistory(userTransactions);
		userDao.updateUser(user);

		modelAndView.addObject("code", 222);
		modelAndView.addObject("message", "Transaction Successful");
		modelAndView.setViewName("UserHome");

		return modelAndView;
	}

	public ModelAndView updateAccoPage(HttpServletRequest request,String pin) {

		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String dbPin = (String) session.getAttribute("pin");

		ModelAndView modelAndView = new ModelAndView();
		if(!dbPin.equals(pin)) {
			modelAndView.addObject("code", 0);
			modelAndView.setViewName("UpdateAccountCheckPin");
		}
		
		else {
			User user = userDao.getUser(email, pin);
			modelAndView.addObject("user", user);
			modelAndView.setViewName("UpdateUserAccount");
		}

		return modelAndView;
	}

	public ModelAndView updateAccount(HttpServletRequest request, User user) {
		ModelAndView modelAndView = new ModelAndView();

		User dbUser = userDao.getUser(user.getId());
		user.setBalance(dbUser.getBalance());
        user.setTransactionHistory(dbUser.getTransactionHistory());
		
		HttpSession session = request.getSession();
		session.setAttribute("email", user.getEmail());
		session.setAttribute("pin", user.getPin());

		modelAndView.addObject("code", 333);
		modelAndView.addObject("message", "Account Updated Successfully !!");
		modelAndView.setViewName("UserHome");

		userDao.updateUser(user);

		return modelAndView;
	}

	public ModelAndView showUser(String cred, String data) {
		ModelAndView modelAndView = new ModelAndView();
		User user = null;
		if (cred.equals("id")) {

			int id = Integer.parseInt(data);
			user = userDao.getUser(id);
			if (user == null) {
				modelAndView.addObject("code", 0);
				modelAndView.setViewName("ViewUserById");
			} else {
				modelAndView.addObject("user", user);
				modelAndView.setViewName("ShowUser");
			}

		} else if (cred.equals("email")) {
			String email = data;
			user = userDao.getUser(email);
			if (user == null) {
				modelAndView.addObject("code", 0);
				modelAndView.setViewName("ViewUserByEmail");
			} else {
				modelAndView.addObject("user", user);
				modelAndView.setViewName("ShowUser");
			}
		}

		modelAndView.addObject("from", "admin");
		return modelAndView;
	}

	public ModelAndView showAllUser() {
		List<User> users = userDao.viewAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("users", users);
		modelAndView.setViewName("ShowAllUsers");
		return modelAndView;
	}

	public ModelAndView updateUserRequest(int id) {
		User user = userDao.getUser(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("AdminUpdateUser");

		return modelAndView;
	}

	public RedirectAttributes adminUpdateUserData(User user, RedirectAttributes attributes) {
		User dbUser = userDao.getUser(user.getId());

		user.setBalance(dbUser.getBalance());
		user.setPin(dbUser.getPin());
		user.setTransactionHistory(dbUser.getTransactionHistory());
		userDao.updateUser(user);

		attributes.addAttribute("code", 555);

		return attributes;
	}

	public ModelAndView viewHistory(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		//For Session Tracking
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
		
		//Getting transaction history from Dao Package >>
		List<Transaction> transactions=userDao.getTransactionHistory(email);
		
		System.out.println("transaction before update >>");
		System.out.println(transactions);
		
		// Removing unwanted Data of Receiver from transactions >>
		for(Transaction transaction:transactions) {
		     User receiver=transaction.getReceiver();
		    if(receiver!=null) {
		    	 receiver.setAddress(null);
			     receiver.setBalance(0.0);
			     receiver.setEmail(null);
			     receiver.setPin(null);
			     receiver.setTransactionHistory(null);
			     receiver.setAge(0);
		    }
		     
		}
		System.out.println("transaction after update >>");
		System.out.println(transactions);
		
		//setting up response >>
		modelAndView.addObject("transactions",transactions);
		modelAndView.setViewName("TransactionHistory");
		
		return modelAndView;
		
	}
}
