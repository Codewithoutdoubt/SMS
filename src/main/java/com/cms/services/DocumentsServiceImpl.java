package com.cms.services;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.entity.Documents;
import com.cms.repository.DocumentsRepository;

@Service
public class DocumentsServiceImpl implements DocumentsService {

    @Autowired
    private DocumentsRepository documentsRepository;

    @Override
    public Documents createDocument(Documents document) {
        return documentsRepository.save(document);
    }

    @Override
    public Documents getDocumentById(Long id) {
        Optional<Documents> document = documentsRepository.findById(id);
        return document.orElse(null);
    }

    @Override
    public Documents updateDocument(Long id, Documents document) {
        Documents existDocument = getDocumentById(id);
        existDocument.setAadharNo(document.getAadharNo());
        existDocument.setCasteCertificateNo(document.getCasteCertificateNo());
        existDocument.setIncomeCertificateNo(document.getIncomeCertificateNo());
        existDocument.setResidenceCertificateNo(document.getResidenceCertificateNo());
        documentsRepository.save(existDocument);
        return existDocument;
    } 

    @Override
    public void deleteDocument(Long id) {
        documentsRepository.deleteById(id);
    }

    @Override
    public Documents getDocumentsByStudentId(Long id) {
        return documentsRepository.findByStudentId(id);
    }
}
   
