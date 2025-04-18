package com.cms.services;

import java.util.List;
import com.cms.entity.Scholarship;

public interface ScholarshipService {
    List<Scholarship> getScholarshipsByStudentId(Long studentId);
    Scholarship addScholarship(Scholarship scholarship);
    Scholarship getScholarship(Long id);
    List<Scholarship> getAllScholarships();
    void saveScholarship(Scholarship scholarship, Long studentId);
    Scholarship updateScholarship(Scholarship scholarship);
    void deleteScholarship(Long id);
    List<Scholarship> getScholarshipsByRollNo(String rollNo);
    List<Scholarship> filterScholarships(String criteria); // New filtering method
}
