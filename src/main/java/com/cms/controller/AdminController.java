package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.services.ScholarshipService;
import com.cms.services.StudentService;
import com.cms.services.UserService;
import com.cms.entity.Department;
import com.cms.entity.Student;
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

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Admin Panel");
        return obj;
    }

    @GetMapping("/admin")
    public ModelAndView adminPage() {
        ModelAndView mav = new ModelAndView("Admin/admin");
        mav.addObject("users", userService.getAllUsers());
        mav.addObject("students", studentService.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters()); // Add semesters for filter
        return mav;
    }

    @RequestMapping("/admin-scholarship")
    public ModelAndView as() {
        ModelAndView mav = new ModelAndView("Admin/admin-scholarship");
        mav.addObject("scholarships", scholarshipService.getAllScholarships());
        return mav;
    }

    @GetMapping("/report/{id}")
    public ModelAndView getStudentReport(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("Admin/studentreport");
        mav.addObject("student", studentService.getStudentById(id));
        return mav;
    }
    // @GetMapping("/filter")
    // public String filterStudents(
    //     @RequestParam(required = false) String branchCode,
    //     @RequestParam(required = false) String semester,
    //     @RequestParam(required = false) String academicYear,
    //     Model model) {
    //     List<Student> filteredStudents = studentServcie.getFilteredStudents(branchCode, semester, academicYear, null);
    //     model.addAttribute("students", filteredStudents);
    //     model.addAttribute("branches", branchService.getAllBranches()); // Add branches for filter
    //     model.addAttribute("semesters", semesterService.getAllSemesters()); // Add semesters for filter
    //     model.addAttribute("mode", "FILTERED_STUDENTS");
    //     return "Admin/admin"; // Redirect to admin.jsp or the appropriate view
    // }


}
