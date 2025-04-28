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

    @Autowired
    private com.cms.services.PlacementService placementService;

    public static class StudentPlacementDTO {
        private Student student;
        private String companyName;
        private double packageAmount;

        public StudentPlacementDTO(Student student, String companyName, double packageAmount) {
            this.student = student;
            this.companyName = companyName;
            this.packageAmount = packageAmount;
        }

        public Student getStudent() {
            return student;
        }

        public String getCompanyName() {
            return companyName;
        }

        public double getPackageAmount() {
            return packageAmount;
        }
    }

    @GetMapping("/filter/{folder}/{viewname}")
    public String filterStudentsWithFolder(
            @RequestParam(required = false) String branchCode,
            @RequestParam(required = false) String semester,
            @RequestParam(required = false) String academicYear,
            @PathVariable String folder,
            @PathVariable String viewname,
            Model model) {
        List<Student> filteredStudents = studentService.getFilteredStudents(branchCode, semester, academicYear, null);

        // Map student id to placement for quick lookup
        List<com.cms.entity.Placement> placements = placementService.getAllPlacements();
        java.util.Map<Long, com.cms.entity.Placement> placementMap = new java.util.HashMap<>();
        for (com.cms.entity.Placement placement : placements) {
            placementMap.put(placement.getStudent().getId(), placement);
        }

        // Create list of DTOs combining student and placement info
        java.util.List<StudentPlacementDTO> studentPlacementDTOs = new java.util.ArrayList<>();
        for (Student student : filteredStudents) {
            com.cms.entity.Placement placement = placementMap.get(student.getId());
            if (placement != null) {
                studentPlacementDTOs.add(new StudentPlacementDTO(student, placement.getCompanyName(), placement.getPackageAmount()));
            } else {
                studentPlacementDTOs.add(new StudentPlacementDTO(student, "", 0.0));
            }
        }

        model.addAttribute("studentPlacements", studentPlacementDTOs);
        model.addAttribute("students", filteredStudents);
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        model.addAttribute("mode", "FILTERED_STUDENTS");
        return folder + "/" + viewname;
    }
}
