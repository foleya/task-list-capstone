package co.grandcircus.tasklistapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String showHome() {
		return "redirect:/login";
	}
}
