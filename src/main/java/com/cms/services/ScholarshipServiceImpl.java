package com.cms.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.entity.Scholarship;
import com.cms.repository.ScholarshipRepository;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {

    @Autowired
    private ScholarshipRepository scholarshipRepository;

    @Override
    public Scholarship addScholarship(Scholarship scholarship) {
        return scholarshipRepository.save(scholarship);
    }

    @Override
    public List<Scholarship> getAllScholarships() {
        return scholarshipRepository.findAll();
    }

    @Override
    public Scholarship getScholarship(Long id) {
        return scholarshipRepository.findById(id).orElse(null);
    }

    @Override
    public void saveScholarship(Scholarship scholarship, Long studentId) {
        scholarshipRepository.save(scholarship);
    }

    @Override
    public List<Scholarship> getScholarshipsByStudentId(Long studentId) {
        return scholarshipRepository.findByStudentId(studentId);
    }

    @Override
    public List<Scholarship> getScholarshipsByRollNo(String rollNo) {
        return scholarshipRepository.findByStudentRollNo(rollNo);
    }

    @Override
    public List<Scholarship> getScholarshipsByApplicationNo(String applicationNo) {
        return scholarshipRepository.findByApplicationNo(applicationNo);
    }

    @Override
    public Scholarship updateScholarship(Scholarship scholarship) {
        if (scholarship == null || scholarship.getScholarshipId() == null) {
            return null;
        }
        if (scholarshipRepository.existsById(scholarship.getScholarshipId())) {
            return scholarshipRepository.save(scholarship);
        }
        return null;
    }

    @Override
    public void deleteScholarship(Long id) {
        if (id != null && scholarshipRepository.existsById(id)) {
            scholarshipRepository.deleteById(id);
        }
    }

    @Override
    public List<Scholarship> filterScholarships(String criteria) {
        List<Scholarship> scholarships = scholarshipRepository.findAll();
        return scholarships.stream()
            .filter(scholarship -> scholarship.getApplicationType().contains(criteria) || 
                                  scholarship.getApplicationStatus().contains(criteria))
            .collect(Collectors.toList());
    }
}
