package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.cms.services.UserService;


@Controller
public class LoginController {
	@Autowired
	UserService userService;

	@RequestMapping("/")
    public String home() {
        return "login-check";
    }

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		String access = userService.login(username, password);

		if (!access.equals("Invalid credentials")) {
			
			return access; // Redirect to welcome.html or welcome.jsp
		} else {
			model.addAttribute("error", "Invalid username or password.");
			return "login-check"; // Redirect to login.html or login.jsp
		}
	}
}
