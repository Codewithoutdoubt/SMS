package com.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sms.entity.Department;
import com.sms.services.BranchService;
import com.sms.services.DocumentsService;
import com.sms.services.FeeService;
import com.sms.services.PlacementService;
import com.sms.services.ResultService;
import com.sms.services.ScholarshipService;
import com.sms.services.SemesterService;
import com.sms.services.StudentService;
import com.sms.services.UserService;


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

    @Autowired
    private FeeService feeService; // Add FeeService dependency

    @Autowired
    private ResultService resultService; // Add ResultService dependency


    @Autowired
    private DocumentsService documentsService; // Add DocumentsService dependency
    @Autowired
    private PlacementService placementService;

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
        mav.addObject("fees", feeService.getFeesByStudentId(id));
        mav.addObject("results", resultService.getResultsByStudentId(id));
        mav.addObject("scholarships", scholarshipService.getScholarshipsByStudentId(id));
        // mav.addObject("documents", documentsService.getDocumentsByStudentId(id));
        mav.addObject("placements", placementService.getPlacementsByStudentId(id));
        return mav;
    }

    @GetMapping("/delete-student/{studentId}")
    public String deleteStudent(@PathVariable Long studentId) {
        studentService.deleteStudent(studentId);
        return "redirect:/admin";
    }


}
