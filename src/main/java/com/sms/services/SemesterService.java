package com.sms.services;

import java.util.List;

import com.sms.entity.Semester;

public interface SemesterService {
    List<Semester> getAllSemesters();
    Semester getSemesterById(Long id);
    void saveSemester(Semester semester);
    void deleteSemester(Long id);
}
