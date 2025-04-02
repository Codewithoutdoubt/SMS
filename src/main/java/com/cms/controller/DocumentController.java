package com.cms.controller;

import java.util.List;

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

        @PostMapping("/add")
        public ModelAndView postMethodName(@RequestParam("studentId") Long studentId) {
            ModelAndView mav = new ModelAndView("add-documents");
            mav.addObject("students",studentService.getStudent(studentId));
            return mav;
        }

    @GetMapping("/update")
    public ModelAndView updateDocument(@ModelAttribute Documents document, @RequestParam("documentId") Long documentId) {
        documentsService.updateDocument(documentId, document);
        ModelAndView mav = new ModelAndView("redirect:/documents");
        return mav;
    }

    @PostMapping("/save")
    public ModelAndView saveDocument(Documents document, @RequestParam("studentId") Long studentId) {
            Student student = studentService.getStudent(studentId);
            document.setStudent(student);
            documentsService.createDocument(document);
            ModelAndView mav = new ModelAndView("scholarship-details");
            mav.addObject("student",studentService.getStudent(studentId));
            return mav;
        }


    @GetMapping("/{id}")
    public ResponseEntity<Documents> getDocumentById(@PathVariable Long id) {
        Documents document = documentsService.getDocumentById(id);
        return document != null ? ResponseEntity.ok(document) : ResponseEntity.notFound().build();
    }


    @GetMapping
    public ResponseEntity<List<Documents>> getAllDocuments() {
        List<Documents> documents = documentsService.getAllDocuments();
        return ResponseEntity.ok(documents);
    }

}
