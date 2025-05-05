package com.cms.services;

import com.cms.entity.Documents;

public interface DocumentsService {
    Documents createDocument(Documents document);
    Documents getDocumentById(Long id);
    Documents updateDocument(Long id, Documents document);
    void deleteDocument(Long id);
    Documents getDocumentsByStudentId(Long id);

    void deleteDocumentsByStudentId(Long studentId);
}
