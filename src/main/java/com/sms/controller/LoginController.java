package com.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sms.entity.Department;
import com.sms.services.StudentService;
import com.sms.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @Autowired
    StudentService studentService;

    @Autowired
    HttpSession session;

    @RequestMapping("/")
    public String home() {
        return "index";
    }
    @GetMapping("/loginpage")
    public String loginPage() {
        return "login-check";
    }
    @PostMapping("/login")
    public ModelAndView login(@RequestParam String username, @RequestParam String password, Model model) {
        String access = userService.login(username, password);

        if (!access.equals("Invalid credentials")) {
            Department department = new Department();
            department.setUsername(username);
            department.setAccess(access);
            session.setAttribute("department", department);

            if (access.equals("scholarship-home")) {
                return scholarship(); // Call scholarship method
            }
            return new ModelAndView("redirect:/"+access); // Redirect to other pages
        } else {
            model.addAttribute("error", "Invalid username or password.");
            return new ModelAndView("login-check"); // Redirect to login page
        }
    }

    public ModelAndView scholarship() {
        return new ModelAndView("redirect:/scholarship");
    }

    @GetMapping("/logout")
    public String logout() {
        session.invalidate();
        return "redirect:/loginpage";
    }
}
