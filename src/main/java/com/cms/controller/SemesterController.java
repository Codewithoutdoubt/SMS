package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cms.entity.Department;
import com.cms.entity.Semester;
import com.cms.services.SemesterService;

@Controller
@RequestMapping("/semesters")
public class SemesterController {

    @Autowired
    private SemesterService semesterService;

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Admin Panel");
        return obj;
    }
    
    @GetMapping
    public String listSemesters(Model model) {
        List<Semester> semesters = semesterService.getAllSemesters();
        model.addAttribute("semesters", semesters);
        return "Admin/view-semesters";
    }

    @GetMapping("/add")
    public String showSemesterForm(Model model) {
        model.addAttribute("semester", new Semester());
        return "Admin/add-semester";
    }

    @GetMapping("/edit/{id}")
    public String showSemesterForm(@PathVariable Long id, Model model) {
        Semester semester = semesterService.getSemesterById(id);
        model.addAttribute("semester", semester);
        return "Admin/add-semester";
    }

    @PostMapping("/save")
    public String saveSemester(@ModelAttribute Semester semester, RedirectAttributes redirectAttributes) {
        try {
            semesterService.saveSemester(semester);
            redirectAttributes.addFlashAttribute("successMessage", "Semester saved successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error saving semester: " + e.getMessage());
        }
        return "redirect:/semesters";
    }

    @PostMapping("/update")
    public String updateSemester(@ModelAttribute Semester semester, RedirectAttributes redirectAttributes) {
        try {
            semesterService.saveSemester(semester);
            redirectAttributes.addFlashAttribute("successMessage", "Semester updated successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating semester: " + e.getMessage());
        }
        return "redirect:/semesters";
    }

    @GetMapping("/delete/{id}")
    public String deleteSemester(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            semesterService.deleteSemester(id);
            redirectAttributes.addFlashAttribute("successMessage", "Semester deleted successfully");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", 
                "Error deleting semester: " + e.getMessage() + 
                ". Please ensure no students or courses are associated with this semester.");
        }
        return "redirect:/semesters";
    }
}
