package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.cms.entity.Scholarship;
import com.cms.services.ScholarshipService;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ScholarshipController {

    @Autowired
    private ScholarshipService scholarshipService;

    @RequestMapping("/sc")
    public String requestMethodName() {
        return "scholarship";
    }
    @GetMapping("/scholarship")
    public ModelAndView getAllScholarships() {
        List<Scholarship> scholarships = scholarshipService.getAllScholarships();
        ModelAndView modelAndView = new ModelAndView("scholarship"); // Updated JSP file name
        modelAndView.addObject("scholarships", scholarships);
        return modelAndView;
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

    @PostMapping
    public String addScholarship(@ModelAttribute Scholarship scholarship) {
        scholarshipService.addScholarship(scholarship);
        return "redirect:/scholarships";
    }

    @GetMapping("/student/{studentId}")
    public ModelAndView getScholarshipsByStudentId(@PathVariable Long studentId) {
        List<Scholarship> scholarships = scholarshipService.getScholarshipsByStudentId(studentId);
        ModelAndView modelAndView = new ModelAndView("scholarship-list");
        modelAndView.addObject("scholarships", scholarships);
        return modelAndView;
    }

}
