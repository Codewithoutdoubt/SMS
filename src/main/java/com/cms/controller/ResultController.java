package com.cms.controller;

import com.cms.entity.Result;
import com.cms.services.BranchService;
import com.cms.services.ResultService;
import com.cms.services.ScholarshipService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;
import com.cms.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/result")
public class ResultController {
    @Autowired
    private final ResultService resultService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private BranchService branchService; // Add BranchService dependency
    @Autowired
    private SemesterService semesterService; // Add SemesterService dependency
    
    public ResultController(ResultService resultService) {
        this.resultService = resultService;
    }

    @GetMapping
    public ModelAndView getAllResults() {
        ModelAndView mav = new ModelAndView("Result/result");
        mav.addObject("students", studentService.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters()); 
        return mav; // JSP page to display results
    }

    @GetMapping("/{id}")
    public String getResultById(@PathVariable Long id, Model model) {
        Optional<Result> result = resultService.getResultById(id);
        if (result.isPresent()) {
            model.addAttribute("result", result.get());
            return "Result/result-detail"; // JSP page for single result detail
        } else {
            return "redirect:/results";
        }
    }

    @GetMapping("/add")
    public String showAddResultForm(Model model) {
        model.addAttribute("result", new Result());
        return "Result/add-result"; // JSP page for adding result
    }

    @PostMapping
    public String addResult(@ModelAttribute Result result) {
        resultService.saveResult(result);
        return "redirect:/results";
    }

    @GetMapping("/edit/{id}")
    public String showEditResultForm(@PathVariable Long id, Model model) {
        Optional<Result> result = resultService.getResultById(id);
        if (result.isPresent()) {
            model.addAttribute("result", result.get());
            return "Result/edit-result"; // JSP page for editing result
        } else {
            return "redirect:/results";
        }
    }

    @PostMapping("/update/{id}")
    public String updateResult(@PathVariable Long id, @ModelAttribute Result result) {
        result.setId(id);
        resultService.saveResult(result);
        return "redirect:/results";
    }

    @GetMapping("/delete/{id}")
    public String deleteResult(@PathVariable Long id) {
        resultService.deleteResult(id);
        return "redirect:/results";
    }
}
