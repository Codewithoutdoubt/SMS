package com.cms.services;

import java.util.List;
import com.cms.entity.Scholarship;

public interface ScholarshipService {
    List<Scholarship> getScholarshipsByStudentId(Long studentId);

    Scholarship addScholarship(Scholarship scholarship);
    Scholarship getScholarship(Long id);
    List<Scholarship> getAllScholarships();
}
