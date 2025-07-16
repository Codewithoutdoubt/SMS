package com.sms.controller;

import com.sms.entity.Subject;
import com.sms.services.BranchService;
import com.sms.services.SemesterService;
import com.sms.services.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/result/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private SemesterService semesterService;

    @GetMapping("/list")
    public String listSubjects(Model model) {
        List<Subject> subjects = subjectService.getAllSubjects();
        model.addAttribute("subjects", subjects);
        // Fetch branches and semesters for dropdowns
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Result/subject";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("subject", new Subject());
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Result/add_subject";
    }

    @PostMapping("/save")
    public String saveSubject(@ModelAttribute("subject") Subject subject) {
        subjectService.saveSubject(subject);
        return "redirect:/result/subject/list";
    }

    @GetMapping("/edit/{subjectCode}")
    public String showEditForm(@PathVariable("subjectCode") int id, Model model) {
        Subject subject = subjectService.getSubjectById(id).orElseThrow(() -> new IllegalArgumentException("Invalid subject code: " + id));
        model.addAttribute("subject", subject);
        return "Result/add_subject";
    }

    @GetMapping("/delete/{subjectCode}")
    public String deleteSubject(@PathVariable("id") int id) {
        subjectService.deleteSubjectById(id);
        return "redirect:/result/subject/list";
    }

    @GetMapping("/filter")
    public String filterSubjects(@RequestParam(required = false) Integer branchId, @RequestParam(required = false) Integer semesterId, Model model) {
        List<Subject> filteredSubjects = subjectService.getSubjectByBranchAndSemester(branchId, semesterId);
        model.addAttribute("subjects", filteredSubjects);
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        model.addAttribute("selectedBranchId", branchId);
        model.addAttribute("selectedSemesterId", semesterId);
        return "Result/subject";
    }
}
