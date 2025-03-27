package com.cms.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cms.entity.Scholarship;
import com.cms.repository.ScholarshipRepository;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {

    @Autowired
    private ScholarshipRepository scholarshipRepository;

    @Override
    public List<Scholarship> getScholarshipsByStudentId(Long studentId) {
        return scholarshipRepository.findByScholarId(studentId);
    }

    @Override
    public Scholarship addScholarship(Scholarship scholarship) {
        return scholarshipRepository.save(scholarship);
    }

    @Override
    public List<Scholarship> getAllScholarships() {
        List<Scholarship> scholarships = new ArrayList<>();
        scholarshipRepository.findAll().forEach(scholarships::add);
        return scholarships;
    }

    @Override
    public Scholarship getScholarship(Long id) {
        return scholarshipRepository.findById(id).orElse(null);
    }
}
