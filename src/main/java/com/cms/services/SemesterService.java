package com.cms.services;

import com.cms.entity.Semester;
import java.util.List;

public interface SemesterService {
    List<Semester> getAllSemesters();
    Semester getSemesterById(Long id);
    void saveSemester(Semester semester);
    void deleteSemester(Long id);
}
