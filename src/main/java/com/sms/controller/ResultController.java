package com.sms.controller;
import com.sms.services.SubjectServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sms.entity.Result;
import com.sms.entity.Subject;
import com.sms.services.ResultService;
import com.sms.services.SemesterServiceImpl;
import com.sms.services.StudentService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;


@Controller
@RequestMapping("/result")
public class ResultController {

    private final SubjectServiceImpl subjectServiceImpl;

    private final SemesterServiceImpl semesterServiceImpl;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ResultService resultService;

    ResultController(SemesterServiceImpl semesterServiceImpl, SubjectServiceImpl subjectServiceImpl) {
        this.semesterServiceImpl = semesterServiceImpl;
        this.subjectServiceImpl = subjectServiceImpl;
    }

    @RequestMapping
    public String Students(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "Result/result";
    }

    @GetMapping("{studentId}")
    public String resiltList(@PathVariable Long studentId, Model model) {
        model.addAttribute("results", resultService.getResultsByStudentId(studentId));
        return "Result/result-list";
    }

    @GetMapping("add/{studentId}")
    public String addResult(@PathVariable Long studentId, Model model) {
        model.addAttribute("result", new Result());
        model.addAttribute("student", studentService.getStudentByStudentId(studentId));
        model.addAttribute("semesters", semesterServiceImpl.getAllSemesters());
        return "Result/add-result";
    }

    
@GetMapping("/subjects")
@ResponseBody
public List<Subject> getSubjects(@RequestParam Integer branchId, @RequestParam Integer semesterId) {
    return subjectServiceImpl.getSubjectByBranchAndSemester(branchId, semesterId);
}

@PostMapping("/save")
public String saveResult(@ModelAttribute("result") Result result) {
    resultService.saveResult(result);
    return "redirect:/result";
}
    
}