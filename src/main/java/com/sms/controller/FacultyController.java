package com.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sms.entity.Student;
import com.sms.services.BranchService;
import com.sms.services.SemesterService;
import com.sms.services.StudentService;

import java.util.List;

@Controller
public class FacultyController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private SemesterService semesterService;

    @GetMapping("/faculty")
    public String listStudents(Model model) {
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Faculty/student-list";
    }

    @GetMapping("/faculty/edit-student-semester")
    public String showEditStudentSemesterForm(@RequestParam("studentId") Long studentId, Model model) {
        Student student = studentService.getStudentByStudentId(studentId);
        model.addAttribute("student", student);
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Faculty/edit-student-semester";
    }

    @PostMapping("/faculty/update-student-semester")
    public String updateStudentSemester(Student student, @RequestParam("branchId") Long branchId,
                                        @RequestParam("semesterId") Long semesterId,
                                        RedirectAttributes redirectAttributes) {
        // Fetch existing student from DB
        Student existingStudent = studentService.getStudentByStudentId(student.getId());
        if (existingStudent == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Student not found");
            return "redirect:/faculty";
        }
        existingStudent.setBranch(branchService.getBranchById(branchId).orElse(null));
        existingStudent.setSemester(semesterService.getSemesterById(semesterId));
        studentService.updateStudent(existingStudent);
        redirectAttributes.addFlashAttribute("successMessage", "Student semester updated successfully");
        return "redirect:/faculty";
    }
}
