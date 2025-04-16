package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import com.cms.entity.Scholarship;
import com.cms.entity.Student;
import com.cms.services.DocumentsService;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;
import com.cms.services.ScholarshipService;
import com.cms.services.StudentService;

@Controller
@RequestMapping("/scholarship")
public class ScholarshipController {

    @Autowired
    private ScholarshipService scholarshipService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private DocumentsService documentsService; 

    @Autowired
    private BranchService branchService; // New service for branches
    @Autowired
    private SemesterService semesterService; // New service for semesters

    @GetMapping
    public ModelAndView getAllStudents(
            @RequestParam(required = false) String branchCode,
            @RequestParam(required = false) String semester,
            @RequestParam(required = false) String cast,
            @RequestParam(required = false) String status) {
        
        ModelAndView mav = new ModelAndView("scholarship");
        mav.addObject("students", 
            studentService.getFilteredStudents(branchCode, semester, cast, status));
        
        // Fetch filter options
        mav.addObject("branches", branchService.getAllBranches());
        mav.addObject("semesters", semesterService.getAllSemesters());
        mav.addObject("castes", List.of("General", "OBC", "SC", "ST")); // Static list for castes

        return mav;
    }
  
    // ... (rest of the controller methods remain unchanged)
}
