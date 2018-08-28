package co.grandcircus.tasklistapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.tasklistapp.dao.TaskDao;
import co.grandcircus.tasklistapp.dao.UserDao;
import co.grandcircus.tasklistapp.entity.Task;
import co.grandcircus.tasklistapp.entity.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private TaskDao taskDao;

	@RequestMapping("/")
	public String home() {
		return "redirect:/users";
	}

	@RequestMapping("/users")
	public ModelAndView listUsers() {
		ModelAndView mav = new ModelAndView("user-list");
		mav.addObject("users", userDao.findAll());
		return mav;
	}
	
	@RequestMapping("/users/{id}")
	public ModelAndView showUser(@PathVariable("id") User user) {
		ModelAndView mav = new ModelAndView("users-show");
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("/users/{id}/edit")
	public ModelAndView editUser(@PathVariable("id") User user) {
		ModelAndView mav = new ModelAndView("user-edit");
		mav.addObject("user", user);
		return mav;
	}

	@PostMapping("/users/{id}/edit")
	public ModelAndView submitEditUser(@ModelAttribute("id") User user) {
		userDao.save(user);
		ModelAndView mav = new ModelAndView("redirect:/users/" + user.getId());
		return mav;
	}

	@RequestMapping("/users/add")
	public ModelAndView addUser() {
		ModelAndView mav = new ModelAndView("user-add");
		return mav;
	}

	@PostMapping("/users/add")
	public ModelAndView submitAddUser(User user) {
		userDao.save(user);
		ModelAndView mav = new ModelAndView("redirect:/users");
		return mav;
	}

	@RequestMapping("/users/{id}/delete")
	public ModelAndView deleteUser(@PathVariable("id") Long id) {
		userDao.deleteById(id);
		ModelAndView mav = new ModelAndView("redirect:/users");
		return mav;
	}

	@RequestMapping("/users/{id}/remove-task")
	public ModelAndView removeTask(
			@PathVariable("id") Long userId,
			@RequestParam("taskId") Task task) {
		// The student - user relationship is owned by the task, so
		// we need to update and save the task.
		task.setUser(null);
		taskDao.save(task);
		
		ModelAndView mav = new ModelAndView("redirect:/users/" + userId);	
		return mav;
	}

}

