package com.cms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
            mav.addObject("students",studentService.getStudentById(studentId));
            return mav;
        }

    @PostMapping("/editdocument")
    public ModelAndView editDocument(@RequestParam("documentId") Long documentId) {
    // Fetch the document details using the documentId
    ModelAndView mav = new ModelAndView("edit-document-details");
    Documents document = documentsService.getDocumentById(documentId);
    mav.addObject("document",document); 
    return mav;  
    }
    

    @PostMapping("/update-document")
    public ModelAndView updateDoc(@RequestParam("documentId") Long documentId, 
                              @RequestParam("studentId") Long studentId, 
                              @ModelAttribute Documents updatedDocument) {
        documentsService.updateDocument(documentId,updatedDocument);
    return new ModelAndView("redirect:/scholarship/" + studentId);
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
            ModelAndView mav = new ModelAndView("scholarship-details");
            mav.addObject("student",studentService.getStudentById(studentId));
            return mav;
        }


    @GetMapping
    public ResponseEntity<List<Documents>> getAllDocuments() {
        List<Documents> documents = documentsService.getAllDocuments();
        return ResponseEntity.ok(documents);
    }

}