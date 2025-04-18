package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.services.ScholarshipService;
import com.cms.services.StudentService;
import com.cms.services.UserService;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ScholarshipService scholarshipService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private BranchService branchService; // Add BranchService dependency

    @Autowired
    private SemesterService semesterService; // Add SemesterService dependency

    @GetMapping("/admin")
    public ModelAndView adminPage() {
        ModelAndView mav = new ModelAndView("admin");
        mav.addObject("users", userService.getAllUsers());
        mav.addObject("students", studentService.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters()); // Add semesters for filter
        return mav;
    }

    @RequestMapping("/admin-scholarship")
    public ModelAndView as() {
        ModelAndView mav = new ModelAndView("admin-scholarship");
        mav.addObject("scholarships", scholarshipService.getAllScholarships());
        return mav;
    }

    @GetMapping("/report/{id}")
    public ModelAndView getStudentReport(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("studentreport");
        mav.addObject("student", studentService.getStudentById(id));
        return mav;
    }

}
