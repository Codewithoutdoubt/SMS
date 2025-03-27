package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.cms.services.UserService;
import com.cms.services.StudentService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userService; // Add UserService dependency

    @Autowired
    StudentService studentService;
    
    @GetMapping("/admin")
    public String adminPage(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin";
    }

    @RequestMapping("/")
    public String home() {
        return "login-check";
    }

    @GetMapping("/welcome")
    public ModelAndView StudentHome() {
        ModelAndView mav = new ModelAndView("Student");
        mav.addObject("students", studentService.getAllStudents());
        return mav;
    }
}
