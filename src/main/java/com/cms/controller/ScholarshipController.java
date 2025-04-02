package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
  
    @GetMapping("/{id}")
    public ModelAndView getScholarshipDetails(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("scholarship-details");
        mav.addObject("student", studentService.getStudent(id));
        mav.addObject("scholarships", scholarshipService.getScholarshipsByStudentId(id)); // Fetch scholarships
        return mav;
    }
}
