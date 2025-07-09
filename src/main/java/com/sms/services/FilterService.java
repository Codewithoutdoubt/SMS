package com.sms.services;

import java.util.List;

import com.sms.entity.Branch;
import com.sms.entity.Documents;
import com.sms.entity.Scholarship;
import com.sms.entity.Student;

public interface FilterService {
    List<Student> filterStudents(String branchCode, String semester, String admissionYear);
    List<Branch> filterBranches(String criteria);
    List<Documents> filterDocuments(String criteria);
    List<Scholarship> filterScholarships(String criteria);
}
