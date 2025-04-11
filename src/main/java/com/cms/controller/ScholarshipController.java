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

    @GetMapping
    public ModelAndView getAllStudents(
            @RequestParam(required = false) String branchCode,
            @RequestParam(required = false) String semester,
            @RequestParam(required = false) String cast,
            @RequestParam(required = false) String status) {
        
        ModelAndView mav = new ModelAndView("scholarship");
        mav.addObject("students", 
            studentService.getFilteredStudents(branchCode, semester, cast, status));
        return mav;
    }
  
    @GetMapping("/{id}")
    public ModelAndView getScholarshipDetails(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("scholarship-details");
        mav.addObject("student", studentService.getStudentById(id));
        mav.addObject("documents", documentsService.getDocumentByStudentId(id));
        mav.addObject("scholarships", scholarshipService.getScholarshipsByStudentId(id)); // Fetch scholarships
        return mav;
    }

    @GetMapping("/addapplication")
    public ModelAndView addApplication(@RequestParam("studentId") Long studentId){
        ModelAndView mav = new ModelAndView("add-scholarship");
        mav.addObject("student", studentId);
        return mav;
    }

    @PostMapping("/save")
    public ModelAndView saveScholarship(Scholarship scholarship, @RequestParam("studentId") Long studentId){
        Student student = studentService.getStudentById(studentId);
        scholarship.setStudent(student);
        scholarshipService.saveScholarship(scholarship, studentId);
        return new ModelAndView("redirect:/scholarship/"+ studentId);

    }

    @GetMapping("update/{id}")
    public ModelAndView updateScholarship(@PathVariable Long id){
        ModelAndView mav = new ModelAndView("update-application-details");
        return mav.addObject("scholarships", scholarshipService.getScholarship(id));
    }


    @PostMapping("/update-scholarship/{id}")
    public ModelAndView updateScholarship(@PathVariable Long id, 
                              @ModelAttribute("scholarships") Scholarship updatedScholarship) {
        Scholarship existing = scholarshipService.getScholarship(id);
        if (existing != null) {
            // Preserve the student relationship
            updatedScholarship.setStudent(existing.getStudent());
            // Set the ID to ensure we're updating the correct record
            updatedScholarship.setScholarshipId(id);
            // Update all fields
            Scholarship result = scholarshipService.updateScholarship(updatedScholarship);
            if (result != null) {
                return new ModelAndView("redirect:/scholarship/" + existing.getStudent().getId());
            }
        }
        return new ModelAndView("redirect:/scholarship");
    }


    @GetMapping("/admin-scholarship")
    public ModelAndView showScholarshipList(@RequestParam(required = false) String rollNo) {
        ModelAndView mav = new ModelAndView("admin-scholarship");
        List<Scholarship> scholarships;
        if (rollNo != null && !rollNo.isEmpty()) {
            scholarships = scholarshipService.getScholarshipsByRollNo(rollNo);
        } else {
            scholarships = scholarshipService.getAllScholarships();
        }
        mav.addObject("scholarships", scholarships);
        return mav;
    }

    @GetMapping("/delete/{id}")
    public ModelAndView deleteScholarship(@PathVariable Long id) {
        Scholarship scholarship = scholarshipService.getScholarship(id);
        if (scholarship != null) {
            Long studentId = scholarship.getStudent().getId();
            scholarshipService.deleteScholarship(id);
            return new ModelAndView("redirect:/scholarship/" + studentId);
        }
        return new ModelAndView("redirect:/scholarship");
    }
}
