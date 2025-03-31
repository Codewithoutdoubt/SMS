package com.cms.controller;

import com.cms.entity.Documents;
import com.cms.services.DocumentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/documents")
public class DocumentController {

    @Autowired
    private DocumentsService documentsService;

    @PostMapping
    public ResponseEntity<Documents> createDocument(@RequestBody Documents document) {
        Documents createdDocument = documentsService.createDocument(document);
        return ResponseEntity.ok(createdDocument);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Documents> getDocumentById(@PathVariable Long id) {
        Documents document = documentsService.getDocumentById(id);
        return document != null ? ResponseEntity.ok(document) : ResponseEntity.notFound().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Documents> updateDocument(@PathVariable Long id, @RequestBody Documents document) {
        Documents updatedDocument = documentsService.updateDocument(id, document);
        return updatedDocument != null ? ResponseEntity.ok(updatedDocument) : ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteDocument(@PathVariable Long id) {
        documentsService.deleteDocument(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping
    public ResponseEntity<List<Documents>> getAllDocuments() {
        List<Documents> documents = documentsService.getAllDocuments();
        return ResponseEntity.ok(documents);
    }
}
