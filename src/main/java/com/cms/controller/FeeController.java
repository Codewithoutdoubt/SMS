package com.cms.controller;

import com.cms.entity.Department;
import com.cms.entity.Fee;
import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.FeeService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
@RequestMapping("/fees")
public class FeeController {

    @Autowired
    private final FeeService feeService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private SemesterService semesterService;
    
    public FeeController(FeeService feeService) {
        this.feeService = feeService;
    }

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Fees Department");
        return obj;
    }

    @GetMapping
    public ModelAndView getAllStudents() {
        ModelAndView mav = new ModelAndView("Fees/fees");
        mav.addObject("students", studentService.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters());
        return mav;
    }

    @GetMapping("/{studentId}")
    public ModelAndView getFeesByStudentId(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Fees/fees-list");
        mav.addObject("fees", feeService.getFeesByStudentId(studentId));
        mav.addObject("student",studentService.getStudentById(studentId));
        return mav;
    }

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddFeeForm(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Fees/add-fees");
        mav.addObject("student", studentService.getStudentById(studentId));
        return mav;
    }

    @PostMapping
    public String addFee(@ModelAttribute Fee fee) {
        Fee savedFee = feeService.saveFee(fee);
        return "redirect:/fees/" + savedFee.getStudent().getId();
    }

    @GetMapping("/edit/{id}")
    public String showEditFeeForm(@PathVariable Long id, Model model) {
        Optional<Fee> fee = feeService.getFeeById(id);
        if (fee.isPresent()) {
            model.addAttribute("fee", fee.get());
            return "Fees/edit-fees";
        } else {
            return "redirect:/fees";
        }
    }

    @PostMapping("/update/{id}")
    public String updateFee(@PathVariable Long id, @ModelAttribute Fee fee, @RequestParam("studentId") Long studentId) {
        fee.setId(id);
        Student managedStudent = studentService.getStudentById(studentId);
        fee.setStudent(managedStudent);
        feeService.saveFee(fee);
        return "redirect:/fees/" + studentId;
    }

    @GetMapping("/delete/{id}")
    public String deleteFee(@PathVariable Long id) {
        feeService.deleteFee(id);
        return "redirect:/fees";
    }
}
