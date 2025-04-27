package com.cms.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
        existDocument.setProfileId(document.getProfileId());
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
    public List<Documents> getAllDocuments() {
        return documentsRepository.findAll();
    }

    @Override
    public List<Documents> getDocumentsByStudentId(Long id) {
        return documentsRepository.findByStudentId(id);
    }

    @Override
    public List<Documents> filterDocuments(String criteria) {
        List<Documents> documents = documentsRepository.findAll();
        return documents.stream()
            .filter(document -> document.getProfileId().contains(criteria) || 
                               document.getAadharNo().contains(criteria) || 
                               document.getCasteCertificateNo().contains(criteria) || 
                               document.getIncomeCertificateNo().contains(criteria) || 
                               document.getResidenceCertificateNo().contains(criteria))
            .collect(Collectors.toList());
    }
}
