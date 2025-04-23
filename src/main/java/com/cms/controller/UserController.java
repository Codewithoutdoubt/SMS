package com.cms.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.cms.services.UserService;

import java.util.List;

import com.cms.entity.AppUser;
import com.cms.services.StudentService;

@Controller
public class UserController {
    
    @Autowired
    private UserService userService; // Add UserService dependency

    @Autowired
    StudentService studentService;

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
	public String save(@RequestParam String username, @RequestParam String password, @RequestParam String access,Model model) {
		// Hash password before saving (for security)
		String hashedPassword = password; 

		AppUser user = new AppUser();
		user.setUsername(username);
		user.setPassword(hashedPassword);
		user.setAccess(access);

		// Save user
		userService.save(user);
		return "redirect:/users";
	}

	@PostMapping("/delete/{id}")
	public String delete(@PathVariable Integer id) {
		userService.deleteUser(id);
		return "redirect:/users";

	}}

