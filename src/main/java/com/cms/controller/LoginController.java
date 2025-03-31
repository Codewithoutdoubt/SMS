package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.services.StudentService;
import com.cms.services.UserService;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @Autowired
    StudentService studentService;

    @RequestMapping("/")
    public String home() {
        return "login-check";
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam String username, @RequestParam String password, Model model) {
        String access = userService.login(username, password);

        if (!access.equals("Invalid credentials")) {
            if (access.equals("scholarship-home")) {
                return scholarship(); // Call scholarship method
            }
            return new ModelAndView(access); // Redirect to other pages
        } else {
            model.addAttribute("error", "Invalid username or password.");
            return new ModelAndView("login-check"); // Redirect to login page
        }
    }

    public ModelAndView scholarship() {
    	return new ModelAndView("redirect:/scholarship");
    }
}
