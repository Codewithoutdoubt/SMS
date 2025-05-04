package com.cms.services;

import com.cms.entity.Result;
import com.cms.entity.Student;

import java.util.List;
import java.util.Optional;

public interface ResultService {
    Result saveResult(Result result);
    Optional<Result> getResultById(Long id);
    List<Result> getAllResults();
    void deleteResult(Long id);
    List<Result> getResultsByStudentId(Long studentId);

    List<Result> getResultsByStudentIdOrderBySemesterIdAsc(Long studentId);
    Student getStudentByResultId(Long id);

    List<Result> getResultsByStudentIdAndSemesterId(Long studentId, Long semesterId);
}
