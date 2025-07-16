package com.sms.services;

import com.sms.entity.Subject;
import com.sms.repository.SubjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectRepository subjectRepository;

    @Override
    public Subject saveSubject(Subject subject) {
        return subjectRepository.save(subject);
    }

    @Override
    public List<Subject> getAllSubjects() {
        return subjectRepository.findAll();
    }

    @Override
    public void deleteSubjectById(int id) {
        subjectRepository.deleteById(id);
    }

    @Override
    public List<Subject> getSubjectByBranchAndSemester(Integer branchId, Integer semesterId) {
        return subjectRepository.findByBranchAndSemester(branchId, semesterId);
    }

    @Override
    public Optional<Subject> getSubjectById(int id) {
        return subjectRepository.findById(id);
        
    }
}