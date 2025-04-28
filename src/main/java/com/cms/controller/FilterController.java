package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cms.entity.Department;
import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;

@Controller
public class FilterController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private BranchService branchService; // Add BranchService dependency

    @Autowired
    private SemesterService semesterService; // Add SemesterService dependency

    @GetMapping("/filter/{folder}/{viewname}/{departmentName}")
    public String filterStudentsWithFolder(
            @RequestParam(required = false) String branchCode,
            @RequestParam(required = false) String semester,
            @RequestParam(required = false) String academicYear,
            @PathVariable String folder,
            @PathVariable String viewname,
            @PathVariable String departmentName,
            Model model) {
        Department obj = new Department();
        obj.setName(departmentName);
        List<Student> filteredStudents = studentService.getFilteredStudents(branchCode, semester, academicYear, null);
        model.addAttribute("students", filteredStudents);
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        model.addAttribute("mode", "FILTERED_STUDENTS");
        model.addAttribute("department", obj );
        return folder + "/" + viewname;
    }
}