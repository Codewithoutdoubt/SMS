package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StudentController {

	@Autowired
	StudentService studentServcie;
	@Autowired
	BranchService branchService;
	@Autowired
	SemesterService semesterService;

	@GetMapping("/student")
	public String showAllCourses(HttpServletRequest request) {
		request.setAttribute("students", studentServcie.getAllStudents());
		request.setAttribute("mode", "ALL_STUDENTS");
		return "student";
	}

	@GetMapping("/addstudent")
	public String showStudentForm(Model model) {
		model.addAttribute("branches", branchService.getAllBranches());
		model.addAttribute("semesters", semesterService.getAllSemesters());
		return "add-student"; // Updated JSP file name
	}

	@PostMapping("/savestudent")
	public ModelAndView addStudent(Student student) {
		ModelAndView mav = new ModelAndView("add-student");
		// Check if student with same roll number already exists
		if (studentServcie.studentExists(student.getRollNo())) {
			mav = new ModelAndView("student");
			mav.addObject("students", studentServcie.getAllStudents());
			return mav;
		}
		studentServcie.addStudent(student);
		mav = new ModelAndView("student");
		mav.addObject("students", studentServcie.getAllStudents());
		return mav;
	}

	@GetMapping("/editstudent")
	public String editStudent(@RequestParam Long id, HttpServletRequest request) {
		request.setAttribute("student", studentServcie.getStudentById(id));
		request.setAttribute("branches", branchService.getAllBranches());
		request.setAttribute("semesters", semesterService.getAllSemesters());
		request.setAttribute("mode", "MODE_UPDATE");
		return "add-student";
	}

	@GetMapping("/deletestudent")
	public String deleteStudent(@RequestParam Long id) {
		studentServcie.deleteStudent(id);
		return "redirect:/student";
	}
}
