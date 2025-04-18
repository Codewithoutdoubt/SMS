package com.cms.services;

import com.cms.entity.Branch;
import com.cms.entity.Documents;
import com.cms.entity.Scholarship;
import com.cms.entity.Student;

import java.util.List;

public interface FilterService {
    List<Student> filterStudents(String branchCode, String semester, String admissionYear);
    List<Branch> filterBranches(String criteria);
    List<Documents> filterDocuments(String criteria);
    List<Scholarship> filterScholarships(String criteria);
}
