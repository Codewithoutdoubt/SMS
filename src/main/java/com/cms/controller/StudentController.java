package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Department;
import com.cms.entity.Documents;
import com.cms.entity.Student;
import com.cms.services.BranchService;
import com.cms.services.DocumentsService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;

@Controller
public class StudentController {

    @Autowired
    StudentService studentServcie;
    @Autowired
    BranchService branchService;
    @Autowired
    SemesterService semesterService;
    @Autowired
    DocumentsService documentsService;

    @ModelAttribute("department")
    public Department populatedCommonObject(){
        Department obj = new Department();
        obj.setName("Admission Department");
        return obj;
    }

    @GetMapping("/admission")
    public ModelAndView adminPage() {
        ModelAndView mav = new ModelAndView("Admission/student");
        mav.addObject("students", studentServcie.getAllStudents()); // Add student data
        mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
        mav.addObject("semesters", semesterService.getAllSemesters()); // Add semesters for filter
        return mav;
    }

    @GetMapping("/addstudent")
    public String showStudentForm(Model model) {
        model.addAttribute("branches", branchService.getAllBranches());
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Admission/add-student"; // Updated JSP file name
    }

    @PostMapping("/savestudent")
    public ModelAndView addStudent(Student student) {

        // Check if student with same roll number already exists
        if (studentServcie.studentExists(student.getRollNo())) {
            ModelAndView mav = new ModelAndView("Admission/student");
            mav.addObject("students", studentServcie.getAllStudents());
            mav.addObject("branches", branchService.getAllBranches()); // Add branches for filter
            mav.addObject("semesters", semesterService.getAllSemesters());
            mav.addObject("error", "Student with the same roll number already exists.");
            return mav;
        }
        studentServcie.addStudent(student);
        ModelAndView mav = new ModelAndView("redirect:/documents/add/"+student.getId());
        return mav;
    }

    @GetMapping("/editstudent")
    public ModelAndView editStudent(@RequestParam("studentId") Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/edit-student");
        mav.addObject("student", studentServcie.getStudentById(studentId));
        mav.addObject("branches", branchService.getAllBranches());
        mav.addObject("semesters", semesterService.getAllSemesters());
        return mav;
    }

    @PostMapping("/updatestudent")
    public ModelAndView updateStudent(Student student, @RequestParam("branchId") Long branchId,
            @RequestParam("semesterId") Long semesterId) {
        ModelAndView mav;
        if (studentServcie.studentExistsForUpdate(student.getRollNo(), student.getId())) {
            mav = new ModelAndView("Admission/edit-student");
            mav.addObject("student", student);
            mav.addObject("branches", branchService.getAllBranches());
            mav.addObject("semesters", semesterService.getAllSemesters());
            mav.addObject("error", "Student with the same roll number already exists.");
            return mav;
        }
        student.setBranch(branchService.getBranchById(branchId).orElse(null));
        student.setSemester(semesterService.getSemesterById(semesterId));

        // Fetch existing student to preserve documents
        Student existingStudent = studentServcie.getStudentById(student.getId());
        if (existingStudent != null) {
            student.setDocuments(existingStudent.getDocuments());
        }

        studentServcie.updateStudent(student);
        Documents document = documentsService.getDocumentsByStudentId(student.getId());

        if (document != null) {
            mav = new ModelAndView("redirect:/documents/editdocument?documentId=" + document.getId());
        } else {
            mav = new ModelAndView("redirect:/documents/add/" + student.getId());
        }
        return mav;
    }


    @GetMapping("/deletestudent")
    public String deleteStudent(@RequestParam Long id) {
        studentServcie.deleteStudent(id);   
        return "redirect:/admission";
    }
    // Removed the conflicting getAllSemesters method
}
