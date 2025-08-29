package com.sms.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sms.entity.Result;
import com.sms.entity.Subject;
import com.sms.services.ResultService;
import com.sms.services.SemesterService;
import com.sms.services.StudentService;
import com.sms.services.SubjectService;


@Controller
@RequestMapping("/result")
public class ResultController {
    @Autowired
    private SubjectService subjectService;
    @Autowired    
    private SemesterService semesterService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ResultService resultService;

    // Directory to store uploaded images
    private static final String UPLOAD_DIR = "src/main/webapp/static/images/results/";

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
        model.addAttribute("semesters", semesterService.getAllSemesters());
        return "Result/add-result";
    }

    @GetMapping("/subjects")
    @ResponseBody
    public List<Subject> getSubjects(@RequestParam Integer branchId, @RequestParam Integer semesterId) {
        return subjectService.getSubjectByBranchAndSemester(branchId, semesterId);
    }

    @PostMapping("/save")
    public String saveResult(@ModelAttribute("result") Result result,
            @RequestParam("resultImage") MultipartFile resultImage, RedirectAttributes redirectAttributes) {
        try {
            if (!resultImage.isEmpty()) {
                try {
                    // Create upload directory if it doesn't exist
                    java.nio.file.Path uploadPath = Paths.get(UPLOAD_DIR);
                    if (!Files.exists(uploadPath, LinkOption.NOFOLLOW_LINKS)) {
                        Files.createDirectories(uploadPath);
                    }

                    // Generate unique filename
                    String originalFilename = resultImage.getOriginalFilename();
                    String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
                    String uniqueFilename = UUID.randomUUID().toString() + fileExtension;

                    // Save the file
                    Path filePath = uploadPath.resolve(uniqueFilename);
                    Files.copy(resultImage.getInputStream(), filePath);

                    // Set the image path in the result entity
                    result.setImagePath("/static/images/results/" + uniqueFilename);

                } catch (IOException e) {
                    e.printStackTrace();
                    // Handle file upload error
                }
            }

            resultService.saveResult(result);
            return "redirect:/result";
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("errorMessage", "result already saved");
            return "redirect:/result/add/" + result.getStudent().getStudentId();
        }
    }

    @GetMapping("edit/{resultId}")
    public String editResult(@PathVariable Long resultId,Model model){
        Result result = resultService.getResultById(resultId);
        model.addAttribute("semesters",semesterService.getAllSemesters());
        model.addAttribute("subjects",subjectService.getSubjectByBranchAndSemester(result.getStudent().getBranch().getId().intValue(), result.getSemester().getId().intValue()));
        model.addAttribute("result",result);
        return "Result/edit-result";
    }

    @PostMapping("/update")
    public String updateResult(@ModelAttribute("result") Result result,
            @RequestParam("resultImage") MultipartFile resultImage, RedirectAttributes redirectAttributes) {
        try {
            if (!resultImage.isEmpty()) {
                try {
                    // Create upload directory if it doesn't exist
                    java.nio.file.Path uploadPath = Paths.get(UPLOAD_DIR);
                    if (!Files.exists(uploadPath, LinkOption.NOFOLLOW_LINKS)) {
                        Files.createDirectories(uploadPath);
                    }

                    // Generate unique filename
                    String originalFilename = resultImage.getOriginalFilename();
                    String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
                    String uniqueFilename = UUID.randomUUID().toString() + fileExtension;

                    // Save the file
                    Path filePath = uploadPath.resolve(uniqueFilename);
                    Files.copy(resultImage.getInputStream(), filePath);

                    // Set the image path in the result entity
                    result.setImagePath("/static/images/results/" + uniqueFilename);

                } catch (IOException e) {
                    e.printStackTrace();
                    // Handle file upload error
                }
            }
            resultService.updateResult(result);
            return "redirect:/result";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error updating result: " + e.getMessage());
            return "redirect:/result/edit/" + result.getId();
        }
    }

}
