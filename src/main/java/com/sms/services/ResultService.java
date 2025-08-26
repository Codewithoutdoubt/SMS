package com.sms.services;
import java.util.List;
import com.sms.entity.Result;


public interface ResultService {
    List<Result> getResultsByStudentId(Long studentId);
    abstract List<Result> findAll();
    void deleteById(Long id);
    void deleteResultsByStudentId(Long studentId);
    void saveResult(Result result);

}