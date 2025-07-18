package com.cms.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Department;
import com.cms.entity.Student;
import com.cms.entity.Tc;
import com.cms.services.BranchService;
import com.cms.services.SemesterService;
import com.cms.services.StudentService;
import com.cms.services.UserService;

@Controller
public class AcademicController {

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private BranchService branchService;

    @Autowired
    private SemesterService semesterService;

    @Autowired
    private com.cms.services.ScholarshipService scholarshipService;

    @Autowired
    private com.cms.services.FeeService feeService;

    @Autowired
    private com.cms.services.ResultService resultService;

    @Autowired
    private com.cms.services.DocumentsService documentsService;

    @Autowired
    private com.cms.services.PlacementService placementService;

    @ModelAttribute("department")
    public Department populatedCommonObject() {
        Department obj = new Department();
        obj.setName("Academic Panel");
        return obj;
    }

    @GetMapping("/academic")
    public ModelAndView academicPage() {
        ModelAndView mav = new ModelAndView("Academic/welcome");
        mav.addObject("users", userService.getAllUsers());
        mav.addObject("students", studentService.getAllStudents());
        mav.addObject("branches", branchService.getAllBranches());
        mav.addObject("semesters", semesterService.getAllSemesters());
        return mav;
    }

    @GetMapping("/academicreport/{id}")
    public ModelAndView getAcademicReport(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("Academic/academicreport");
        com.cms.entity.Student student = studentService.getStudentById(id);
        mav.addObject("student", student);
        mav.addObject("fees", feeService.getFeesByStudentId(id));
        mav.addObject("results", resultService.getResultsByStudentId(id));
        mav.addObject("scholarships", scholarshipService.getScholarshipsByStudentId(id));
        mav.addObject("documents", documentsService.getDocumentsByStudentId(id));
        mav.addObject("placements", placementService.getPlacementsByStudentId(id));
        boolean tcDocumentSubmitted = !tcService.getTcByStudentId(id).isEmpty();
        mav.addObject("tcDocumentSubmitted", tcDocumentSubmitted);
        mav.addObject("tcList", tcService.getTcByStudentRollNo(student.getRollNo()));
        return mav;
    }

    @Autowired
    private com.cms.services.TcService tcService;

    @PostMapping("/academic/tc/submit")
    public ModelAndView submitTcDetails(@ModelAttribute Tc tc) {
        Long studentId = tc.getStudent().getId();
        Student student = studentService.getStudentById(studentId);
        tc.setStudent(student);
        // Set tcDocumentSubmissionDate to current date automatically
        tc.setTcDocumentSubmissionDate(new java.util.Date());
        tcService.saveTc(tc);
        return new ModelAndView("redirect:/academic");
    }

    @GetMapping("/academic/tc/form")
    public ModelAndView showTcForm(@org.springframework.web.bind.annotation.RequestParam Long studentId) {
        ModelAndView mav = new ModelAndView("Academic/tcdocumentform");
        mav.addObject("student", studentService.getStudentById(studentId));
        return mav;
    }

    @GetMapping("/academic/tc/edit")
    public ModelAndView editTcForm(@org.springframework.web.bind.annotation.RequestParam Long studentId) {
        ModelAndView mav = new ModelAndView("Academic/tcdocumentform");
        List<Tc> tcList = tcService.getTcByStudentId(studentId);
        com.cms.entity.Tc tc = tcList.isEmpty() ? new com.cms.entity.Tc() : tcList.get(0);
        mav.addObject("tc", tc);
        mav.addObject("student", studentService.getStudentById(studentId));
        return mav;
    }

    @GetMapping("/academic/passoutstudents")
    public ModelAndView passoutStudentList(
            @org.springframework.web.bind.annotation.RequestParam(required = false) String rollNo) {
        ModelAndView mav = new ModelAndView("Academic/passoutstudentlist");
        if (rollNo != null && !rollNo.isEmpty()) {
            mav.addObject("tcList", tcService.getTcByStudentRollNo(rollNo));
        } else {
            mav.addObject("tcList", tcService.getAllTcRecords());
        }
        mav.addObject("rollNo", rollNo);
        return mav;
    }
}
