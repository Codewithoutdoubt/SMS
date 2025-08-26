package com.sms.services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Result;
import com.sms.entity.SubjectMark;
import com.sms.repository.ResultRepository;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    private  ResultRepository resultRepository;

    @Override
    public List<Result> getResultsByStudentId(Long studentId) {
        return resultRepository.findByStudentId(studentId);
    }
    @Override
    public void deleteById(Long id) {
        resultRepository.deleteById(id);
    }
    @Override
    public List<Result> findAll() {
        return resultRepository.findAll();
    }

    @Override
    public void saveResult(Result result) {
        if (result.getSubjects() != null) {
            for (SubjectMark subjectMark : result.getSubjects()) {
                subjectMark.setResult(result);
            }
        }
        resultRepository.save(result);
    }


    public void deleteResultsByStudentId(Long studentId){
        resultRepository.findByStudentId(studentId).forEach(result -> resultRepository.deleteById(result.getId()));
    }

}