package com.sms.controller;

import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sms.entity.Department;
import com.sms.entity.Result;
import com.sms.entity.Student;
import com.sms.entity.Subject;
import com.sms.services.BranchService;
import com.sms.services.ResultService;
import com.sms.services.SemesterService;
import com.sms.services.StudentService;
import com.sms.services.SubjectService;

@Controller
@RequestMapping("/result")
public class ResultController {
    private static final Logger logger = LoggerFactory.getLogger(ResultController.class);

    @Autowired
    private final ResultService resultService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private BranchService branchService; // Add BranchService dependency
    @Autowired
    private SemesterService semesterService; // Add SemesterService dependency
    @Autowired
    private SubjectService subjectService; // Add SubjectService dependency
    
    public ResultController(ResultService resultService) {
        this.resultService = resultService;
    }

    // New endpoint to get subjects by branch and semester
    @GetMapping("/subjects")
    @ResponseBody
    public List<Subject> getSubjectsByBranchAndSemester(@RequestParam("branchId") Integer branchId,
                                                        @RequestParam("semesterId") Integer semesterId) {
        // int branchIdInt = Integer.valueOf(branchId);
        // String semesterIdStr = String.valueOf(semesterId);

                                                            
        for (int i = 1; i <= 100; i++) {
            System.out.println(i);
        }

        return subjectService.getSubjectByBranchAndSemester(branchId, semesterId);
    }

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Result Department");
        return obj;
    }

    @GetMapping
    public ModelAndView getAllStudents() {
        ModelAndView mav = new ModelAndView("Result/result");
        mav.addObject("students", studentService.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters()); 
        return mav; // JSP page to display results
    }

    @GetMapping("/{studentId}")
    public ModelAndView getResultsByStudentId(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Result/result-list");
        mav.addObject("results", resultService.getResultsByStudentIdOrderBySemesterIdAsc(studentId));
        mav.addObject("studentsId", studentId);
        mav.addObject("subjects", subjectService.getAllSubjects()); // Add subjects to model
        return mav; // JSP page for list of results by student
    }

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddResultForm(@PathVariable Long studentId) {
        logger.info("Student ID: {}", studentId);
        ModelAndView mav = new ModelAndView("Result/add-result");
        mav.addObject("semesters", semesterService.getAllSemesters());
        Result result = new Result();
        if (studentId != null) {
            Student student = studentService.getStudentById(studentId);
            if (student != null) {
                result.setStudent(student);
            }
            
        }
        mav.addObject("result", result);
        return mav;
    }

    @PostMapping
    public String addResult(@ModelAttribute Result result, Model model) {
        Long studentId = null;
        if (result.getStudent() != null) {
            studentId = result.getStudent().getId();
        }
        if (studentId != null) {
            Student managedStudent = studentService.getStudentById(studentId);
            result.setStudent(managedStudent);

            // Check for duplicate result for same student and semester
            Long semesterId = result.getSemester() != null ? result.getSemester().getId() : null;
            if (semesterId != null) {
                var existingResults = resultService.getResultsByStudentIdAndSemesterId(studentId, semesterId);
                if (existingResults != null && !existingResults.isEmpty()) {
                    model.addAttribute("errorMessage", "Result for this student and semester already exists.");
                    model.addAttribute("semesters", semesterService.getAllSemesters());
                    model.addAttribute("result", result);
                    return "Result/add-result";
                }
            }
        }
        Result savedResult = resultService.saveResult(result);
        return "redirect:/result/" + savedResult.getStudent().getId();
    }

    @GetMapping("/edit/{id}")
    public String showEditResultForm(@PathVariable Long id, Model model) {
        Optional<Result> result = resultService.getResultById(id);
        if (result.isPresent()) {
            model.addAttribute("result", result.get());
            model.addAttribute("semesters", semesterService.getAllSemesters());
            return "Result/edit-result"; // JSP page for editing result
        } else {
            return "redirect:/result";
        }
    }

    @PostMapping("/update/{id}")
    public String updateResult(@PathVariable Long id, @ModelAttribute Result result, @RequestParam("studentId") Long studentId, Model model) {
        result.setId(id);
        Student managedStudent = studentService.getStudentById(studentId);
        result.setStudent(managedStudent);

        // Check for duplicate result for same student and semester excluding current result
        Long semesterId = result.getSemester() != null ? result.getSemester().getId() : null;
        if (semesterId != null) {
            var existingResults = resultService.getResultsByStudentIdAndSemesterId(studentId, semesterId);
            if (existingResults != null && !existingResults.isEmpty()) {
                boolean hasOther = existingResults.stream().anyMatch(r -> !r.getId().equals(id));
                if (hasOther) {
                    model.addAttribute("errorMessage", "Result for this student and semester already exists.");
                    model.addAttribute("semesters", semesterService.getAllSemesters());
                    model.addAttribute("result", result);
                    return "Result/edit-result";
                }
            }
        }

        resultService.saveResult(result);
        return "redirect:/result/" + studentId ;
    }

    @GetMapping("/delete/{id}")
    public String deleteResult(@PathVariable Long id) {
        resultService.deleteResult(id);
        return "redirect:/result";
    }

}