package com.sms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Semester;
import com.sms.repository.SemesterRepository;

import java.util.List;

@Service
public class SemesterServiceImpl implements SemesterService {

    @Autowired
    private SemesterRepository semesterRepository;

    @Override
    public List<Semester> getAllSemesters() {
        return semesterRepository.findAll();
    }

    @Override
    public Semester getSemesterById(Long id) {
        return semesterRepository.findById(id).orElse(null);
    }

    @Override
    public void saveSemester(Semester semester) {
        semesterRepository.save(semester);
    }

    @Override
    public void deleteSemester(Long id) {
        semesterRepository.deleteById(id);
    }
}
