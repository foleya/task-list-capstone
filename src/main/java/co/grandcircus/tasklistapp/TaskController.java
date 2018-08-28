package co.grandcircus.tasklistapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import co.grandcircus.tasklistapp.dao.TaskDao;
import co.grandcircus.tasklistapp.entity.Task;
import co.grandcircus.tasklistapp.entity.User;

@Controller
public class TaskController {

	@Autowired
	private TaskDao taskDao;
	
	//TODO: nice rerouting!
//	@RequestMapping("/secrets")
//	public ModelAndView index(@SessionAttribute(name="user", required=false) User user, RedirectAttributes redir) {
//		// For this URL, make sure there is a user on the session.
//		if (user == null) {
//			// if not, send them back to the login page with a message.
//			redir.addFlashAttribute("message", "Wait! Please log in.");
//			return new ModelAndView("redirect:/login");
//		}
//		
//		// if the user is logged in, proceed as normal.
//		return new ModelAndView("secrets");
//	}

	@RequestMapping("/tasks")
	public ModelAndView listTasks(@SessionAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("task-list");
		mav.addObject("tasks", taskDao.findAll());
		return mav;
	}

	@RequestMapping("/tasks/{id}")
	public ModelAndView showTask(@PathVariable("id") Task task, @SessionAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("task-show");
		mav.addObject("task", task);
		// mav.addObject("employers", employerDao.findAllByOrderByName());
		return mav;
	}

	@RequestMapping("/tasks/{id}/edit")
	public ModelAndView editTask(@PathVariable("id") Task task, @SessionAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("task-edit");
		mav.addObject("task", task);
		return mav;
	}

	@PostMapping("/tasks/{id}/edit")
	public ModelAndView submitEditTask(@ModelAttribute("id") Task task, @SessionAttribute("user") User user) {
		task.setUser(user);
		taskDao.save(task);
		ModelAndView mav = new ModelAndView("redirect:/tasks/" + task.getId());
		return mav;
	}

	@RequestMapping("/tasks/add")
	public ModelAndView addTask(@SessionAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("task-add");
		return mav;
	}

	@PostMapping("/tasks/add")
	public ModelAndView submitAddTask(Task task, @SessionAttribute("user") User user) {
		task.setUser(user);
		taskDao.save(task);
		ModelAndView mav = new ModelAndView("redirect:/tasks");
		return mav;
	}

	@RequestMapping("/tasks/{id}/delete")
	public ModelAndView deleteTask(@PathVariable("id") Long id) {
		taskDao.deleteById(id);
		ModelAndView mav = new ModelAndView("redirect:/tasks");
		return mav;
	}

	// @RequestMapping("/tasks/{id}/add-application")
	// public ModelAndView addApplication(@PathVariable("id") Task task,
	// @RequestParam("employerId") Employer employer) {
	// // The student - employee relationship is owned from the student end, so
	// // we need to update and save the student.
	// student.getApplications().add(employer);
	// taskDao.save(student);
	//
	// // Note that the reverse does not work. From Hibernate's perspective, this
	// relationship
	// // is owned by the student, not the employer.
	// // employer.getApplicants().add(student);
	// // employerDao.save(employer);
	//
	// ModelAndView mav = new ModelAndView("redirect:/students/" + student.getId());
	// return mav;
	// }

	// @RequestMapping("/students/{id}/remove-application")
	// public ModelAndView removeApplication(@PathVariable("id") Student student,
	// @RequestParam("employerId") Employer employer) {
	// // The student - employee relationship is owned from the student end, so
	// // we need to update and save the student.
	// student.getApplications().remove(employer);
	// taskDao.save(student);
	// ModelAndView mav = new ModelAndView("redirect:/students/" + student.getId());
	// return mav;
	// }

}
