package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;

import jakarta.servlet.http.HttpServletRequest;
@Controller
public class StudentController {

	
	@Autowired
	StudentService  studentServcie ; 
	@Autowired
	BranchService branchService;
	@Autowired
	SemesterService semesterService;
	
	@RequestMapping("/students")
	public String Student() {
		return "student-page"; // Updated JSP file name
	}
	@GetMapping("/addstudent")
    public String showStudentForm(Model model) {
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "add-student-page"; // Updated JSP file name
    }
	@PostMapping("/savestudent")
	public ModelAndView addStudent(Student student) {
		studentServcie.addStudent(student);
		ModelAndView mav = new ModelAndView("student-page"); // Updated JSP file name
		mav.addObject("students", studentServcie.getAllStudents());
		return mav;
	}
	
	
	@GetMapping("/showstudents")
	public String showAllCourses(HttpServletRequest request){
		request.setAttribute("students", studentServcie.getAllStudents());
		request.setAttribute("mode", "ALL_STUDENTS");
		return "allstudentspage" ; 
	}	
	@GetMapping("/showstudents/{id}")
	public String  getStudentProfile(@PathVariable("id") int id , HttpServletRequest request)
	{
		request.setAttribute("mode","MODE_STUDENT_PROFILE");
		request.setAttribute("student", studentServcie.getStudent(id));
		return "studentprofilepage" ;
	}
}
