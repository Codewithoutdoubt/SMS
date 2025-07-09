package com.sms.services;

import java.util.List;
import java.util.Optional;

import com.sms.entity.Result;
import com.sms.entity.Student;

public interface ResultService {
    Result saveResult(Result result);
    Optional<Result> getResultById(Long id);
    List<Result> getAllResults();
    void deleteResult(Long id);
    List<Result> getResultsByStudentId(Long studentId);

    List<Result> getResultsByStudentIdOrderBySemesterIdAsc(Long studentId);
    Student getStudentByResultId(Long id);

    List<Result> getResultsByStudentIdAndSemesterId(Long studentId, Long semesterId);

    void deleteResultsByStudentId(Long studentId);
}
