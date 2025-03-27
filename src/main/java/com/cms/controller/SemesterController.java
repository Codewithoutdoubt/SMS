package com.cms.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cms.entity.Semester;
import com.cms.services.SemesterService;

@Controller
@RequestMapping("/semesters")
public class SemesterController {

    @Autowired
    private SemesterService semesterService;

    @GetMapping
    public String listSemesters(Model model) {
        List<Semester> semesters = semesterService.getAllSemesters();
        model.addAttribute("semesters", semesters);
        return "semesterList";
    }

    @GetMapping("/add")
    public String showAddSemesterForm(Model model) {
        model.addAttribute("semester", new Semester());
        return "addSemester";
    }

    @PostMapping("/save")
    public String saveSemester(@ModelAttribute Semester semester) {
        semesterService.saveSemester(semester);
        return "redirect:/semesters";
    }

    @GetMapping("/edit/{id}")
    public String showEditSemesterForm(@PathVariable Long id, Model model) {
        Optional<Semester> semester = semesterService.getSemesterById(id);
        semester.ifPresent(s -> model.addAttribute("semester", s));
        return "editSemester";
    }

    @PostMapping("/update")
    public String updateSemester(@ModelAttribute Semester semester) {
        semesterService.saveSemester(semester);
        return "redirect:/semesters";
    }

    @GetMapping("/delete/{id}")
    public String deleteSemester(@PathVariable Long id) {
        semesterService.deleteSemester(id);
        return "redirect:/semesters";
    }
}
