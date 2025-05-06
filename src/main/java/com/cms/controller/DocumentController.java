package com.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cms.entity.Documents;
import com.cms.entity.Student; // Import Student entity
import com.cms.services.DocumentsService;
import com.cms.services.StudentService; // Import StudentService

@RestController
@RequestMapping("/documents")
public class DocumentController {

    @Autowired
    private DocumentsService documentsService;

    @Autowired
    private StudentService studentService; // Add this line

    @PostMapping
    public ResponseEntity<Documents> createDocument(@RequestBody Documents document) {
        Documents createdDocument = documentsService.createDocument(document);
        return ResponseEntity.ok(createdDocument);
    }

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddDocumentForm(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/add-documents");
        mav.addObject("students", studentService.getStudentById(studentId));
        return mav;
    }

    
    @PostMapping("/update-document")
    public ModelAndView updateDoc(@RequestParam("documentId") Long documentId,
            @RequestParam("studentId") Long studentId,
            @ModelAttribute Documents updatedDocument) {
        documentsService.updateDocument(documentId, updatedDocument);
        return new ModelAndView("redirect:/admission");
    }

    @GetMapping("/editdocument")
    public ModelAndView editDocument(@RequestParam("documentId") Long documentId) {
        Documents document = documentsService.getDocumentById(documentId);
        ModelAndView mav = new ModelAndView("Admission/edit-document-details");
        mav.addObject("document", document);
        return mav;
    }


    @PostMapping("/save")
    public ModelAndView saveDocument(Documents document, @RequestParam("studentId") Long studentId) {
        Student student = studentService.getStudentById(studentId);
        document.setStudent(student);
        try {
            documentsService.createDocument(document);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // Redirect back to add documents page for the same student after saving document
        ModelAndView mav = new ModelAndView("redirect:/addstudent");
        mav.addObject("message", "Student details saved successfully");
        return mav;
    }

    @GetMapping("/student/{studentId}")
    public ModelAndView getDocumentsByStudent(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/student-documents");
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        mav.addObject("documents", documents);
        mav.addObject("studentId", studentId);
        return mav;
    }

}