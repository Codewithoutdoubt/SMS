package com.sms.services;

import com.sms.entity.Subject;
import java.util.List;
import java.util.Optional;

public interface SubjectService {
    Subject saveSubject(Subject subject);
    List<Subject> getAllSubjects();
    Optional<Subject> getSubjectById(int id);
    void deleteSubjectById(int id);
    List<Subject> getSubjectByBranchAndSemester(Integer branchId, Integer semesterId);
}
