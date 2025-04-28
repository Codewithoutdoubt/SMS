package com.cms.controller;

import com.cms.entity.Department;
import com.cms.entity.Placement;
import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.PlacementService;
import com.cms.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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

    public PlacementController(PlacementService placementService) {
        this.placementService = placementService;
    }

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Placement Department");
        return obj;
    }

    @GetMapping
    public ModelAndView getAllStudents() {
        ModelAndView mav = new ModelAndView("Placement/placement");
        mav.addObject("students", studentService.getAllStudents());
        mav.addObject("branches", branchService.getAllBranches());
        mav.addObject("placements",placementService.getAllPlacements());
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
