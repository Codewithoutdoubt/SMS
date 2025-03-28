package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.services.StudentService;
import com.cms.services.UserService;

@Controller
public class AdminController {
    
    @Autowired
    private UserService userService; // Add UserService dependency

    @Autowired
    StudentService studentService;
    
    @GetMapping("/admin")
    public ModelAndView adminPage() {
        ModelAndView mav = new ModelAndView("admin");
        mav.addObject("users", userService.getAllUsers());
        return mav;
    }

}
