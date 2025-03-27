package com.cms.services;

import com.cms.entity.Semester;
import java.util.List;
import java.util.Optional;

public interface SemesterService {
    List<Semester> getAllSemesters();
    Optional<Semester> getSemesterById(Long id);
    Semester saveSemester(Semester semester);
    void deleteSemester(Long id);
}
