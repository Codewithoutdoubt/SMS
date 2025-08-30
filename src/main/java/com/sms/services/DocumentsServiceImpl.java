package com.sms.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Documents;
import com.sms.repository.DocumentsRepository;

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
        existDocument.setProfileImage(document.getProfileImage());
        existDocument.setAadharNo(document.getAadharNo());
        existDocument.setAadharImage(document.getAadharImage());
        existDocument.setCastCertificateNo(document.getCastCertificateNo());
        existDocument.setCastCertificateImage(document.getCastCertificateImage());
        existDocument.setResidenceCertificateNo(document.getResidenceCertificateNo());
        existDocument.setResidenceCertificateImage(document.getResidenceCertificateImage());
        existDocument.setIncomeCertificateNo(document.getIncomeCertificateNo());
        existDocument.setIncomeCertificateImage(document.getIncomeCertificateImage());
        existDocument.setTenthMarksheetNo(document.getTenthMarksheetNo());
        existDocument.setTenthMarksheetImage(document.getTenthMarksheetImage());
        existDocument.setTwelfthMarksheetNo(document.getTwelfthMarksheetNo());
        existDocument.setTwelfthMarksheetImage(document.getTwelfthMarksheetImage());
        existDocument.setTransferCertificateNo(document.getTransferCertificateNo());
        existDocument.setTransferCertificateImage(document.getTransferCertificateImage());

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

    @Override
    public void deleteDocumentsByStudentId(Long studentId) {
        Documents document = documentsRepository.findByStudentId(studentId);
        if (document != null) {
            documentsRepository.delete(document);
        }
    }
}
   
