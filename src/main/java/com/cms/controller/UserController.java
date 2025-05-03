package com.cms.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.cms.services.UserService;
import com.cms.exception.DuplicateEmailException;

import java.util.List;

import com.cms.entity.AppUser;
import com.cms.entity.Department;
import com.cms.services.StudentService;

@Controller
public class UserController {
    
    @Autowired
    private UserService userService; // Add UserService dependency

    @Autowired
    StudentService studentService;

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Admin Panel");
        return obj;
    }

    @GetMapping("/users")
    public String getUsers(Model model) {
        List<AppUser> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "Admin/user-list";
    }

    @RequestMapping("/addUser")
    public String addUser() {
        return "Admin/add-user";
    }

    @PostMapping("/saveuser")
    public String save(@RequestParam String username, @RequestParam String email, @RequestParam String password, @RequestParam String access, Model model) {
        // Hash password before saving (for security)
        String hashedPassword = password; 

        AppUser user = new AppUser();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setAccess(access);

        try {
            // Save user
            userService.save(user);
        } catch (DuplicateEmailException e) {
            model.addAttribute("error", e.getMessage());
            return "Admin/add-user";
        }
        return "redirect:/users";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

    // New endpoints for forget password feature

    @GetMapping("/forgot-password")
    public String showForgotPasswordForm() {
        return "forgot-password";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam("email") String email, Model model) {
        userService.initiatePasswordReset(email);
        model.addAttribute("message", "If an account with that email exists, a password reset link has been sent.");
        return "forgot-password";
    }

    @GetMapping("/reset-password")
    public String showResetPasswordForm(@RequestParam("token") String token, Model model) {
        boolean valid = userService.validatePasswordResetToken(token);
        if (!valid) {
            model.addAttribute("message", "Invalid or expired password reset token.");
            return "reset-password-error";
        }
        model.addAttribute("token", token);
        return "reset-password";
    }

    @PostMapping("/reset-password")
    public String processResetPassword(@RequestParam("token") String token, @RequestParam("password") String password, Model model) {
        boolean valid = userService.validatePasswordResetToken(token);
        if (!valid) {
            model.addAttribute("message", "Invalid or expired password reset token.");
            return "reset-password";
        }
        userService.resetPassword(token, password);
        model.addAttribute("message", "Password has been reset successfully.");
        return "redirect:/loginpage";
    }
}
