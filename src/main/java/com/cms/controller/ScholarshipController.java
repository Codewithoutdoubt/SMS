package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Scholarship;
import com.cms.services.ScholarshipService;
import com.cms.services.StudentService;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipController {

    @Autowired
    private ScholarshipService scholarshipService;

    @Autowired
    private StudentService studentService;

    @GetMapping
    public ModelAndView getAllStudents() {
        ModelAndView mav = new ModelAndView("scholarship-home");
        mav.addObject("students", studentService.getAllStudents());
        return mav;
    }
  
    @GetMapping("/scholarship-details")
    public String getScholarshipDetails(){
        System.out.println("Error");
        return "scholarship-details";
    }

    @GetMapping("/{id}")
    public ModelAndView getScholarship(@PathVariable Long id) {
        Scholarship scholarship = scholarshipService.getScholarship(id);
        ModelAndView modelAndView = new ModelAndView("scholarship-details-page"); // Updated JSP file name
        modelAndView.addObject("scholarship", scholarship);
        return modelAndView;
    }

    @GetMapping("/student/{studentId}")
    public ModelAndView getScholarshipsByStudentId(@PathVariable Long studentId) {
        List<Scholarship> scholarships = scholarshipService.getScholarshipsByStudentId(studentId);
        ModelAndView modelAndView = new ModelAndView("scholarship-list");
        modelAndView.addObject("scholarships", scholarships);
        return modelAndView;
    }

}
