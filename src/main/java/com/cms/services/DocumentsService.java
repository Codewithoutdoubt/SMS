package com.cms.services;

import com.cms.entity.Documents;
import java.util.List;

public interface DocumentsService {
    Documents createDocument(Documents document);
    Documents getDocumentById(Long id);
    Documents updateDocument(Long id, Documents document);
    void deleteDocument(Long id);
    List<Documents> getAllDocuments();
    Object getDocumentByStudentId(Long id);
    List<Documents> filterDocuments(String criteria); // New filtering method
}
