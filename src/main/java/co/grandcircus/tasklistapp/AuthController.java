package co.grandcircus.tasklistapp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.grandcircus.tasklistapp.dao.UserDao;
import co.grandcircus.tasklistapp.entity.User;

@Controller
public class AuthController {

	@Autowired
	UserDao userDao;
	
//	// Index
//	@RequestMapping("/")
//	public ModelAndView showHome() {
//		return new ModelAndView("redirect:/login");
//	}

	// Registration
	@RequestMapping("/register")
	public ModelAndView showRegisterForm() {
		return new ModelAndView("register");
	}
	
	@PostMapping("/register")
	public ModelAndView submitRegisterForm(User user,
			@RequestParam("confirmPassword") String confirmPassword,
			HttpSession session,
			RedirectAttributes redir) {
		if (user.getPassword().equals(confirmPassword)) {
			// registration success
			userDao.save(user);
			session.setAttribute("user", user);
			redir.addFlashAttribute("message", "Registration Successful!");
			return new ModelAndView("redirect:/tasks");
		} else {
			redir.addFlashAttribute("message", "Sorry, passwords did not match!");
			return new ModelAndView("redirect:/register");
		}		
	}

	@RequestMapping("/login")
	public ModelAndView showLoginForm() {
		return new ModelAndView("login");
	}

	@PostMapping("/login")
	public ModelAndView submitLoginForm(@RequestParam("emailAddress") String emailAddress,
			@RequestParam("password") String password,
			HttpSession session, RedirectAttributes redir) {
		User user = userDao.findByEmailAddress(emailAddress);
		if (user == null || !password.equals(user.getPassword())) {
			// If the user or password don't match, display an error message.
			ModelAndView mav = new ModelAndView("login");
			mav.addObject("message", "Incorrect username or password.");
			return mav;
		}

		// On successful login, add the user to the session.
		session.setAttribute("user", user);

		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged in.");
		return new ModelAndView("redirect:/tasks");
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		// invalidate clears the current user session and starts a new one.
		session.invalidate();
		
		// A flash message will only show on the very next page. Then it will go away.
		// It is useful with redirects since you can't add attributes to the mav.
		redir.addFlashAttribute("message", "Logged out.");
		return new ModelAndView("redirect:/");
	}

}
