package com.cms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Department;
import com.cms.entity.Placement;
import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.PlacementService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;

@Controller
@RequestMapping("/placement")
public class PlacementController {
    private static final Logger logger = LoggerFactory.getLogger(PlacementController.class);

    @Autowired
    private final PlacementService placementService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private SemesterService semesterService;

    public PlacementController(PlacementService placementService) {
        this.placementService = placementService;
    }

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Placement Department");
        return obj;
    }

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

    @GetMapping
    public ModelAndView getAllStudents() {
        ModelAndView mav = new ModelAndView("Placement/placement");
        List<Student> students = studentService.getAllStudents();
        List<Placement> placements = placementService.getAllPlacements();

        // Map student id to placement for quick lookup
        Map<Long, Placement> placementMap = new HashMap<>();
        for (Placement placement : placements) {
            placementMap.put(placement.getStudent().getId(), placement);
        }

        // Create list of DTOs combining student and placement info
        List<StudentPlacementDTO> studentPlacementDTOs = new ArrayList<>();
        for (Student student : students) {
            Placement placement = placementMap.get(student.getId());
            if (placement != null) {
                studentPlacementDTOs.add(new StudentPlacementDTO(student, placement.getCompanyName(), placement.getPackageAmount()));
            } else {
                studentPlacementDTOs.add(new StudentPlacementDTO(student, "", 0.0));
            }
        }

        mav.addObject("students", studentService.getAllStudents());
        mav.addObject("studentPlacements", studentPlacementDTOs);
        mav.addObject("branches", branchService.getAllBranches());
        mav.addObject("semesters", semesterService.getAllSemesters()); 
        return mav;
    }

    @GetMapping("/{studentId}")
    public ModelAndView getPlacementsByStudentId(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Placement/placement-list");
        mav.addObject("placements", placementService.getPlacementsByStudentId(studentId));
        mav.addObject("student", studentService.getStudentById(studentId));
        return mav;
    }

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddPlacementForm(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Placement/add-placement");
        mav.addObject("students", studentService.getStudentById(studentId));
        mav.addObject("placement", new Placement());
        return mav;
    }

    @PostMapping
    public String addPlacement(@ModelAttribute Placement placement, @RequestParam("studentId") Long studentId) {
        Student student = studentService.getStudentById(studentId);
        placement.setStudent(student);
        placementService.savePlacement(placement);
        return "redirect:/placement/" + studentId;
    }

    @GetMapping("/edit/{id}")
    public String showEditPlacementForm(@PathVariable Long id, Model model) {
        Optional<Placement> placement = placementService.getPlacementById(id);
        if (placement.isPresent()) {
            model.addAttribute("placement", placement.get());
            return "Placement/edit-placement";
        } else {
            return "redirect:/placement";
        }
    }

    @PostMapping("/update/{id}")
    public String updatePlacement(@PathVariable Long id, @ModelAttribute Placement placement, @RequestParam("studentId") Long studentId) {
        placement.setId(id);
        Student student = studentService.getStudentById(studentId);
        placement.setStudent(student);
        placementService.savePlacement(placement);
        return "redirect:/placement/" + studentId;
    }

    @GetMapping("/delete/{id}")
    public String deletePlacement(@PathVariable Long id) {
        placementService.deletePlacement(id);
        return "redirect:/placement";
    }
}
